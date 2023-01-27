---
title: leetcode 2309
tags: 刷题
category: leetcode
abbrlink: 6349
date: 2023-01-27 11:15:47
---

## 题目描述

#### [2309. 兼具大小写的最好英文字母](https://leetcode.cn/problems/greatest-english-letter-in-upper-and-lower-case/)



给你一个由英文字母组成的字符串 `s` ，请你找出并返回 `s` 中的 **最好** 英文字母。返回的字母必须为大写形式。如果不存在满足条件的字母，则返回一个空字符串。

**最好** 英文字母的大写和小写形式必须 **都** 在 `s` 中出现。

英文字母 `b` 比另一个英文字母 `a` **更好** 的前提是：英文字母表中，`b` 在 `a` 之 **后** 出现。

 

**示例 1：**

```
输入：s = "lEeTcOdE"
输出："E"
解释：
字母 'E' 是唯一一个大写和小写形式都出现的字母。
```

## 解题思路

1. 通过数组存储状态，遍历访问数组，获取状态，并存取最大值

> 执行用时：6 ms, 在所有 Java 提交中击败了36.94%的用户
>
> 内存消耗：40.1 MB, 在所有 Java 提交中击败了75.37%的用户
>
> 通过测试用例：113 / 113
>
> 时间 O(n)
>
> 空间 O(1)

```java
class Solution {
    public String greatestLetter(String s) {
        int max=-1;
        // 数组值为1，表示有小写字母；数组值为2，表示有大写字母
        int []tmp=new int[26];
        for(int i=0;i<s.length();i++){
            char c=s.charAt(i);
            if(Character.isUpperCase(c)){
                if(tmp[c-'A']==1){
                    max=Math.max(max,c-'A');
                }
                tmp[c-'A']=2;
            }
            else if(Character.isLowerCase(c)){
                if(tmp[c-'a']==2){
                    max=Math.max(max,c-'a');
                }
                tmp[c-'a']=1;
            }
        }
        return max==-1?"":String.valueOf((char)('A'+max));
    }
}
```

