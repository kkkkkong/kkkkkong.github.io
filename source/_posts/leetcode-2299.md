---
title: leetcode 2299
tags: 刷题
category: leetcode
abbrlink: 34970
date: 2023-01-19 09:57:11
---

## 题目描述

#### [2299. 强密码检验器 II](https://leetcode.cn/problems/strong-password-checker-ii/)



如果一个密码满足以下所有条件，我们称它是一个 **强** 密码：

- 它有至少 `8` 个字符。
- 至少包含 **一个小写英文** 字母。
- 至少包含 **一个大写英文** 字母。
- 至少包含 **一个数字** 。
- 至少包含 **一个特殊字符** 。特殊字符为：`"!@#$%^&*()-+"` 中的一个。
- 它 **不** 包含 `2` 个连续相同的字符（比方说 `"aab"` 不符合该条件，但是 `"aba"` 符合该条件）。

给你一个字符串 `password` ，如果它是一个 **强** 密码，返回 `true`，否则返回 `false` 。

 

**示例 1：**

```
输入：password = "IloveLe3tcode!"
输出：true
解释：密码满足所有的要求，所以我们返回 true 。
```



## 解题思路

1. 模拟，这里的判断方法可以用Character里的现有方法替代

> 执行用时：1 ms, 在所有 Java 提交中击败了69.57%的用户
>
> 内存消耗：39.5 MB, 在所有 Java 提交中击败了53.26%的用户
>
> 通过测试用例：148 / 148
>
> 时间 O(n)
>
> 空间 O(1)

```java
class Solution {
    public boolean strongPasswordCheckerII(String password) {
        int n=password.length();
        if(n<8)return false;
        boolean have_big=false,have_small=false,have_num=false,have_sp=false;
        char pre='\n';
        String sp="!@#$%^&*()-+";
        for(int i=0;i<n;i++){
            char c=password.charAt(i);
            if(c==pre){
                return false;
            }
            pre=c;
            if(sp.contains(String.valueOf(c))){
                have_sp=true;
            }
            // 大写字母
            else if(c-'A'>=0&&c-'A'<26){
                have_big=true;
            }
            else if(c-'a'>=0&&c-'a'<26){
                have_small=true;
            }
            else if(c-'0'>=0&&c-'0'<10){
                have_num=true;
            }

        }
        return have_big&&have_num&&have_small&&have_sp;
    }
}
```

