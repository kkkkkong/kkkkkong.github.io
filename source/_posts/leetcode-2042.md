---
title: leetcode 2042
tags: 刷题
abbrlink: 8062
date: 2023-01-03 18:39:19
---

## 题目描述

句子是由若干 token 组成的一个列表，token 间用 单个 空格分隔，句子没有前导或尾随空格。每个 token 要么是一个由数字 0-9 组成的不含前导零的 正整数 ，要么是一个由小写英文字母组成的 单词 。

示例，"a puppy has 2 eyes 4 legs" 是一个由 7 个 token 组成的句子："2" 和 "4" 是数字，其他像 "puppy" 这样的 tokens 属于单词。
给你一个表示句子的字符串 s ，你需要检查 s 中的 全部 数字是否从左到右严格递增（即，除了最后一个数字，s 中的 每个 数字都严格小于它 右侧 的数字）。

如果满足题目要求，返回 true ，否则，返回 false 。

[2042. 检查句子中的数字是否递增 - 力扣（LeetCode）](https://leetcode.cn/problems/check-if-numbers-are-ascending-in-a-sentence/)

## 解题思路

> 以后要仔细读题了，把简单题做复杂了

这题没有看到数字的限制，自然而然的想到有些数字会超出int的范围（如 >2147483647的数字），然后就写了个比较的函数，后来看见了题目后面的条件

1. 使用split的方式

**98 / 98** 个通过测试用例

状态：*通过*

执行用时: **4 ms**

内存消耗: **39.6 MB**

```java

class Solution {
    public boolean areNumbersAscending(String s) {
        String [] array=s.split(" ");
        int len=0;
        String tmp="0";
        for(String a:array){
            if(isNum(a)){
                if(!isBig(a,tmp)){
                    return false;
                }
                tmp=a;
            }
        }
        return true;

    }
    public boolean isNum(String s){
        if(s.charAt(0)>'0'&&s.charAt(0)<='9'){
            return true;
        }
        return false;
    }
    // 如果a大于b，返回true，否则返回false
    public boolean isBig(String a,String b){
        int a_len=a.length(),b_len=b.length();
        System.out.println(a_len);
        if(a_len>b_len){
            return true;
        }
        else if(a_len<b_len){
            return false;
        }
        else{
            for(int i=0;i<a_len;i++){
                if(a.charAt(i)>b.charAt(i)){
                    return true;
                }
                else if(a.charAt(i)<b.charAt(i)){
                    return false;
                }
            }
            // 相等返回false
            return false;
        }
    }
}
```

2. 

执行用时：1 ms, 在所有 Java 提交中击败了89.21%的用户

内存消耗：39.6 MB, 在所有 Java 提交中击败了56.43%的用户

通过测试用例：98 / 98

```java
class Solution {
    public boolean areNumbersAscending(String s) {
        String [] array=s.split(" ");
        int pre=0;
        String tmp="0";
        for(String a:array){
            if(isNum(a)){
                int now=Integer.parseInt(a);
                if(now<=pre){
                    return false;
                }
                pre=now;
            }
        }
        return true;

    }
    public boolean isNum(String s){
        if(s.charAt(0)>'0'&&s.charAt(0)<='9'){
            return true;
        }
        return false;
    }
}
```

3. 自己切分字符串，更快