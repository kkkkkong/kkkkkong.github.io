---
title: leetcode 1802
tags: 刷题
category: leetcode
abbrlink: 23037
date: 2023-01-04 10:11:30
---

## 题目描述

给你三个正整数 n、index 和 maxSum 。你需要构造一个同时满足下述所有条件的数组 nums（下标 从 0 开始 计数）：

nums.length == n
nums[i] 是 正整数 ，其中 0 <= i < n
abs(nums[i] - nums[i+1]) <= 1 ，其中 0 <= i < n-1
nums 中所有元素之和不超过 maxSum
nums[index] 的值被 最大化
返回你所构造的数组中的 nums[index] 。

注意：abs(x) 等于 x 的前提是 x >= 0 ；否则，abs(x) 等于 -x 。

[1802. 有界数组中指定下标处的最大值 - 力扣（LeetCode）](https://leetcode.cn/problems/maximum-value-at-a-given-index-in-a-bounded-array/)

## 解题思路

1. 自己想的，没有什么章法

```java
class Solution {
    public int maxValue(int n, int index, int maxSum) {
        if(n==maxSum)return 1;
        int res;
        int nowSum=0;
        int num=1;
        // 一个较小值，通过平均值计算，比平均值小n的数字一定是小于结果值的，因此设置所有数字都是rev
        int rev=maxSum/n-n;
        if(rev>0){
            // 当maxsum较大时，设置一个基值，相当于剪枝
            nowSum+=rev*n+1;
            res=rev+1;
        }
        // rev小于0，表示maxsum不是很大
        else{
            res=2;
            nowSum=n+1;

        }
        while(nowSum<maxSum){
            int left=index>num?num:index;
            int right=(index+num)>(n-1)?(n-1-index):(num);
            nowSum+=left+right+1;
            if(nowSum>maxSum){
                return res;
            }
            res++;
            num++;
        }
        return res;
    }
}
```

