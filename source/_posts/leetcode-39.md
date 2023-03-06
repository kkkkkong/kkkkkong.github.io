---
title: leetcode 39
tags: 刷题
category: leetcode
abbrlink: 4003
date: 2023-02-13 10:23:12
---

## 题目描述

#### [39. 组合总和](https://leetcode.cn/problems/combination-sum/)



给你一个 **无重复元素** 的整数数组 `candidates` 和一个目标整数 `target` ，找出 `candidates` 中可以使数字和为目标数 `target` 的 所有 **不同组合** ，并以列表形式返回。你可以按 **任意顺序** 返回这些组合。

`candidates` 中的 **同一个** 数字可以 **无限制重复被选取** 。如果至少一个数字的被选数量不同，则两种组合是不同的。 

对于给定的输入，保证和为 `target` 的不同组合数少于 `150` 个。

 

**示例 1：**

```
输入：candidates = [2,3,6,7], target = 7
输出：[[2,2,3],[7]]
解释：
2 和 3 可以形成一组候选，2 + 2 + 3 = 7 。注意 2 可以使用多次。
7 也是一个候选， 7 = 7 。
仅有这两种组合。
```





## 解题思路

1. 回溯+深度优先搜索+递归

<img src="https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20230213102600206.png" alt="image-20230213102600206" style="zoom: 33%;" />

图片来源：题解

使用一个数字，target做减法，不断减少直到target<=0，但这样做会出现重复路径，因此需要去重

去重方法为：同一层的节点，已经使用过的数字不在考虑，也即

<img src="https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20230213102848235.png" alt="image-20230213102848235" style="zoom:33%;" />



> 执行用时：2 ms, 在所有 Java 提交中击败了75.79%的用户
>
> 内存消耗：41.6 MB, 在所有 Java 提交中击败了82.05%的用户
>
> 通过测试用例：160 / 160
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
        List<List<Integer>> ans=new ArrayList();
        int len=candidates.length;

        ArrayDeque<Integer> path=new ArrayDeque();
        dfs(candidates,0,len,path,target,ans);
        return ans;

    }
    public void dfs(int [] candidates,int begin,int len,ArrayDeque<Integer> path,int target,List<List<Integer>> ans){
        if(target<0){
            return ;
        }
        if(target==0){
            ans.add(new ArrayList(path));
            return ;
        }
        for(int i=begin;i<len;i++){
            path.addLast(candidates[i]);
            dfs(candidates,i,len,path,target-candidates[i],ans);

            path.removeLast();
        }
    }
}
```

```java
// 剪枝之后
class Solution {
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
        List<List<Integer>> ans=new ArrayList();
        int len=candidates.length;
        Arrays.sort(candidates);

        ArrayDeque<Integer> path=new ArrayDeque();
        dfs(candidates,0,len,path,target,ans);
        return ans;

    }
    public void dfs(int [] candidates,int begin,int len,ArrayDeque<Integer> path,int target,List<List<Integer>> ans){
        if(target==0){
            ans.add(new ArrayList(path));
            return ;
        }
        for(int i=begin;i<len;i++){
            if(target-candidates[i]<0){
                break;
            }
            path.addLast(candidates[i]);
            dfs(candidates,i,len,path,target-candidates[i],ans);

            path.removeLast();
        }
    }
}
```

2. 回溯：元素无重复的可重复选的组合问题。重点在于start的位置

> 执行用时：2 ms, 在所有 Java 提交中击败了75.99%的用户
>
> 内存消耗：41.3 MB, 在所有 Java 提交中击败了98.76%的用户
>
> 通过测试用例：160 / 160
>
> 时间 O(N)
>
> 空间 O(N)

```
class Solution {
    List<List<Integer>> ans=new ArrayList();
    List<Integer> list=new ArrayList();
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
        backTrack(candidates,target,0);
        return ans;
    }
    public void backTrack(int []candidates,int target,int start){
        if(target==0){
            ans.add(new ArrayList(list));
            return ;
        }
        if(target<0)return ;
        for(int i=start;i<candidates.length;i++){
            list.add(candidates[i]);
            backTrack(candidates,target-candidates[i],i);
            list.remove(list.size()-1);
        }
    }
}
```

