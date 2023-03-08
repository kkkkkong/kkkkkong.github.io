---
title: leetcode 76
tags: 刷题
category: leetcode
abbrlink: 52193
date: 2023-03-08 15:05:06
---

## 题目描述

#### [76. 最小覆盖子串](https://leetcode.cn/problems/minimum-window-substring/)



给你一个字符串 `s` 、一个字符串 `t` 。返回 `s` 中涵盖 `t` 所有字符的最小子串。如果 `s` 中不存在涵盖 `t` 所有字符的子串，则返回空字符串 `""` 。

 

**注意：**

- 对于 `t` 中重复字符，我们寻找的子字符串中该字符数量必须不少于 `t` 中该字符数量。
- 如果 `s` 中存在这样的子串，我们保证它是唯一的答案。

 

**示例 1：**

```
输入：s = "ADOBECODEBANC", t = "ABC"
输出："BANC"
解释：最小覆盖子串 "BANC" 包含来自字符串 t 的 'A'、'B' 和 'C'。
```

## 解题思路

1. 滑动窗口：

> 注意：Java 的 Integer，String 等类型判定相等不能使用==，而要使用equals，这是包装类的一个细节

> 执行用时：14 ms, 在所有 Java 提交中击败了63.87%的用户
>
> 内存消耗：42.2 MB, 在所有 Java 提交中击败了38.80%的用户
>
> 通过测试用例：267 / 267
>
> 时间 O(N)
>
> 空间 O(N)



```java
class Solution {
    public String minWindow(String s, String t) {
        if(s.length()<t.length())return "";
        HashMap<Character,Integer> map_s=new HashMap();
        HashMap<Character,Integer> map_t=new HashMap();
        for(int i=0;i<t.length();i++){
            char c=t.charAt(i);
            map_t.put(c,map_t.getOrDefault(c,0)+1);
        }
        int num=0;
        int ans=Integer.MAX_VALUE;
        int l=0,r=0;
        int left=0,right=0;
        while(right<s.length()){
            char c=s.charAt(right);
            map_s.put(c,map_s.getOrDefault(c,0)+1);

            if(map_t.containsKey(c)){
                if(map_s.get(c).equals(map_t.get(c))){
                    num++;
                }
            }
            right++;

            while(num==map_t.size()){
                if(ans>right-left){
                    l=left;
                    r=right;
                    ans=right-left;
                }
                char c2=s.charAt(left);
                if(map_t.containsKey(c2)){
                    if(map_s.get(c2).equals(map_t.get(c2))){
                        num--;
                    }
                    map_s.put(c2,map_s.get(c2)-1);
                }
                left++;

            }
        }
        return s.substring(l,r);
    }
}
```

