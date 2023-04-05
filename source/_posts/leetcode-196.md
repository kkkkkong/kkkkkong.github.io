---
title: leetcode 196
tags: 刷题
category: leetcode
abbrlink: 44910
date: 2023-03-22 09:47:12
---

## 题目描述

#### [196. 删除重复的电子邮箱](https://leetcode.cn/problems/delete-duplicate-emails/)



SQL架构

表: `Person`

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id是该表的主键列。
该表的每一行包含一封电子邮件。电子邮件将不包含大写字母。
```

 

编写一个 SQL **删除语句**来 **删除** 所有重复的电子邮件，只保留一个id最小的唯一电子邮件。

以 **任意顺序** 返回结果表。 （**注意**： 仅需要写删除语句，将自动对剩余结果进行查询）

查询结果格式如下所示。

 

 

**示例 1:**

```
输入: 
Person 表:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
输出: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
解释: john@example.com重复两次。我们保留最小的Id = 1。
```

## 解题思路

1. 暴力解

> 执行用时：577 ms, 在所有 MySQL 提交中击败了82.16%的用户
>
> 内存消耗：0 B, 在所有 MySQL 提交中击败了100.00%的用户
>
> 通过测试用例：22 / 22

```sql
# Please write a DELETE statement and DO NOT write a SELECT statement.
# Write your MySQL query statement below
DELETE p1
from
person p1,person p2
where p1.email=p2.email and p1.id>p2.id;
```

