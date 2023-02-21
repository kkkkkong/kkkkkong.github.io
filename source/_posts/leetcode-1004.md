---
title: leetcode 1004
tags: 刷题
category: leetcode
abbrlink: 39420
date: 2023-02-21 10:13:15
---

## 题目描述

#### [1004. 最大连续1的个数 III](https://leetcode.cn/problems/max-consecutive-ones-iii/)



给定一个二进制数组 `nums` 和一个整数 `k`，如果可以翻转最多 `k` 个 `0` ，则返回 *数组中连续 `1` 的最大个数* 。

 

**示例 1：**

```
输入：nums = [1,1,1,0,0,0,1,1,1,1,0], K = 2
输出：6
解释：[1,1,1,0,0,1,1,1,1,1,1]
粗体数字从 0 翻转到 1，最长的子数组长度为 6。
```



## 解题思路

1. 滑窗，数组中只有1和0，可以用做和的形式来表示，左指针移动的条件为right-left+1>sum+k

> 执行用时：4 ms, 在所有 Java 提交中击败了17.57%的用户
>
> 内存消耗：43.2 MB, 在所有 Java 提交中击败了20.81%的用户
>
> 通过测试用例：52 / 52
>
> 时间 O(N)
>
> 空间O(1)

```java
class Solution {
    public int longestOnes(int[] nums, int k) {
        int sum=0,left=0,right=0,ans=0;
        int n=nums.length;
        while(right<n){
            sum+=nums[right];
            if(right-left+1<=sum+k){
                right++;
            }
            else{
                sum-=nums[left];
                left++;
            }
            ans=Math.max(ans,right-left);
        }
        return ans;
    }
}
```

2. 精简一下，因为在一次左指针移动后，下次循环必定不会再进if，所以默认每次right++，减少循环次数

> 执行用时：3 ms, 在所有 Java 提交中击败了69.83%的用户
>
> 内存消耗：42.6 MB, 在所有 Java 提交中击败了91.21%的用户
>
> 通过测试用例：52 / 52
>
> 时间 O(N)
>
> 空间 O(1)

```java
class Solution {
    public int longestOnes(int[] nums, int k) {
        int sum=0,left=0,right=0,ans=0;
        int n=nums.length;
        while(right<n){
            sum+=nums[right];
            if(right-left+1>sum+k){
                sum-=nums[left];
                left++;
            }
            right++;
            ans=Math.max(ans,right-left);
        }
        return ans;
    }
}
```

