---
title: leetcode 1817
tags: 刷题
category: leetcode
abbrlink: 51772
date: 2023-01-20 19:56:30
---

## 题目描述

#### [1817. 查找用户活跃分钟数](https://leetcode.cn/problems/finding-the-users-active-minutes/)



给你用户在 LeetCode 的操作日志，和一个整数 `k` 。日志用一个二维整数数组 `logs` 表示，其中每个 `logs[i] = [IDi, timei]` 表示 ID 为 `IDi` 的用户在 `timei` 分钟时执行了某个操作。

**多个用户** 可以同时执行操作，单个用户可以在同一分钟内执行 **多个操作** 。

指定用户的 **用户活跃分钟数（user active minutes，UAM）** 定义为用户对 LeetCode 执行操作的 **唯一分钟数** 。 即使一分钟内执行多个操作，也只能按一分钟计数。

请你统计用户活跃分钟数的分布情况，统计结果是一个长度为 `k` 且 **下标从 1 开始计数** 的数组 `answer` ，对于每个 `j`（`1 <= j <= k`），`answer[j]` 表示 **用户活跃分钟数** 等于 `j` 的用户数。

返回上面描述的答案数组 `answer` 。

 

**示例 1：**

```
输入：logs = [[0,5],[1,2],[0,2],[0,5],[1,3]], k = 5
输出：[0,2,0,0,0]
解释：
ID=0 的用户执行操作的分钟分别是：5 、2 和 5 。因此，该用户的用户活跃分钟数为 2（分钟 5 只计数一次）
ID=1 的用户执行操作的分钟分别是：2 和 3 。因此，该用户的用户活跃分钟数为 2
2 个用户的用户活跃分钟数都是 2 ，answer[2] 为 2 ，其余 answer[j] 的值都是 0
```



## 解题思路

1. 哈希表存储：使用`HashMap <Integer,HashSet<Integer>>`储存信息

> 执行用时：16 ms, 在所有 Java 提交中击败了86.21%的用户
>
> 内存消耗：52.4 MB, 在所有 Java 提交中击败了9.20%的用户
>
> 通过测试用例：38 / 38
>
> 时间 O(n)
>
> 空间 O(n)

```java
class Solution {
    public int[] findingUsersActiveMinutes(int[][] logs, int k) {
        int []res=new int [k];
        HashMap <Integer,HashSet<Integer>> map=new HashMap();
        for(int i=0;i<logs.length;i++){
            int key=logs[i][0];
            int value=logs[i][1];
            HashSet set=map.getOrDefault(key,new HashSet());
            set.add(value);
            map.put(key,set);
        }
        for(HashSet set:map.values()){
            res[set.size()-1]++;
        }
        return res;
    }
}
```

