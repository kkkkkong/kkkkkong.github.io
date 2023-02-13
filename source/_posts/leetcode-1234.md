---
title: leetcode 1234
tags: 刷题
category: leetcode
abbrlink: 43357
date: 2023-02-13 17:30:25
---

## 题目描述

#### [1234. 替换子串得到平衡字符串](https://leetcode.cn/problems/replace-the-substring-for-balanced-string/)



有一个只含有 `'Q', 'W', 'E', 'R'` 四种字符，且长度为 `n` 的字符串。

假如在该字符串中，这四个字符都恰好出现 `n/4` 次，那么它就是一个「平衡字符串」。

 

给你一个这样的字符串 `s`，请通过「替换一个子串」的方式，使原字符串 `s` 变成一个「平衡字符串」。

你可以用和「待替换子串」长度相同的 **任何** 其他字符串来完成替换。

请返回待替换子串的最小可能长度。

如果原字符串自身就是一个平衡字符串，则返回 `0`。

 

**示例 1：**

```
输入：s = "QWER"
输出：0
解释：s 已经是平衡的了。
```

## 解题思路

1. 暴力解法，超时了

2. 滑动窗口，重要的是窗口左右移动的时机

> 执行用时：10 ms, 在所有 Java 提交中击败了22.95%的用户
>
> 内存消耗：41.6 MB, 在所有 Java 提交中击败了43.44%的用户
>
> 通过测试用例：40 / 40
>
> 时间 O(N)
>
> 空间 O(1)

```java
class Solution {
    public int balancedString(String s) {
        int []cnt=new int[4];
        String t="QWER";
        int n=s.length();
        for(int i=0;i<n;i++){
            cnt[t.indexOf(s.charAt(i))]++;
        }
        int m=n/4;
        if(cnt[0]==m&&cnt[1]==m&&cnt[2]==m&&cnt[3]==m){
            return 0;
        }
        int ans=n;
        for(int i=0,j=0;j<n;j++){
            cnt[t.indexOf(s.charAt(j))]--;
            while(i<=j&&cnt[0]<=m&&cnt[1]<=m&&cnt[2]<=m&&cnt[3]<=m){
                ans=Math.min(ans,j-i+1);
                cnt[t.indexOf(s.charAt(i++))]++;
            }
        }
        return ans;
    }
}
```

