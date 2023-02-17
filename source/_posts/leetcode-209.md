---
title: leetcode 209
tags: 刷题
category: leetcode
abbrlink: 64472
date: 2023-02-17 10:14:09
---

## 题目描述

#### [209. 长度最小的子数组](https://leetcode.cn/problems/minimum-size-subarray-sum/)



给定一个含有 `n` 个正整数的数组和一个正整数 `target` **。**

找出该数组中满足其和 `≥ target` 的长度最小的 **连续子数组** `[numsl, numsl+1, ..., numsr-1, numsr]` ，并返回其长度**。**如果不存在符合条件的子数组，返回 `0` 。

 

**示例 1：**

```
输入：target = 7, nums = [2,3,1,2,4,3]
输出：2
解释：子数组 [4,3] 是该条件下的长度最小的子数组。
```



## 解题思路

1. 前缀和+二分查找 时空 O(NLogN) O(1)
2. 前缀和作差+滑动窗口，这里的额外数组使用n+1长度更舒服，tmp[i]表示前i个元素的和

> 执行用时：2 ms, 在所有 Java 提交中击败了15.24%的用户
>
> 内存消耗：49.6 MB, 在所有 Java 提交中击败了7.48%的用户
>
> 通过测试用例：20 / 20
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public int minSubArrayLen(int target, int[] nums) {
        int n=nums.length;
        // 数组计数，tmp[i]表示前i个元素的和
        int []tmp=new int[n];
        tmp[0]=nums[0];
        for(int i=1;i<n;i++){
            tmp[i]=tmp[i-1]+nums[i];
        }
        if(tmp[n-1]<target)return 0;
        if(tmp[0]>=target)return 1;
        int i=0,j=0,ans=Integer.MAX_VALUE;
        while(j<n){
            if(tmp[j]>=target){
                ans=Math.min(ans,j+1);
            }
            if(tmp[j]-tmp[i]<target){
                j++;
            }
            else{
                while(tmp[j]-tmp[i]>=target){
                    ans=Math.min(ans,j-i);
                    i++;
                }
            }
        }
        return ans;

    }
}
```

2. 前缀和+滑动窗口，改进版

> 执行用时：1 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：49.2 MB, 在所有 Java 提交中击败了14.99%的用户
>
> 通过测试用例：20 / 20
>
> 时间 O(N)
>
> 空间 O(1)

```java
class Solution {
    public int minSubArrayLen(int target, int[] nums) {
        int n=nums.length;
        int ans=Integer.MAX_VALUE;
        int start=0,end=0,sum=0;
        while(end<n){
            sum+=nums[end++];
            while(sum>=target){
                ans=Math.min(ans,end-start);
                sum-=nums[start++];
            }
        }
        return ans==Integer.MAX_VALUE?0:ans;
    }
}
```

