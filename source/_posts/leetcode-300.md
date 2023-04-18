---
title: leetcode 300
tags: 刷题
category: leetcode
abbrlink: 15689
date: 2023-04-16 17:50:51
---

## 题目描述

#### [300. 最长递增子序列](https://leetcode.cn/problems/longest-increasing-subsequence/)



给你一个整数数组 `nums` ，找到其中最长严格递增子序列的长度。

**子序列** 是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。例如，`[3,6,2,7]` 是数组 `[0,3,1,6,2,2,7]` 的子序列。

**示例 1：**

```
输入：nums = [10,9,2,5,3,7,101,18]
输出：4
解释：最长递增子序列是 [2,3,7,101]，因此长度为 4 。
```



## 解题思路

1. dp

> 执行用时：59 ms, 在所有 Java 提交中击败了53.47%的用户
>
> 内存消耗：41 MB, 在所有 Java 提交中击败了49.70%的用户
>
> 通过测试用例：54 / 54
>
> 时间 O(N*N)
>
> 空间 O(N)



```java
class Solution {
    public int lengthOfLIS(int[] nums) {
        int []dp=new int[nums.length];
        Arrays.fill(dp,1);
        for(int i=0;i<nums.length;i++){
            for(int j=0;j<i;j++){
                if(nums[j]<nums[i]){
                    dp[i]=Math.max(dp[i],dp[j]+1);
                }
            }
        }
        int ans=0;
        for(int i=0;i<nums.length;i++){
            ans=Math.max(ans,dp[i]);

        }
        return ans;

    }
}
```

