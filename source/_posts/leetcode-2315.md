---
title: leetcode 2315
tags: 刷题
category: leetcode
abbrlink: 36300
date: 2023-01-29 14:34:08
---

## 题目描述

#### [2315. 统计星号](https://leetcode.cn/problems/count-asterisks/)



给你一个字符串 `s` ，每 **两个** 连续竖线 `'|'` 为 **一对** 。换言之，第一个和第二个 `'|'` 为一对，第三个和第四个 `'|'` 为一对，以此类推。

请你返回 **不在** 竖线对之间，`s` 中 `'*'` 的数目。

**注意**，每个竖线 `'|'` 都会 **恰好** 属于一个对。

 

**示例 1：**

```
输入：s = "l|*e*et|c**o|*de|"
输出：2
解释：不在竖线对之间的字符加粗加斜体后，得到字符串："l|*e*et|c**o|*de|" 。
第一和第二条竖线 '|' 之间的字符不计入答案。
同时，第三条和第四条竖线 '|' 之间的字符也不计入答案。
不在竖线对之间总共有 2 个星号，所以我们返回 2 。
```



## 解题思路

1. 遍历模拟：使用一个bool位作为是否为竖线中间的标记，如果不在竖线中间并且为*时，进行统计，如果遇到|，则将标记位取反

> 执行用时：1 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：39.7 MB, 在所有 Java 提交中击败了53.58%的用户
>
> 通过测试用例：69 / 69
>
> 时间 O(n)
>
> 空间O(1)

```java
class Solution {
    public int countAsterisks(String s) {
        int res=0;
        int n=s.length();
        boolean isEven=true;
        for(int i=0;i<n;i++){
            char c=s.charAt(i);
            if(c=='*'&&isEven){
                res++;
            }
            else if(c=='|'){
                isEven=!isEven;
            }
        }
        return res;
    }
}
```

