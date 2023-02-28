---
title: leetcode 344
tags: 刷题
category: leetcode
abbrlink: 15946
date: 2023-02-28 15:19:44
---

## 题目描述

#### [344. 反转字符串](https://leetcode.cn/problems/reverse-string/)



编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 `s` 的形式给出。

不要给另外的数组分配额外的空间，你必须**[原地](https://baike.baidu.com/item/原地算法)修改输入数组**、使用 O(1) 的额外空间解决这一问题。

 

**示例 1：**

```
输入：s = ["h","e","l","l","o"]
输出：["o","l","l","e","h"]
```



## 解题思路

1. 双指针，简单题我重拳出击

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：47.8 MB, 在所有 Java 提交中击败了94.56%的用户
>
> 通过测试用例：477 / 477
>
> 时间 O(N)
>
> 空间 O(1)

```java
class Solution {
    public void reverseString(char[] s) {
        int left=0,n=s.length,right=n-1;
        while(left<right){
            char tmp=s[left];
            s[left]=s[right];
            s[right]=tmp;
            left++;
            right--;
        }
    }
}
```

