---
title: leetcode 78
tags: 刷题
category: leetcode
abbrlink: 3936
date: 2023-03-06 10:32:06
---

## 题目描述

#### [78. 子集](https://leetcode.cn/problems/subsets/)



给你一个整数数组 `nums` ，数组中的元素 **互不相同** 。返回该数组所有可能的子集（幂集）。

解集 **不能** 包含重复的子集。你可以按 **任意顺序** 返回解集。

 

**示例 1：**

```
输入：nums = [1,2,3]
输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
```



## 解题思路

1. 回溯+组合：元素无重复不可重复选问题

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41.9 MB, 在所有 Java 提交中击败了6.15%的用户
>
> 通过测试用例：10 / 10
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    List<List<Integer>> res=new ArrayList<List<Integer>>();
    public List<List<Integer>> subsets(int[] nums) {
        getSets(nums,0,new ArrayList<Integer>());
        res.add(new ArrayList());
        return res;
    }

    public void getSets(int []nums,int begin,List<Integer> list){
        for(;begin<nums.length;begin++){
            list.add(nums[begin]);
            res.add(new ArrayList(list));
            getSets(nums,begin+1,list);
            list.remove(list.size()-1);
        }
    }
}
```

2. 稍微修改一下

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41.9 MB, 在所有 Java 提交中击败了10.75%的用户
>
> 通过测试用例：10 / 10
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    List<List<Integer>> res=new ArrayList<List<Integer>>();
    List<Integer> list=new ArrayList<Integer>();
    public List<List<Integer>> subsets(int[] nums) {
        getSets(nums,0);
        return res;
    }

    public void getSets(int []nums,int begin){
        res.add(new ArrayList(list));
        for(;begin<nums.length;begin++){
            list.add(nums[begin]);
            getSets(nums,begin+1);
            list.remove(list.size()-1);
        }
    }
}
```

