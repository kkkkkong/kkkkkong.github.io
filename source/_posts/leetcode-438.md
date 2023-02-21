---
title: leetcode 438
tags: 刷题
category: leetcode
abbrlink: 51961
date: 2023-02-21 14:29:10
---

## 题目描述

#### [438. 找到字符串中所有字母异位词](https://leetcode.cn/problems/find-all-anagrams-in-a-string/)



给定两个字符串 `s` 和 `p`，找到 `s` 中所有 `p` 的 **异位词** 的子串，返回这些子串的起始索引。不考虑答案输出的顺序。

**异位词** 指由相同字母重排列形成的字符串（包括相同的字符串）。

 

**示例 1:**

```
输入: s = "cbaebabacd", p = "abc"
输出: [0,6]
解释:
起始索引等于 0 的子串是 "cba", 它是 "abc" 的异位词。
起始索引等于 6 的子串是 "bac", 它是 "abc" 的异位词。
```

## 解题思路

1. 数组差+滑窗，用两个数组分别表示字符串p中字母出现的次数以及滑窗中字母出现的次数，方便统计，采用变量diff表示两个数组的不同字母数。diff为0时，将left指针加入结果集中

> 执行用时：8 ms, 在所有 Java 提交中击败了67.39%的用户
>
> 内存消耗：42.7 MB, 在所有 Java 提交中击败了38.45%的用户
>
> 通过测试用例：64 / 64
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public List<Integer> findAnagrams(String s, String p) {
        int []ptmp=new int [26];
        int []stmp=new int [26];
        int left=0,right=0,n=s.length();
        int plen=p.length();
        int diff=plen;
        List<Integer> ans=new ArrayList();
        for(int i=0;i<plen;i++){
            ptmp[p.charAt(i)-'a']++;
        }
        while(right<n){
            if(right-left+1>plen){
                if(stmp[s.charAt(left)-'a']<=ptmp[s.charAt(left)-'a']){
                    diff++;
                }
                else{
                    diff--;
                }
                stmp[s.charAt(left)-'a']--;
                left++;
            }
            else{
                if(stmp[s.charAt(right)-'a']>=ptmp[s.charAt(right)-'a']){
                    diff++;
                }
                else{
                    diff--;
                }
                stmp[s.charAt(right)-'a']++;
                right++;
            }
            if(diff==0){
                ans.add(left);
            }
        }
        return ans;
    }
}
```

