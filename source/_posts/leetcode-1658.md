---
title: leetcode 1658
tags: 刷题
category: leetcode
abbrlink: 52511
date: 2023-01-07 19:14:27
---

## 题目描述

#### [1658. 将 x 减到 0 的最小操作数](https://leetcode.cn/problems/minimum-operations-to-reduce-x-to-zero/)



给你一个整数数组 `nums` 和一个整数 `x` 。每一次操作时，你应当移除数组 `nums` 最左边或最右边的元素，然后从 `x` 中减去该元素的值。请注意，需要 **修改** 数组以供接下来的操作使用。

如果可以将 `x` **恰好** 减到 `0` ，返回 **最小操作数** ；否则，返回 `-1` 。



## 解题思路

1. 滑动窗口：前后指针分别表示前缀和和后缀和，后缀和从整个数组开始，前缀和从-1开始，
   1. 如果lsum+rsum=x，说明找到了一组答案
   2. 如果lsum+rsum>x，说明过大，把right向右移动
   3. 如果lsum+rsum<x，说明过小，把left向左移动

> 执行用时：11 ms, 在所有 Java 提交中击败了27.04%的用户
>
> 内存消耗：50.3 MB, 在所有 Java 提交中击败了85.29%的用户
>
> 通过测试用例：94 / 94
>
> 时间：O(n)
>
> 空间：O(1)

```java
class Solution {
    public int minOperations(int[] nums, int x) {
        int n=nums.length;
        int res=n+1;
        int right=0;
        int lsum=0,rsum=Arrays.stream(nums).sum();
        if(rsum<x)return -1;
        for(int left=-1;left<n;left++){
            if(left!=-1){
                lsum+=nums[left];
            }
            // 和大于n时，r向右移动
            while(lsum+rsum>x&&right<n){
                rsum-=nums[right];
                right++;
            }
            if(lsum+rsum==x){
                res=Math.min(res,left+1+n-right);
            }
        }
        return res>n?-1:res;

    }
}
```

2. 逆向思维，考虑找到一个最长的子数组，使得子数组的和为sum-x