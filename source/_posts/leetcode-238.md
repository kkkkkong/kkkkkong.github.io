---
title: leetcode 238
tags: 刷题
category: leetcode
abbrlink: 51993
date: 2023-02-05 15:44:53
---

## 题目描述

#### [238. 除自身以外数组的乘积](https://leetcode.cn/problems/product-of-array-except-self/)



给你一个整数数组 `nums`，返回 *数组 `answer` ，其中 `answer[i]` 等于 `nums` 中除 `nums[i]` 之外其余各元素的乘积* 。

题目数据 **保证** 数组 `nums`之中任意元素的全部前缀元素和后缀的乘积都在 **32 位** 整数范围内。

请**不要使用除法，**且在 `O(*n*)` 时间复杂度内完成此题。

 

**示例 1:**

```
输入: nums = [1,2,3,4]
输出: [24,12,8,6]
```

## 解题思路

1. 使用除法，但空间不额外申请空间。使用变量保存当前的前缀积与后缀积，向后遍历，前缀积使用乘法扩大，后缀积使用除法缩小。如果遇到当前元素为0，需要重新计算后缀积。

> 时间 O(N*N)，为0的时候特殊情况，会导致时间复杂度到平方级
>
> 空间 O(1)
>
> 超时

```java
class Solution {
    public int[] productExceptSelf(int[] nums) {
        int n=nums.length;
        int []res=new int [n];
        // 获取整个数组的乘积
        int left_mut=1,right_mut=1;
        // 第一个元素特殊处理
        for(int i=1;i<n;i++){
            right_mut*=nums[i];
        }
        res[0]=left_mut*right_mut;
        for(int i=1;i<n;i++){
            left_mut*=nums[i-1];
            // 非0时，后缀积除元素
            if(nums[i]!=0){
                right_mut/=nums[i];
            }
            // 0时，需要重新计算后缀积
            else{
                right_mut=1;
                for(int k=i=1;k<n;k++){
                    right_mut*=nums[k];
                }
            }
            res[i]=left_mut*right_mut;
        }
        return res;

    }
}
```

1. 辅助数组，使用两个数组分别保存前缀乘积和后缀乘积，然后某个数字的左右相乘。这里辅助数组的意义是left_mut[i]表示包含i的前缀积，如果表示不包含i的前缀积，那么代码量会更少。

> 执行用时：2 ms, 在所有 Java 提交中击败了28.31%的用户
>
> 内存消耗：49.4 MB, 在所有 Java 提交中击败了70.80%的用户
>
> 通过测试用例：22 / 22
>
> 时间 O(N)
>
> 空间 O(N) 使用了辅助数组

```java
class Solution {
    public int[] productExceptSelf(int[] nums) {
        int n=nums.length;
        // 使用两个数组分别保存前缀和后缀的乘积
        int []left_mut=new int[n];
        int []right_mut=new int[n];
        int []res=new int [n];
        for(int i=0;i<n;i++){
            // 前缀积
            if(i==0)left_mut[i]=nums[i];
            else{
                left_mut[i]=left_mut[i-1]*nums[i];
            }
            // 后缀积
            int j=n-1-i;
            if(j==n-1)right_mut[j]=nums[j];
            else{
                right_mut[j]=right_mut[j+1]*nums[j];
            }
        }
        for(int i=0;i<n;i++){
            if(i==0)res[i]=right_mut[i+1];
            else if(i==n-1)res[i]=left_mut[i-1];
            else{
                res[i]=left_mut[i-1]*right_mut[i+1];
            }            
        }
        return res;
    }
}
```

3. 使用返回数组代替后缀积，暂用返回数组暂时存储后缀积

> 执行用时：1 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：49.2 MB, 在所有 Java 提交中击败了89.30%的用户
>
> 通过测试用例：22 / 22
>
> 时间 O(N)
>
> 空间 O(1)，因为返回数组不算空间

```java
class Solution {
    public int[] productExceptSelf(int[] nums) {
        int n=nums.length;
        // 是返回数组，也是后缀积数组
        int []res=new int[n];
        for(int i=n-1;i>=0;i--){
            if(i==n-1)res[i]=1;
            else{
                // 后缀积不计算当前元素
                res[i]=res[i+1]*nums[i+1];
            }
        }
        int left_mut=1;
        // 计算res
        for(int i=0;i<n;i++){
            res[i]=left_mut*res[i];
            left_mut*=nums[i];
        }
        return res;
    }
}
```

