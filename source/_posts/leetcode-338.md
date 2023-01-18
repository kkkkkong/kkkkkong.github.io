---
title: leetcode 338
tags: 刷题
category: leetcode
abbrlink: 2888
date: 2023-01-18 09:16:15
---

## 题目描述

#### [338. 比特位计数](https://leetcode.cn/problems/counting-bits/)



给你一个整数 `n` ，对于 `0 <= i <= n` 中的每个 `i` ，计算其二进制表示中 **`1` 的个数** ，返回一个长度为 `n + 1` 的数组 `ans` 作为答案。

 

**示例 1：**

```
输入：n = 2
输出：[0,1,1]
解释：
0 --> 0
1 --> 1
2 --> 10
```

## 解题思路

1. 迭代，遍历每个元素，依次获取

> 执行用时：12 ms, 在所有 Java 提交中击败了6.33%的用户
>
> 内存消耗：45.1 MB, 在所有 Java 提交中击败了96.57%的用户
>
> 通过测试用例：15 / 15
>
> 将除法和取余运算修改为位运算
>
> 执行用时：5 ms, 在所有 Java 提交中击败了18.58%的用户
>
> 内存消耗：45.6 MB, 在所有 Java 提交中击败了37.43%的用户
>
> 通过测试用例：15 / 15
>
> 时间 O(n*logn)
>
> 空间 O(1)

```java
class Solution {
    public int[] countBits(int n) {
        int []res=new int[n+1];
        for(int i=0;i<=n;i++){
            int num=i;
            while(num!=0){
                if(num%2!=0){
                    res[i]++;
                }
                num/=2;
            }
        }
        return res;
    }
}
// -------------------------------------------
class Solution {
    public int[] countBits(int n) {
        int []res=new int[n+1];
        for(int i=0;i<=n;i++){
            int num=i;
            while(num!=0){
                if((num&1)==1){
                    res[i]++;
                }
                num=num>>1;
            }
        }
        return res;

    }
}
```

2. 找规律：可以发现，把数字分为两种情况，奇数和偶数
   1. 奇数：n中1的个数为n-1的个数+1
   2. 偶数：末尾一定为0，对应的1的个数为去掉末尾0的个数

> 执行用时：1 ms, 在所有 Java 提交中击败了99.98%的用户
>
> 内存消耗：45.5 MB, 在所有 Java 提交中击败了52.85%的用户
>
> 通过测试用例：15 / 15
>
> 时间 O(n)
>
> 空间 O(1)

```java
class Solution {
    public int[] countBits(int n) {
        int []res=new int[n+1];
        for(int i=0;i<=n;i++){
            // 如果是偶数
            if((i&1)==0){
                res[i]=res[i>>1];
            }
            else{
                res[i]=res[i-1]+1;
            }
        }
        return res;
    }
}
```

