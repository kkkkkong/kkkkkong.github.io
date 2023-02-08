---
title: leetcode 49
tags: 刷题
category: leetcode
abbrlink: 16289
date: 2023-02-07 18:33:57
---

## 题目描述

#### [49. 字母异位词分组](https://leetcode.cn/problems/group-anagrams/)



给你一个字符串数组，请你将 **字母异位词** 组合在一起。可以按任意顺序返回结果列表。

**字母异位词** 是由重新排列源单词的字母得到的一个新单词，所有源单词中的字母通常恰好只用一次。

 

**示例 1:**

```
输入: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
输出: [["bat"],["nat","tan"],["ate","eat","tea"]]
```



## 解题思路

1. 哈希表+排序，首先将字符串按字母顺序排列，然后使用哈希表存储，添加原字符串到返回结果中

> 执行用时：6 ms, 在所有 Java 提交中击败了80.00%的用户
>
> 内存消耗：44.7 MB, 在所有 Java 提交中击败了37.70%的用户
>
> 通过测试用例：118 / 118
>
> 时间 O(NlogN)
>
> 空间 O(N)

```java
class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        List<List<String>> res=new ArrayList();
        Map<String,List<String>> map=new HashMap();
        for(int i=0;i<strs.length;i++){
            // 将字符串按字母顺序排列
            char[] strToChar=strs[i].toCharArray();
            Arrays.sort(strToChar);
            String tmp=new String(strToChar);
            // 使用哈希表存储，添加原字符串到返回结果中
            List<String> value=map.getOrDefault(tmp,new ArrayList());
            value.add(strs[i]);
            map.put(tmp,value);
        }
        for(List<String> value:map.values()){
            res.add(value);
        }
        return res;
    }
}
```

2. 评论区：在美版leetcode上看到大神的思路，用质数表示26个字母，把字符串的各个字母相乘，这样可保证字母异位词的乘积必定是相等的。其余步骤就是用map存储，和别人的一致了。（这个用质数表示真的很骚啊！！!）