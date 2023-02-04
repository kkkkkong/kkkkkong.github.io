---
title: leetcode 1798
tags: 刷题
category: leetcode
abbrlink: 3403
date: 2023-02-04 23:02:30
---

## 题目描述

#### [1798. 你能构造出连续值的最大数目](https://leetcode.cn/problems/maximum-number-of-consecutive-values-you-can-make/)



给你一个长度为 `n` 的整数数组 `coins` ，它代表你拥有的 `n` 个硬币。第 `i` 个硬币的值为 `coins[i]` 。如果你从这些硬币中选出一部分硬币，它们的和为 `x` ，那么称，你可以 **构造** 出 `x` 。

请返回从 `0` 开始（**包括** `0` ），你最多能 **构造** 出多少个连续整数。

你可能有多个相同值的硬币。

 

**示例 1：**

```
输入：coins = [1,3]
输出：2
解释：你可以得到以下这些值：
- 0：什么都不取 []
- 1：取 [1]
从 0 开始，你可以构造出 2 个连续整数。
```



## 解题思路

1. 贪心，排序后，假设当前的表述范围为[0,n]，数组尾部每多一个数字v，其表示的范围为[0,n]&[0+v,n+v]，那么需要考虑n与v的大小关系，如果v<=n+1，则两个范围可以连续上，否则返回结果（看了评论的想法）

> 执行用时：17 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：48.7 MB, 在所有 Java 提交中击败了92.31%的用户
>
> 通过测试用例：72 / 72
>
> 时间 O(n*logn)，主要在排序的时间开销
>
> 空间 O(logn)，排序需要的栈空间

```java
class Solution {
    public int getMaximumConsecutive(int[] coins) {
        Arrays.sort(coins);
        int res=0;
        for(int i:coins){
            // +1的目的是刚好i作为reshb的值
            if(i<=res+1){
                res=res+i;
            }
            else{
                return res+1;
            }
        }
        return res+1;
    }
}
```

