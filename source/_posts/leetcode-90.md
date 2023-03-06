---
title: leetcode 90
tags: 刷题
category: leetcode
abbrlink: 43365
date: 2023-03-06 14:22:59
---

## 题目描述

#### [90. 子集 II](https://leetcode.cn/problems/subsets-ii/)



给你一个整数数组 `nums` ，其中可能包含重复元素，请你返回该数组所有可能的子集（幂集）。

解集 **不能** 包含重复的子集。返回的解集中，子集可以按 **任意顺序** 排列。

 

**示例 1：**

```
输入：nums = [1,2,2]
输出：[[],[1],[1,2],[1,2,2],[2],[2,2]]
```



## 解题思路

1. 回溯：元素重复不可复选问题，需要提前排序

> 执行用时：1 ms, 在所有 Java 提交中击败了99.17%的用户
>
> 内存消耗：41.6 MB, 在所有 Java 提交中击败了76.27%的用户
>
> 通过测试用例：20 / 20
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    List<List<Integer>> res=new ArrayList<List<Integer>>();
    ArrayList<Integer> list=new ArrayList<Integer>();
    public List<List<Integer>> subsetsWithDup(int[] nums) {
        Arrays.sort(nums);
        backTrace(nums,0);
        return res;
    }
    public void backTrace(int []nums,int begin){
        res.add(new ArrayList<>(list));
        for(int i=begin;i<nums.length;i++){
            if((i>begin)&&(nums[i]==nums[i-1])){
                continue;
            }
            list.add(nums[i]);
            backTrace(nums,i+1);
            list.remove(list.size()-1);
        }
    }
}
```

