---
title: leetcode 528
tags: 刷题
category: leetcode
abbrlink: 39593
date: 2023-02-18 11:41:24
---

## 题目描述

#### [528. 按权重随机选择](https://leetcode.cn/problems/random-pick-with-weight/)



给你一个 **下标从 0 开始** 的正整数数组 `w` ，其中 `w[i]` 代表第 `i` 个下标的权重。

请你实现一个函数 `pickIndex` ，它可以 **随机地** 从范围 `[0, w.length - 1]` 内（含 `0` 和 `w.length - 1`）选出并返回一个下标。选取下标 `i` 的 **概率** 为 `w[i] / sum(w)` 。



- 例如，对于 `w = [1, 3]`，挑选下标 `0` 的概率为 `1 / (1 + 3) = 0.25` （即，25%），而选取下标 `1` 的概率为 `3 / (1 + 3) = 0.75`（即，`75%`）。

 

**示例 1：**

```
输入：
["Solution","pickIndex"]
[[[1]],[]]
输出：
[null,0]
解释：
Solution solution = new Solution([1]);
solution.pickIndex(); // 返回 0，因为数组中只有一个元素，所以唯一的选择是返回下标 0。
```



## 解题思路

1. 前缀和+二分查找，重点是将权重数组以前缀和的形式表示出来，假设总权重和为sum，那么在[1,sum]上随机取数字，落在权重大的区间上的概率更大。二分查找只是更快的查到**下标最大的小于x的区间**在哪

int x=(int)(Math.random()*sum)+1;的取值很重要，random返回的是[0,1)的数字，不加1永远取不到sum的右边界

> 执行用时：25 ms, 在所有 Java 提交中击败了45.06%的用户
>
> 内存消耗：45.8 MB, 在所有 Java 提交中击败了80.66%的用户
>
> 通过测试用例：57 / 57
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    int []pre;
    int sum=0;

    public Solution(int[] w) {
        pre=new int[w.length];
        pre[0]=w[0];
        for(int i=1;i<w.length;i++){
            pre[i]=pre[i-1]+w[i];
        }
        sum=Arrays.stream(w).sum();
    }
    
    public int pickIndex() {
        int x=(int)(Math.random()*sum)+1;
        return binarySearch(pre,x);

    }
    public int binarySearch(int []pre,int x){
        int left=0,right=pre.length-1;
        while(left<right){
            int mid=(left+right)/2;
            if(pre[mid]<x){
                left=mid+1;
            }
            else{
                right=mid;
            }
        }
        return left;
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * Solution obj = new Solution(w);
 * int param_1 = obj.pickIndex();
 */
```

