---
title: leetcode 704
tags: 刷题
category: leetcode
abbrlink: 16137
date: 2023-03-07 14:21:04
---

## 题目描述

#### [704. 二分查找](https://leetcode.cn/problems/binary-search/)



给定一个 `n` 个元素有序的（升序）整型数组 `nums` 和一个目标值 `target` ，写一个函数搜索 `nums` 中的 `target`，如果目标值存在返回下标，否则返回 `-1`。


**示例 1:**

```
输入: nums = [-1,0,3,5,9,12], target = 9
输出: 4
解释: 9 出现在 nums 中并且下标为 4
```

## 解题思路

1. 二分

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：42.1 MB, 在所有 Java 提交中击败了50.35%的用户
>
> 通过测试用例：47 / 47
>
> 时间 O(N)
>
> 空间 O(1)

```java
class Solution {
    public int search(int[] nums, int target) {
        int left=0,right=nums.length-1;
        while(left<=right){
            int mid =left+(right-left)/2;
            if(nums[mid]==target){
                return mid;
            }
            else if(nums[mid]<target){
                left=mid+1;
            }
            else if(nums[mid]>target){
                right=mid-1;
            }
        }
        return -1;
    }
}
```

