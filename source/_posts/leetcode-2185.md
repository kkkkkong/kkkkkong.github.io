---
title: leetcode 2185
tags: 刷题
abbrlink: 7531
date: 2023-01-08 16:49:27
---

## 题目描述

#### [2185. 统计包含给定前缀的字符串](https://leetcode.cn/problems/counting-words-with-a-given-prefix/)



给你一个字符串数组 `words` 和一个字符串 `pref` 。

返回 `words` 中以 `pref` 作为 **前缀** 的字符串的数目。

字符串 `s` 的 **前缀** 就是 `s` 的任一前导连续字符串。

## 解题思路

1. 直接模拟，从前到后判断

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41.6 MB, 在所有 Java 提交中击败了20.10%的用户
>
> 通过测试用例：95 / 95
>
> 时间 O(n)
>
> 空间 O(1)

```java
class Solution {
    public int prefixCount(String[] words, String pref) {
        int res=0;
        for(int i=0;i<words.length;i++){
            if(isTrue(words[i],pref)){
                res++;
            }
        }
        return res;
    }
    public boolean isTrue(String words, String pref){
        if(words.length()<pref.length())return false;
        for(int i=0;i<pref.length();i++){
            if(pref.charAt(i)!=words.charAt(i)){
                return false;
            }
        }
        return true;
    }
}
```

