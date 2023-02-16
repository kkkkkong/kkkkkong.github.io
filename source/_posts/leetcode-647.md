---
title: leetcode 647
tags: 刷题
category: leetcode
abbrlink: 15898
date: 2023-02-15 09:38:38
---

## 题目描述

#### [647. 回文子串](https://leetcode.cn/problems/palindromic-substrings/)



给你一个字符串 `s` ，请你统计并返回这个字符串中 **回文子串** 的数目。

**回文字符串** 是正着读和倒过来读一样的字符串。

**子字符串** 是字符串中的由连续字符组成的一个序列。

具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被视作不同的子串。

 

**示例 1：**

```
输入：s = "abc"
输出：3
解释：三个回文子串: "a", "b", "c"
```

## 解题思路

1. 找规律+中心扩展法：参考题解，非常巧妙的应用了回文串的规律，将回文串的长度分为奇偶两种情况，**枚举每一个回文中心，并用两个指针向左右两边扩展，两个指针指向相同的时候，就扩展，否则就返回**

> 执行用时：3 ms, 在所有 Java 提交中击败了84.76%的用户
>
> 内存消耗：39.4 MB, 在所有 Java 提交中击败了84.78%的用户
>
> 通过测试用例：130 / 130
>
> 时间 O(N*N)
>
> 空间 O(1)

```java
class Solution {
    int num=0;
    public int countSubstrings(String s) {
        int n=s.length();
        for(int i=0;i<n;i++){
            count(s,i,i);
            count(s,i,i+1);
        }
        return num;

    }
    public void count(String s,int start,int end){
        while(start>=0&&end<s.length()&&s.charAt(start)==s.charAt(end)){
            num++;
            start--;
            end++;
        }
    }
}
```

2. 马拉车算法，还没吃透

> 执行用时：3 ms, 在所有 Java 提交中击败了84.76%的用户
>
> 内存消耗：39.6 MB, 在所有 Java 提交中击败了75.45%的用户
>
> 通过测试用例：130 / 130
>
> 时间 O(N)
>
> 空间 O(1)

```java
class Solution {
    public int countSubstrings(String s) {
        int n=s.length();
        StringBuffer t=new StringBuffer("$#");
        for(int i=0;i<n;i++){
            t.append(s.charAt(i));
            t.append('#');
        }
        n=t.length();
        t.append('!');
        int []f=new int[n];
        int iMax=0,rMax=0,ans=0;
        for(int i=1;i<n;i++){
            f[i]=i<=rMax?Math.min(rMax-i+1,f[2*iMax-i]):1;
            while(t.charAt(i+f[i])==t.charAt(i-f[i])){
                ++f[i];
            }
            if(i+f[i]-1>rMax){
                iMax=i;
                rMax=i+f[i]-1;
            }
            ans+=f[i]/2;
        }
        return ans;
    }
}
```

