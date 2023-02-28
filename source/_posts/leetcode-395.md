---
title: leetcode 395
tags: 刷题
category: leetcode
abbrlink: 28303
date: 2023-02-28 09:34:21
---

## 题目描述

#### [395. 至少有 K 个重复字符的最长子串](https://leetcode.cn/problems/longest-substring-with-at-least-k-repeating-characters/)



给你一个字符串 `s` 和一个整数 `k` ，请你找出 `s` 中的最长子串， 要求该子串中的每一字符出现次数都不少于 `k` 。返回这一子串的长度。

 

**示例 1：**

```
输入：s = "aaabb", k = 3
输出：3
解释：最长子串为 "aaa" ，其中 'a' 重复了 3 次。
```



## 解题思路

1. 分治：递归返回条件：s.length()<k或找到符合条件的s

> 执行用时：4 ms, 在所有 Java 提交中击败了60.30%的用户
>
> 内存消耗：41.3 MB, 在所有 Java 提交中击败了34.40%的用户
>
> 通过测试用例：37 / 37
>
> 时间 O(N*26*26)
>
> 空间 O(26*26）

```java
class Solution {
    public int longestSubstring(String s, int k) {
        int n=s.length();
        if(n<k)return 0;
        Map<Character,Integer> map=new HashMap();
        for(int i=0;i<n;i++){
            char c=s.charAt(i);
            map.put(c,map.getOrDefault(c,0)+1);
        }
        for(char c:map.keySet()){
            if(map.get(c)<k){
                int res=0;
                for(String str:s.split(String.valueOf(c))){
                    res=Math.max(res,longestSubstring(str,k));
                }
                return res;
            }
        }
        return n;
    }
}
```

