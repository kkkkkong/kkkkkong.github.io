---
title: leetcode 2351
tags: 刷题
abbrlink: 36559
date: 2023-01-01 08:52:11
---

## 题目描述

简单题不简单

给你一个由小写英文字母组成的字符串 s ，请你找出并返回第一个出现 两次 的字母。

注意：

如果 a 的 第二次 出现比 b 的 第二次 出现在字符串中的位置更靠前，则认为字母 a 在字母 b 之前出现两次。
s 包含至少一个出现两次的字母。

[2351. 第一个出现两次的字母 - 力扣（LeetCode）](https://leetcode.cn/problems/first-letter-to-appear-twice/)



## 解题思路

1. 最开始想用hashmap解决，因为用的比较熟悉了

```java
class Solution {
    public char repeatedCharacter(String s) {
        HashMap map=new HashMap();
        for(int i=0;i<s.length();i++){
            if(map.containsKey(s.charAt(i))){
                return s.charAt(i);
            }
            map.put(s.charAt(i),1);
        }
        return s.charAt(0);

    }
}
```

2. 后来发现，这东西用hashset更合适，因为只需要存key，value没有实际意义

```java
class Solution {
    public char repeatedCharacter(String s) {
        HashSet set=new HashSet();
        for(int i=0;i<s.length();i++){
            if(!set.add(s.charAt(i))){
                return s.charAt(i);
            }
        }
        return ' ';
    }
}
```

3. 看了解析之后，发现可以用位运算，通过int类型的后26位，模拟26个字母，对应某位为1则 &的结果不为0，因此可以找到第一个元素；否则将该元素 | 运算后将对应位置为1

```java
class Solution {
    public char repeatedCharacter(String s) {
        int letter=0;
        
        for(int i=0;i<s.length();i++){
            int l=s.charAt(i)-'a';
            if((letter&(1<<l))!=0){
                return s.charAt(i);
            }
            else{
                letter=letter|1<<l;
            }
        }
        return ' ';
    }
}
```

