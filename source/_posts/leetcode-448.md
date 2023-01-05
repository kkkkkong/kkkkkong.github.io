---
title: leetcode 448
tags: 刷题
category: leetcode
abbrlink: 64251
date: 2023-01-05 11:02:02
---

## 题目描述

#### [448. 找到所有数组中消失的数字](https://leetcode.cn/problems/find-all-numbers-disappeared-in-an-array/)

给你一个含 n 个整数的数组 nums ，其中 nums[i] 在区间 [1, n] 内。请你找出所有在 [1, n] 范围内但没有出现在 nums 中的数字，并以数组的形式返回结果。

## 解题思路

1. 首先想到使用一个数组下标记录数组中出现的数字，tmp[i]=1表示在nums中出现了i，否则表示没出现

> 执行用时：3 ms, 在所有 Java 提交中击败了99.62%的用户
>
> 内存消耗：49.1 MB, 在所有 Java 提交中击败了87.39%的用户
>
> 通过测试用例：33 / 33
>
> 时间复杂度 O(n)
>
> 空间复杂度O(n)使用了一个数组来记录

```java
class Solution {
    public List<Integer> findDisappearedNumbers(int[] nums) {
        List<Integer> res=new ArrayList();
        int []tmp=new int[nums.length];
        for(int num:nums){
            tmp[num-1]=1;
        }
        for(int i=0;i<tmp.length;i++){
            if(tmp[i]!=1){
                res.add(i+1);
            }
        }
        return res;
    }
}
```

2. 考虑不使用额外的空间存储，在原数组的基础上修改（莫名其妙，内存消耗不降反增）

> 执行用时：3 ms, 在所有 Java 提交中击败了99.62%的用户
>
> 内存消耗：49.6 MB, 在所有 Java 提交中击败了29.89%的用户
>
> 通过测试用例：33 / 33
>
> 时间复杂度 O(n)
>
> 空间复杂度O(1)

```java
class Solution {
    public List<Integer> findDisappearedNumbers(int[] nums) {
        int n=nums.length;
        List<Integer> res=new ArrayList();
        for(int num:nums){
            nums[(num-1)%n]+=n;
        }
        for(int i=0;i<n;i++){
            if(nums[i]-1<n){
                res.add(i+1);
            }
        }
        return res;
    }
}
```

