---
title: leetcode 567
tags: 刷题
category: leetcode
abbrlink: 24299
date: 2023-02-27 10:32:34
---

## 题目描述

#### [567. 字符串的排列](https://leetcode.cn/problems/permutation-in-string/)



给你两个字符串 `s1` 和 `s2` ，写一个函数来判断 `s2` 是否包含 `s1` 的排列。如果是，返回 `true` ；否则，返回 `false` 。

换句话说，`s1` 的排列之一是 `s2` 的 **子串** 。

 

**示例 1：**

```
输入：s1 = "ab" s2 = "eidbaooo"
输出：true
解释：s2 包含 s1 的排列之一 ("ba").
```



## 解题思路

1. 滑窗：滑窗更新字符出现的次数，两数组相等时为true，但每次判断是否相等需要O(N)，因此使用一个变量来保存二者之间的距离

> 执行用时：5 ms, 在所有 Java 提交中击败了79.71%的用户
>
> 内存消耗：41.5 MB, 在所有 Java 提交中击败了46.65%的用户
>
> 通过测试用例：108 / 108
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public boolean checkInclusion(String s1, String s2) {
        // 数组存放字母出现的次数
        int []s1Count=new int[26];
        int []s2Count=new int[26];
        // 滑窗更新字符出现的次数，两数组相等时为true，但每次判断是否相等需要O(N)，因此使用一个变量来保存二者之间的距离
        int left=0,right=0,s1Len=s1.length(),s2Len=s2.length();
        int diff=s1Len;
        for(int i=0;i<s1Len;i++){
            s1Count[s1.charAt(i)-'a']++;
        }
        while(right<s2Len){
            char c=s2.charAt(right);
            if(s2Count[c-'a']<s1Count[c-'a']){
                diff--;
            }
            else{
                diff++;
            }
            s2Count[c-'a']++;
            right++;
            if(right-left>s1Len){
                char c2=s2.charAt(left);
                if(s2Count[c2-'a']<=s1Count[c2-'a']){
                    diff++;
                }
                else{
                    diff--;
                }
                s2Count[c2-'a']--;
                left++;
            }
            if(diff==0)return true;
        }
        return false;

    }
}
```

