---
title: leetcode 46
tags: 刷题
category: leetcode
abbrlink: 15329
date: 2023-03-02 10:50:05
---

## 题目描述

#### [46. 全排列](https://leetcode.cn/problems/permutations/)



给定一个不含重复数字的数组 `nums` ，返回其 *所有可能的全排列* 。你可以 **按任意顺序** 返回答案。

 

**示例 1：**

```
输入：nums = [1,2,3]
输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```





## 解题思路

1. 哈希表+回溯：引入了额外的哈希表，但浪费时间，可能是在数组与list的转换上，需要用到stream来装箱

> 执行用时：2 ms, 在所有 Java 提交中击败了8.40%的用户
>
> 内存消耗：41.9 MB, 在所有 Java 提交中击败了28.32%的用户
>
> 通过测试用例：26 / 26
>
> 时间 O(N!)
>
> 空间 O(N)

```java
class Solution {
    List<List<Integer>> ans=new ArrayList<List<Integer>>();
    public List<List<Integer>> permute(int[] nums) {
        List<Integer> tmpNums=Arrays.stream(nums).boxed().collect(Collectors.toList());
        backTrack(tmpNums,new ArrayList<Integer>());
        return ans;


    }
    public void backTrack(List<Integer> nums,List<Integer> tmp){
        if(nums.size()==1){
            tmp.add(nums.get(0));
            ans.add(new ArrayList(tmp));
            tmp.remove(tmp.size()-1);
            return;
        }

        for(int i=nums.size()-1;i>=0;i--){
            int num=nums.get(i);
            tmp.add(num);
            nums.remove(i);
            backTrack(nums,tmp);
            nums.add(i,num);
            tmp.remove(tmp.size()-1);
        }
    }
}
```

2. 回溯：使用额外的数组来标记是否使用了某元素

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41.8 MB, 在所有 Java 提交中击败了44.06%的用户
>
> 通过测试用例：26 / 26
>
> 时间 O(N!)
>
> 空间 O(N)

```java
class Solution {
    List<List<Integer>> ans=new ArrayList<List<Integer>>();
    public List<List<Integer>> permute(int[] nums) {
        boolean []used=new boolean [nums.length];
        backTrack(nums,new ArrayList<Integer>(),used);
        return ans;


    }
    public void backTrack(int [] nums,List<Integer> tmp,boolean []used){
        if(tmp.size()==nums.length){
            ans.add(new ArrayList(tmp));
            return;
        }
        for(int i=0;i<nums.length;i++){
            if(used[i]==true)continue;
            tmp.add(nums[i]);
            used[i]=true;
            backTrack(nums,tmp,used);
            used[i]=false;
            tmp.remove(tmp.size()-1);
        }
    }
}
```

