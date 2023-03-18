---
title: leetcode 183
tags:
  - 刷题
  - 数据库
category: leetcode
abbrlink: 15535
date: 2023-03-14 16:06:33
---

## 题目描述

#### [183. 从不订购的客户](https://leetcode.cn/problems/customers-who-never-order/)

难度简单429收藏分享切换为英文接收动态反馈

SQL架构

某网站包含两个表，`Customers` 表和 `Orders` 表。编写一个 SQL 查询，找出所有从不订购任何东西的客户。

`Customers` 表：

```
+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
```

`Orders` 表：

```
+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
```

例如给定上述表格，你的查询应返回：

```
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
```

## 解题思路

1. leftjoin

> 执行用时：320 ms, 在所有 MySQL 提交中击败了88.37%的用户
>
> 内存消耗：0 B, 在所有 MySQL 提交中击败了100.00%的用户
>
> 通过测试用例：11 / 11

```sql
# Write your MySQL query statement below
select
name as Customers

from

customers as c left join orders as o

on c.id=o.customerid

where o.customerid is null;


```

