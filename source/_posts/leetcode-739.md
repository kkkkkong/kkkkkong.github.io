---
title: leetcode 739
tags: 刷题
category: leetcode
abbrlink: 2760
date: 2023-02-06 19:16:44
---

## 题目描述

#### [739. 每日温度](https://leetcode.cn/problems/daily-temperatures/)



给定一个整数数组 `temperatures` ，表示每天的温度，返回一个数组 `answer` ，其中 `answer[i]` 是指对于第 `i` 天，下一个更高温度出现在几天后。如果气温在这之后都不会升高，请在该位置用 `0` 来代替。

 

**示例 1:**

```
输入: temperatures = [73,74,75,71,69,72,76,73]
输出: [1,1,4,2,1,1,0,0]
```



## 解题思路

1. 暴力求解，两层for，超时

> 时间 O(N*N)
>
> 空间 O(1)

```java
class Solution {
    public int[] dailyTemperatures(int[] temperatures) {
        // 两层for，向后遍历
        int n=temperatures.length;
        int []res=new int [n];
        for(int i=0;i<n-1;i++){
            for(int j=i+1;j<n;j++){
                if(temperatures[j]>temperatures[i]){
                    res[i]=j-i;
                    break;
                }
            }
        }
        return res;
    }
}
```

2. 找规律，根据题意，从后向前推会比较方便，分为几种情况，用t[i]表示第i天的气温
   - t[i]<t[i+1]
     - res[i]为1
   - t[i]>=t[i+1]
     - if t[i+1]==0，那么t[i]=0
     - 否则比较t[i]与t[i+res[i+1]]的大小

将+1抽象为+j，那么有循环寻找下一个大值

> 执行用时：8 ms, 在所有 Java 提交中击败了99.06%的用户
>
> 内存消耗：51.4 MB, 在所有 Java 提交中击败了96.45%的用户
>
> 通过测试用例：48 / 48
>
> 时间 O(N)
>
> 空间 O(1)

```java
class Solution {
    public int[] dailyTemperatures(int[] temperatures) {
        int n=temperatures.length;
        int []res=new int [n];
        if(n==1)return res;
        for(int i=n-2;i>=0;i--){
            for(int j=1;j<=n-1-i;j+=res[i+j]){
                if(temperatures[i]<temperatures[i+j]){
                    res[i]=j;
                    break;
                }
                else if(res[i+j]==0){
                    res[i]=0;
                    break;
                }
            }
        }
        return res;
    }
}
```

