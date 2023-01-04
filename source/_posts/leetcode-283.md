---
title: leetcode 283
abbrlink: 15455
date: 2023-01-04 10:36:12
tags: 刷题
categories:
  - leetcode
---

## 题目描述

给定一个数组 `nums`，编写一个函数将所有 `0` 移动到数组的末尾，同时保持非零元素的相对顺序。

**请注意** ，必须在不复制数组的情况下原地对数组进行操作。

 [283. 移动零 - 力扣（LeetCode）](https://leetcode.cn/problems/move-zeroes/)

## 解题思路

1. 暴力解法，既然要求原地操作，那么我直接两层for循环

> 执行用时：565 ms, 在所有 Java 提交中击败了5.03%的用户
>
> 内存消耗：43.1 MB, 在所有 Java 提交中击败了20.29%的用户
>
> 通过测试用例：74 / 74

```java
class Solution {
    public void moveZeroes(int[] nums) {
        for(int i=0;i<nums.length-1;i++){
            for(int j=0;j<nums.length-1;j++){
                if(nums[j]==0){
                    swap(nums,j,j+1);
                }
            }
        }

    }
    public int[] swap(int [] nums,int i,int j){
        int tmp=nums[i];
        nums[i]=nums[j];
        nums[j]=tmp;
        return nums;
    }
}
```

2. 能不能用O(n)的实现呢，想到了双指针实现，但是一时间没有捋顺代码，卡了半天，借鉴了别人的代码实现

```java
class Solution {
    public void moveZeroes(int[] nums) {
        int n=nums.length;
        int pre=0,next=0;
        // 快慢指针,pre指向当前的0，next指向当前0后的第一个非零
        while(next<n){
            if(nums[next]!=0){
                swap(nums,pre,next);
                pre++;
            }
            next++;
        }
    }
    public int[] swap(int [] nums,int i,int j){
        int tmp=nums[i];
        nums[i]=nums[j];
        nums[j]=tmp;
        return nums;
    }
}
```

