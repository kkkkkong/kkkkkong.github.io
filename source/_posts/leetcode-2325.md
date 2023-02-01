---
title: leetcode 2325
tags: 刷题
category: leetcode
abbrlink: 32204
date: 2023-02-01 09:50:55
---

## 题目描述

#### [2325. 解密消息](https://leetcode.cn/problems/decode-the-message/)



给你字符串 `key` 和 `message` ，分别表示一个加密密钥和一段加密消息。解密 `message` 的步骤如下：

1. 使用 `key` 中 26 个英文小写字母第一次出现的顺序作为替换表中的字母 **顺序** 。
2. 将替换表与普通英文字母表对齐，形成对照表。
3. 按照对照表 **替换** `message` 中的每个字母。
4. 空格 `' '` 保持不变。

- 例如，`key = "***hap***p***y*** ***bo***y"`（实际的加密密钥会包含字母表中每个字母 **至少一次**），据此，可以得到部分对照表（`'h' -> 'a'`、`'a' -> 'b'`、`'p' -> 'c'`、`'y' -> 'd'`、`'b' -> 'e'`、`'o' -> 'f'`）。

返回解密后的消息。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/ex1new4.jpg)

```
输入：key = "the quick brown fox jumps over the lazy dog", message = "vkbs bs t suepuv"
输出："this is a secret"
解释：对照表如上图所示。
提取 "the quick brown fox jumps over the lazy dog" 中每个字母的首次出现可以得到替换表。
```

## 解题思路

1. 哈希表

> 执行用时：6 ms, 在所有 Java 提交中击败了50.73%的用户
>
> 内存消耗：41.3 MB, 在所有 Java 提交中击败了62.04%的用户
>
> 通过测试用例：69 / 69
>
> 时间 O(n)
>
> 空间 O(n)

```java
class Solution {
    public String decodeMessage(String key, String message) {
        // 使用HashMap存储密码的对应值
        Map<Character,Character> map=new HashMap();
        int num=0;
        for(int i=0;i<key.length();i++){
            char c=key.charAt(i);
            if(c==' '){
                continue;
            }
            else if(!map.containsKey(c)){
                map.put(c,(char)('a'+num));
                num++;
            }
        }
        // 遍历message翻译
        char[] res=new char[message.length()];
        for(int i=0;i<message.length();i++){
            char c=message.charAt(i);
            if(c==' '){
                res[i]=' ';
            }
            else{
                res[i]=map.get(c);
            }
        }
        return new String(res);
    }
}
```

2. 使用数组代替哈希表，*对于以字母作为索引的操作，能用定长数组就不要用哈希，因为映射本身需要资源，而且无论分配空间还是寻址，堆区都不如栈区*

> 执行用时：3 ms, 在所有 Java 提交中击败了77.37%的用户
>
> 内存消耗：40.2 MB, 在所有 Java 提交中击败了95.62%的用户
>
> 通过测试用例：69 / 69
>
> 时间 O(n)
>
> 空间 O(n)

```java
class Solution {
    public String decodeMessage(String key, String message) {
        // 使用数组存储字典值
        char[] map=new char[26];
        int num=0;
        // 遍历key，存储密码值
        for(int i=0;i<key.length();i++){
            char c=key.charAt(i);
            if(c==' ')continue;
            
            if(!Character.isLowerCase(map[c-'a'])){
                map[c-'a']=(char)('a'+num);
                num++;
            }
        }
        // 翻译
        char[] res=new char[message.length()];
        for(int i=0;i<message.length();i++){
            char c=message.charAt(i);
            if(c==' '){
                res[i]=' ';
            }
            else{
                res[i]=map[c-'a'];
            }
        }
        return new String(res);
    }
}
```

