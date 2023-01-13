---
title: leetcode 2287
tags: 刷题
category: leetcode
abbrlink: 56346
date: 2023-01-13 10:03:53
---

## 题目描述

#### [2287. 重排字符形成目标字符串](https://leetcode.cn/problems/rearrange-characters-to-make-target-string/)



给你两个下标从 **0** 开始的字符串 `s` 和 `target` 。你可以从 `s` 取出一些字符并将其重排，得到若干新的字符串。

从 `s` 中取出字符并重新排列，返回可以形成 `target` 的 **最大** 副本数。

 

**示例 1：**

```
输入：s = "ilovecodingonleetcode", target = "code"
输出：2
解释：
对于 "code" 的第 1 个副本，选取下标为 4 、5 、6 和 7 的字符。
对于 "code" 的第 2 个副本，选取下标为 17 、18 、19 和 20 的字符。
形成的字符串分别是 "ecod" 和 "code" ，都可以重排为 "code" 。
可以形成最多 2 个 "code" 的副本，所以返回 2 。
```

## 解题思路

1. 哈希表计数，使用HashMap分别存储在两个字符串中出现的字符数量，然后做除法，求最小值

> 执行用时：1 ms, 在所有 Java 提交中击败了40.21%的用户
>
> 内存消耗：39.7 MB, 在所有 Java 提交中击败了33.86%的用户
>
> 通过测试用例：115 / 115
>
> 时间 O(n+m) 两个字符串长度
>
> 空间 O(m) target的长度为m，空间占用不超过m

```java
class Solution {
    public int rearrangeCharacters(String s, String target) {
        Map <Character,Integer> targetMap=new HashMap();
        Map <Character,Integer> sMap=new HashMap();
        int res=Integer.MAX_VALUE;
        // 将target字符串出现次数存储
        for(int i=0;i<target.length();i++){
            char c=target.charAt(i);
            targetMap.put(c,targetMap.getOrDefault(c,0)+1);
        }
        // 将s与target中重复出现的字符串统计个数
        for(int i=0;i<s.length();i++){
            char c=s.charAt(i);
            if(targetMap.containsKey(c)){
                sMap.put(c,sMap.getOrDefault(c,0)+1);
            }
        }
        // 遍历map查找最小倍数，此处需要遍历targetMap，因为存在着出现a，ab这种测试情况
        for(Map.Entry<Character,Integer> entry:targetMap.entrySet()){
            char key=entry.getKey();
            int targetValue=entry.getValue();
            int sValue=sMap.getOrDefault(key,0);
            // 优化，某个字符串为0，直接返回0
            if(sValue==0)return 0;
            res=Math.min(res,sValue/targetValue);
        }
        return res;

    }
}
```

2. 不使用map存储，使用数组实现，与2283题类似