---
title: leetcode 1828
tags: 刷题
category: leetcode
abbrlink: 15996
date: 2023-01-24 10:12:47
---

## 题目描述

#### [1828. 统计一个圆中点的数目](https://leetcode.cn/problems/queries-on-number-of-points-inside-a-circle/)



给你一个数组 `points` ，其中 `points[i] = [xi, yi]` ，表示第 `i` 个点在二维平面上的坐标。多个点可能会有 **相同** 的坐标。

同时给你一个数组 `queries` ，其中 `queries[j] = [xj, yj, rj]` ，表示一个圆心在 `(xj, yj)` 且半径为 `rj` 的圆。

对于每一个查询 `queries[j]` ，计算在第 `j` 个圆 **内** 点的数目。如果一个点在圆的 **边界上** ，我们同样认为它在圆 **内** 。

请你返回一个数组 `answer` ，其中 `answer[j]`是第 `j` 个查询的答案。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/chrome_2021-03-25_22-34-16.png)

```
输入：points = [[1,3],[3,3],[5,3],[2,2]], queries = [[2,3,1],[4,3,1],[1,1,2]]
输出：[3,2,2]
解释：所有的点和圆如上图所示。
queries[0] 是绿色的圆，queries[1] 是红色的圆，queries[2] 是蓝色的圆。
```

## 解题思路

1. 两层遍历，枚举

> 执行用时：35 ms, 在所有 Java 提交中击败了51.59%的用户
>
> 内存消耗：42.2 MB, 在所有 Java 提交中击败了37.70%的用户
>
> 通过测试用例：66 / 66
>
> 时间 O(n*m)
>
> 空间 O(1)

```java
class Solution {
    public int[] countPoints(int[][] points, int[][] queries) {
        int []res=new int[queries.length];
        for(int i=0;i<queries.length;i++){
            int []query=queries[i];
            for(int []point:points){
                int query_x=query[0];
                int query_y=query[1];
                int r=query[2];
                int point_x=point[0];
                int point_y=point[1];
                // 判断是否在圆内，点到圆心距离是否小于等于半径 x*x+y*y<=r*r
                if((Math.pow((query_x-point_x),2)+Math.pow((query_y-point_y),2))<=(r*r)){
                    res[i]++;
                }
            }
        }
        return res;
    }
}
```

