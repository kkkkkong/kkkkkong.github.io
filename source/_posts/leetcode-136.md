---
title: leetcode 136
tags: 刷题
category: leetcode
abbrlink: 3944
date: 2023-01-03 18:58:44
---

## 题目描述

给你一个 非空 整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。

[136. 只出现一次的数字 - 力扣（LeetCode）](https://leetcode.cn/problems/single-number/)

## 解题思路

刚好最近写项目用到了异或运算，一下子就想到了妙解，不然这个题要费一阵子劲

> 异或运算：各个位上，相同为0，不同为1

```java
class Solution {
    public int singleNumber(int[] nums) {
        int result=0;
        for (int a:nums){
            result^=a;
        }
        return result;
    }
}
```

