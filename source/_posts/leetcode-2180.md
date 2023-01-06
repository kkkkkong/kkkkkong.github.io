---
title: leetcode 2180
tags: 刷题
category: leetcode
abbrlink: 7851
date: 2023-01-06 10:26:25
---

## 题目描述

#### [2180. 统计各位数字之和为偶数的整数个数](https://leetcode.cn/problems/count-integers-with-even-digit-sum/)



给你一个正整数 `num` ，请你统计并返回 **小于或等于** `num` 且各位数字之和为 **偶数** 的正整数的数目。

正整数的 **各位数字之和** 是其所有位上的对应数字相加的结果。



## 解题思路

1. 暴力求解，依次判断每个数字是否符合要求

> 执行用时：1 ms, 在所有 Java 提交中击败了83.26%的用户
>
> 内存消耗：38.4 MB, 在所有 Java 提交中击败了45.61%的用户
>
> 通过测试用例：71 / 71
>
> 时间 O(n*logn)
>
> 空间 O(1)

```java
class Solution {
    public int countEven(int num) {
        int res=0;
        for(int i=2;i<=num;i++){
            if(isTrue(i)){
                res++;
            }
        }
        return res;
    }
    public boolean isTrue(int num){
        int res=0;
        int tmp=0;
        while(num!=0){
            tmp=num%10;
            num=num/10;
            res+=tmp;
        }
        if(res%2==0){
            return true;
        }
        return false;
    }
}
```

2. 数学推导方法
   1. 将num分成10×y+x的表达形式，分成两个区间[0,10×y) 和[10×y+0,10×y+x]
      1. 在区间[10×y+0,10×y+x]区间内，符合条件的个数为（上下取整这里最开始理解错了，改了半天） ：
         1. 如果y是偶数，那么个数为 x/2(向下取整)+1
         2. 如果y是奇数，那么个数为 x/2 (向上取整)
      2. 在区间[0,10×y+0) 内，符合条件的个数为5×y
         1. 因为从0开始，每个个位数都是0-9，对应的奇偶都是5个，因此无论**非个位**数字的是奇是偶，总体都是5个
   2. 最后由于计算时包含了0，因此返回结果将其 -1

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：38.5 MB, 在所有 Java 提交中击败了29.29%的用户
>
> 通过测试用例：71 / 71
>
> 时间 O(logn)
>
> 空间 O(1)

```java
class Solution {
    public int countEven(int num) {
        int y=num/10,x=num%10;
        int res=y*5;
        if(isTrue(y)){
            // 查找有多少个偶数。包含0
            res+=x/2+1;
        }
        else{
            // 查找有多少个奇数
            if(x%2==0){
                res+=x/2;
            }
            else{
                res+=x/2+1;
            }
        }
        return res-1;

    }
    public boolean isTrue(int num){
        int res=0;
        int tmp=0;
        while(num!=0){
            tmp=num%10;
            num=num/10;
            res+=tmp;
        }
        if(res%2==0){
            return true;
        }
        return false;
    }
}
```

