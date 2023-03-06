---
title: leetcode 40
tags: 刷题
category: leetcode
abbrlink: 14689
date: 2023-03-06 14:40:04
---

## 题目描述

#### [40. 组合总和 II](https://leetcode.cn/problems/combination-sum-ii/)



给定一个候选人编号的集合 `candidates` 和一个目标数 `target` ，找出 `candidates` 中所有可以使数字和为 `target` 的组合。

`candidates` 中的每个数字在每个组合中只能使用 **一次** 。

**注意：**解集不能包含重复的组合。 

 

**示例 1:**

```
输入: candidates = [10,1,2,7,6,1,5], target = 8,
输出:
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]
```



## 解题思路

1. 回溯：元素可重复的不可重复选的组合问题。如果不进行第二段剪枝的话会超时

> 执行用时：4 ms, 在所有 Java 提交中击败了43.75%的用户
>
> 内存消耗：41.7 MB, 在所有 Java 提交中击败了65.39%的用户
>
> 通过测试用例：176 / 176
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    List<List<Integer>> ans=new ArrayList<List<Integer>>();
    List<Integer> list=new ArrayList();
    public List<List<Integer>> combinationSum2(int[] candidates, int target) {
        Arrays.sort(candidates);
        backTrack(candidates,target,0,0);
        return ans;
    }
    public void backTrack(int []candidates,int target,int start,int sum){
        if(sum==target){
            ans.add(new ArrayList(list));
            return ;
        }
        if(sum>target){
            return;
        }
        for(int i=start;i<candidates.length;i++){
            if(i>start&&candidates[i]==candidates[i-1])continue;
            list.add(candidates[i]);
            backTrack(candidates,target,i+1,sum+candidates[i]);
            list.remove(list.size()-1);
        }
    }
}
```

