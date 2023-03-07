---
title: leetcode 34
tags: 刷题
category: leetcode
abbrlink: 51810
date: 2023-03-07 14:41:58
---

## 题目描述

#### [34. 在排序数组中查找元素的第一个和最后一个位置](https://leetcode.cn/problems/find-first-and-last-position-of-element-in-sorted-array/)



给你一个按照非递减顺序排列的整数数组 `nums`，和一个目标值 `target`。请你找出给定目标值在数组中的开始位置和结束位置。

如果数组中不存在目标值 `target`，返回 `[-1, -1]`。

你必须设计并实现时间复杂度为 `O(log n)` 的算法解决此问题。

 

**示例 1：**

```
输入：nums = [5,7,7,8,8,10], target = 8
输出：[3,4]
```



## 解题思路

1. 两个二分，分别找左边界和右边界

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：44.2 MB, 在所有 Java 提交中击败了98.88%的用户
>
> 通过测试用例：88 / 88

```java
class Solution {
    public int[] searchRange(int[] nums, int target) {
        int left=0,right=nums.length-1;
        int []ans=new int[2];
        while(left<=right){
            int mid=left+(right-left)/2;
            if(nums[mid]>target){
                right=mid-1;
            }
            else if(nums[mid]<target){
                left=mid+1;
            }
            else if(nums[mid]==target){
                right=mid-1;
            }
        }
        if(left==nums.length)ans[0]=-1;
        else{
            ans[0]=nums[left]==target?left:-1;
        }
        left=0;
        right=nums.length-1;
        while(left<=right){
            int mid=left+(right-left)/2;
            if(nums[mid]>target){
                right=mid-1;
            }
            else if(nums[mid]<target){
                left=mid+1;
            }
            else if(nums[mid]==target){
                left=mid+1;
            }
        }
        if(left<1)ans[1]=-1;
        else{
            ans[1]=nums[left-1]==target?left-1:-1;
        }
        return ans;
    }
}
```

