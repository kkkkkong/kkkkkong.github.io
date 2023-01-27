---
title: leetcode 1663
tags: 刷题
category: leetcode
abbrlink: 64094
date: 2023-01-26 21:15:59
---

## 题目描述

#### [1663. 具有给定数值的最小字符串](https://leetcode.cn/problems/smallest-string-with-a-given-numeric-value/)



**小写字符** 的 **数值** 是它在字母表中的位置（从 `1` 开始），因此 `a` 的数值为 `1` ，`b` 的数值为 `2` ，`c` 的数值为 `3` ，以此类推。

字符串由若干小写字符组成，**字符串的数值** 为各字符的数值之和。例如，字符串 `"abe"` 的数值等于 `1 + 2 + 5 = 8` 。

给你两个整数 `n` 和 `k` 。返回 **长度** 等于 `n` 且 **数值** 等于 `k` 的 **字典序最小** 的字符串。

注意，如果字符串 `x` 在字典排序中位于 `y` 之前，就认为 `x` 字典序比 `y` 小，有以下两种情况：

- `x` 是 `y` 的一个前缀；
- 如果 `i` 是 `x[i] != y[i]` 的第一个位置，且 `x[i]` 在字母表中的位置比 `y[i]` 靠前。

 

**示例 1：**

```
输入：n = 3, k = 27
输出："aay"
解释：字符串的数值为 1 + 1 + 25 = 27，它是数值满足要求且长度等于 3 字典序最小的字符串。
```



## 解题思路

1. 迭代模拟，根据题目描述，要找的字符串是**严格非递减**的，我们默认字符串都是a组成；从后向前模拟，根据剩余值大小进行修改

> 执行用时：9 ms, 在所有 Java 提交中击败了86.29%的用户
>
> 内存消耗：41.5 MB, 在所有 Java 提交中击败了74.19%的用户
>
> 通过测试用例：94 / 94
>
> 时间 O(n)
>
> 空间 O(1)

```java
class Solution {
    public String getSmallestString(int n, int k) {
        char []res_char=new char[n];
        // 全部赋初值
        for(int i=0;i<n;i++){
            res_char[i]='a';
        }
        k-=n;
        for(int i=n-1;i>=0;i--){
            if(k>25){
                res_char[i]='z';
                k-=25;
            }
            else if(k<=25){
                res_char[i]+=k;
                break;
            }
        }
        return String.valueOf(res_char);
    }
}
```

