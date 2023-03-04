---
title: leetcode 322
tags: 刷题
category: leetcode
abbrlink: 40137
date: 2023-03-01 11:05:28
---

## 题目描述

#### [322. 零钱兑换](https://leetcode.cn/problems/coin-change/)



给你一个整数数组 `coins` ，表示不同面额的硬币；以及一个整数 `amount` ，表示总金额。

计算并返回可以凑成总金额所需的 **最少的硬币个数** 。如果没有任何一种硬币组合能组成总金额，返回 `-1` 。

你可以认为每种硬币的数量是无限的。

 

**示例 1：**

```
输入：coins = [1, 2, 5], amount = 11
输出：3 
解释：11 = 5 + 5 + 1
```



## 解题思路

1. 暴力解 超时
2. 加备忘录

> 执行用时：142 ms, 在所有 Java 提交中击败了5.00%的用户
>
> 内存消耗：43.3 MB, 在所有 Java 提交中击败了5.08%的用户
>
> 通过测试用例：189 / 189
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    HashMap<Integer,Integer> map=new HashMap();
    public int coinChange(int[] coins, int amount) {
        return getChange(coins,amount);

    }
    public int getChange(int[] coins, int amount){
        if(amount<0)return -1;
        if(amount==0)return 0;
        if(map.containsKey(amount))return map.get(amount);
        int ans=Integer.MAX_VALUE;
        for(int i:coins){
            int tmp=getChange(coins,amount-i);
            if(tmp==-1)continue;
            ans=Math.min(ans,tmp+1);
        }
        ans = ans==Integer.MAX_VALUE?-1:ans;
        map.put(amount,ans);
        return ans;
    }
}
```

3. 自底向上，dp数组迭代，来自题解

```java
int coinChange(int[] coins, int amount) {
    int[] dp = new int[amount + 1];
    // 数组大小为 amount + 1，初始值也为 amount + 1
    Arrays.fill(dp, amount + 1);

    // base case
    dp[0] = 0;
    // 外层 for 循环在遍历所有状态的所有取值
    for (int i = 0; i < dp.length; i++) {
        // 内层 for 循环在求所有选择的最小值
        for (int coin : coins) {
            // 子问题无解，跳过
            if (i - coin < 0) {
                continue;
            }
            dp[i] = Math.min(dp[i], 1 + dp[i - coin]);
        }
    }
    return (dp[amount] == amount + 1) ? -1 : dp[amount];
}

```

