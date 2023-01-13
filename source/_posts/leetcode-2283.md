---
title: leetcode 2283
tags: 刷题
category: leetcode
abbrlink: 7963
date: 2023-01-13 10:04:48
---

## 题目描述

#### [2283. 判断一个数的数字计数是否等于数位的值](https://leetcode.cn/problems/check-if-number-has-equal-digit-count-and-digit-value/)



给你一个下标从 **0** 开始长度为 `n` 的字符串 `num` ，它只包含数字。

如果对于 **每个** `0 <= i < n` 的下标 `i` ，都满足数位 `i` 在 `num` 中出现了 `num[i]`次，那么请你返回 `true` ，否则返回 `false` 。

 

**示例 1：**

```
输入：num = "1210"
输出：true
解释：
num[0] = '1' 。数字 0 在 num 中出现了一次。
num[1] = '2' 。数字 1 在 num 中出现了两次。
num[2] = '1' 。数字 2 在 num 中出现了一次。
num[3] = '0' 。数字 3 在 num 中出现了零次。
"1210" 满足题目要求条件，所以返回 true 。
```

## 解题思路

1. 哈希表计数

> **433 / 433** 个通过测试用例
>
> 执行用时: **1 ms**
>
> 内存消耗: **40.1 MB**

```java
class Solution {
    public boolean digitCount(String num) {
        Map<Integer,Integer> map=new HashMap();
        for(int i=0;i<num.length();i++){
            int k=num.charAt(i)-'0';
            map.put(k,map.getOrDefault(k,0)+1);
        }
        for(int i=0;i<num.length();i++){
            int k=num.charAt(i)-'0';
            if(map.getOrDefault(i,0)!=k)return false;
        }
        return true;
    }
}
```

2. 使用数组计数

> **433 / 433** 个通过测试用例
>
> 执行用时: **0 ms**
>
> 内存消耗: **39.6 MB**

```java
class Solution {
    public boolean digitCount(String num) {
        int[] count=new int[10];
        for(int i=0;i<num.length();i++){
            count[num.charAt(i)-'0']++;
        }
        for(int i=0;i<num.length();i++){
            if(count[i]!=num.charAt(i)-'0')return false;
        }
        return true;
    }
}
```

