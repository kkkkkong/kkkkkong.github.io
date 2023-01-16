---
title: leetcode 121
tags: 刷题
category: leetcode
abbrlink: 23848
date: 2023-01-16 19:56:55
---

## 题目描述

#### [121. 买卖股票的最佳时机](https://leetcode.cn/problems/best-time-to-buy-and-sell-stock/)



给定一个数组 `prices` ，它的第 `i` 个元素 `prices[i]` 表示一支给定股票第 `i` 天的价格。

你只能选择 **某一天** 买入这只股票，并选择在 **未来的某一个不同的日子** 卖出该股票。设计一个算法来计算你所能获取的最大利润。

返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 `0` 。

 

**示例 1：**

```
输入：[7,1,5,3,6,4]
输出：5
解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
```

## 解题思路

1. 一次遍历，查找当前的最小元素与现在元素的差值，该差值与当前最大值比较，最后结果返回

> 执行用时：2 ms, 在所有 Java 提交中击败了54.61%的用户
>
> 内存消耗：57.9 MB, 在所有 Java 提交中击败了24.49%的用户
>
> 通过测试用例：211 / 211
>
> 时间 O(n)
>
> 空间 O(1)

```java
class Solution {
    public int maxProfit(int[] prices) {
        int res=0;
        int pre_min=prices[0];
        for(int i=1;i<prices.length;i++){
            res=Math.max(res,prices[i]-pre_min);
            pre_min=Math.min(pre_min,prices[i]);
        }
        return res;

    }
}
```

