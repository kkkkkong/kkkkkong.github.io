---
title: leetcode 70
tags: 刷题
category: leetcode
abbrlink: 51553
date: 2023-01-15 19:22:06
---

## 题目描述

#### [70. 爬楼梯](https://leetcode.cn/problems/climbing-stairs/)



假设你正在爬楼梯。需要 `n` 阶你才能到达楼顶。

每次你可以爬 `1` 或 `2` 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 

**示例 1：**

```
输入：n = 2
输出：2
解释：有两种方法可以爬到楼顶。
1. 1 阶 + 1 阶
2. 2 阶
```

## 解题思路



1. 递归

> 超时
>
> 

```java
class Solution {
    public int climbStairs(int n) {
        if(n<=3)return n;
        return climbStairs(n-1)+climbStairs(n-2);
    }
}
```

2. 迭代，f(n)=f(n-1)+f(n-2)

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：38.7 MB, 在所有 Java 提交中击败了5.07%的用户
>
> 通过测试用例：45 / 45
>
> 时间 O(n)
>
> 空间 O(1)

```java
class Solution {
    public int climbStairs(int n) {
        if(n<=3)return n;
        int a=1,b=2;
        for(int i=3;i<=n;i++){
            int tmp=a;
            a=b;
            b+=tmp;
        }
        return b;
    }
}
```

3. 题解还有用到矩阵快速幂、通项公式，没看