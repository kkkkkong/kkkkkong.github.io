---
title: leetcode 2303
tags: 刷题
category: leetcode
abbrlink: 8013
date: 2023-01-23 13:39:22
---

## 题目描述

#### [2303. 计算应缴税款总额](https://leetcode.cn/problems/calculate-amount-paid-in-taxes/)



给你一个下标从 **0** 开始的二维整数数组 `brackets` ，其中 `brackets[i] = [upperi, percenti]` ，表示第 `i` 个税级的上限是 `upperi` ，征收的税率为 `percenti` 。税级按上限 **从低到高排序**（在满足 `0 < i < brackets.length` 的前提下，`upperi-1 < upperi`）。

税款计算方式如下：

- 不超过 `upper0` 的收入按税率 `percent0` 缴纳
- 接着 `upper1 - upper0` 的部分按税率 `percent1` 缴纳
- 然后 `upper2 - upper1` 的部分按税率 `percent2` 缴纳
- 以此类推

给你一个整数 `income` 表示你的总收入。返回你需要缴纳的税款总额。与标准答案误差不超 `10-5` 的结果将被视作正确答案。

 

**示例 1：**

```
输入：brackets = [[3,50],[7,10],[12,25]], income = 10
输出：2.65000
解释：
前 $3 的税率为 50% 。需要支付税款 $3 * 50% = $1.50 。
接下来 $7 - $3 = $4 的税率为 10% 。需要支付税款 $4 * 10% = $0.40 。
最后 $10 - $7 = $3 的税率为 25% 。需要支付税款 $3 * 25% = $0.75 。
需要支付的税款总计 $1.50 + $0.40 + $0.75 = $2.65 。
```



## 解题思路

1. 模拟，从前到后遍历数组，如果income大于upper，计算upper以前的税收；否则，income小于等于upper，计算income以前的税收，遍历终止

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41.6 MB, 在所有 Java 提交中击败了22.05%的用户
>
> 通过测试用例：227 / 227
>
> 时间 O(n)
>
> 空间 O(1)

```java
class Solution {
    public double calculateTax(int[][] brackets, int income) {
        int pre=0;
        double res=0;
        for(int []get:brackets){
            if(income>get[0]){
                res+=((get[0]-pre)*get[1])/100.0;
            }
            else{
                res+=((income-pre)*get[1])/100.0;
                break;
            }
            pre=get[0];
        }
        return res;
    }
}
```

