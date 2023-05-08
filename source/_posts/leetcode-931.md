---
title: leetcode 931
tags: 刷题
category: leetcode
abbrlink: 4008
date: 2023-04-19 10:00:21
---

## 题目描述

#### [931. 下降路径最小和](https://leetcode.cn/problems/minimum-falling-path-sum/)



给你一个 `n x n` 的 **方形** 整数数组 `matrix` ，请你找出并返回通过 `matrix` 的**下降路径** 的 **最小和** 。

**下降路径** 可以从第一行中的任何元素开始，并从每一行中选择一个元素。在下一行选择的元素和当前行所选元素最多相隔一列（即位于正下方或者沿对角线向左或者向右的第一个元素）。具体来说，位置 `(row, col)` 的下一个元素应当是 `(row + 1, col - 1)`、`(row + 1, col)` 或者 `(row + 1, col + 1)` 。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/failing1-grid.jpg)

```
输入：matrix = [[2,1,3],[6,5,4],[7,8,9]]
输出：13
解释：如图所示，为和最小的两条下降路径
```

## 解题思路

1. 二维dp

> 执行用时：5 ms, 在所有 Java 提交中击败了41.74%的用户
>
> 内存消耗：41.7 MB, 在所有 Java 提交中击败了79.21%的用户
>
> 通过测试用例：49 / 49
>
> 时间O(N*N)
>
> 空间 O(N*N)

```java
class Solution {
    public int minFallingPathSum(int[][] matrix) {
        int m=matrix.length;
        int n=matrix[0].length;
        int [][]dp=new int[m][n];
        for(int i=0;i<n;i++){
            dp[0][i]=matrix[0][i];
        }
        for(int i=1;i<m;i++){
            for(int j=0;j<n;j++){
                int tmp=0;
                if(j==0){
                    tmp=dp[i-1][j+1];
                }
                else if(j==n-1){
                    tmp=dp[i-1][j-1];
                }
                else{
                    tmp=Math.min(dp[i-1][j-1],dp[i-1][j+1]);
                }
                dp[i][j]=matrix[i][j]+Math.min(dp[i-1][j],tmp);
            }
        }
        int ans=Integer.MAX_VALUE;
        for(int i=0;i<n;i++){
            ans=Math.min(ans,dp[m-1][i]);
        }
        return ans;


    }
}
```

2. 可以优化空间复杂度为O(N)，因为每次只使用上一行的元素