---
title: leetcode 3
tags: 刷题
category: leetcode
abbrlink: 41773
date: 2023-02-20 10:00:47
---

## 题目描述

#### [3. 无重复字符的最长子串](https://leetcode.cn/problems/longest-substring-without-repeating-characters/)



给定一个字符串 `s` ，请你找出其中不含有重复字符的 **最长子串** 的长度。

 

**示例 1:**

```
输入: s = "abcabcbb"
输出: 3 
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
```



## 解题思路

1. 滑动窗口+哈希表：右指针前进条件，set中不包含right指向元素，否则左指针前进，并移除掉当前左指针指向元素。

> 执行用时：5 ms, 在所有 Java 提交中击败了58.48%的用户
>
> 内存消耗：41.3 MB, 在所有 Java 提交中击败了91.46%的用户
>
> 通过测试用例：987 / 987
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public int lengthOfLongestSubstring(String s) {
        int n=s.length();
        if(n<2)return n;
        int left=0,right=0,ans=0;
        Set<Character> set=new HashSet();
        int len=0;
        while(right<n){
            char c=s.charAt(right);
            if(!set.contains(c)){
                len++;
                right++;
                set.add(c);
            }
            else{
                len--;
                set.remove(s.charAt(left));
                left++;
            }
            ans=Math.max(ans,len);
        }
        return ans;

    }
}
```

2. 滑动窗口+数组：优化1，使用数组存放，ASCII编码，使用128大小的数组存放

> 执行用时：2 ms, 在所有 Java 提交中击败了92.81%的用户
>
> 内存消耗：41.2 MB, 在所有 Java 提交中击败了96.93%的用户
>
> 通过测试用例：987 / 987
>
> 时间 O(N)
>
> 空间 O(1)

```java
class Solution {
    public int lengthOfLongestSubstring(String s) {
        int n=s.length();
        if(n<2)return n;
        int left=0,right=0,ans=0;
        int []tmp=new int[128];
        int len=0;
        while(right<n){
            char c=s.charAt(right);
            if(tmp[c]==0){
                len++;
                right++;
                tmp[c]=1;
            }
            else{
                len--;
                tmp[s.charAt(left)]=0;
                left++;
            }
            ans=Math.max(ans,len);
        }
        return ans;
    }
}
```

