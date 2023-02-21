---
title: leetcode 424
tags: 刷题
category: leetcode
abbrlink: 24568
date: 2023-02-21 09:46:17
---

## 题目描述

#### [424. 替换后的最长重复字符](https://leetcode.cn/problems/longest-repeating-character-replacement/)



给你一个字符串 `s` 和一个整数 `k` 。你可以选择字符串中的任一字符，并将其更改为任何其他大写英文字符。该操作最多可执行 `k` 次。

在执行上述操作后，返回包含相同字母的最长子字符串的长度。

 

**示例 1：**

```
输入：s = "ABAB", k = 2
输出：4
解释：用两个'A'替换为两个'B',反之亦然。
```





## 解题思路

1. 数组+滑窗：两个关键条件，一个是maxcount，表示当前窗口内的单个单词的最大数目；另一个是left向前移动的条件，right-left>max+k，巧妙的进行了控制

> 执行用时：8 ms, 在所有 Java 提交中击败了29.40%的用户
>
> 内存消耗：41.3 MB, 在所有 Java 提交中击败了53.10%的用户
>
> 通过测试用例：37 / 37
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public int characterReplacement(String s, int k) {
        int []tmp=new int [26];
        int left=0,right=0,ans=0;
        int n=s.length();
        int maxCount=0;
        while(right<n){
            tmp[s.charAt(right)-'A']++;
            maxCount=Math.max(maxCount,tmp[s.charAt(right)-'A']);
            right++;

            if(right-left>maxCount+k){
                tmp[s.charAt(left)-'A']--;
                left++;
            }
            ans=Math.max(ans,right-left);
        }
        return ans;
    }
}
```

