---
title: leetcode 182
tags: 刷题
category: leetcode
abbrlink: 64622
date: 2023-03-22 09:37:18
---

## 题目描述

#### [182. 查找重复的电子邮箱](https://leetcode.cn/problems/duplicate-emails/)



SQL架构



表: `Person`

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id 是该表的主键列。
此表的每一行都包含一封电子邮件。电子邮件不包含大写字母。
```

 

编写一个 SQL 查询来报告所有重复的电子邮件。 请注意，可以保证电子邮件字段不为 NULL。

以 **任意顺序** 返回结果表。

查询结果格式如下例。

 

**示例 1:**

```
输入: 
Person 表:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
输出: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
解释: a@b.com 出现了两次。
```

## 解题思路

1. 先建立一个子表，在查询

> 执行用时：378 ms, 在所有 MySQL 提交中击败了58.00%的用户
>
> 内存消耗：0 B, 在所有 MySQL 提交中击败了100.00%的用户
>
> 通过测试用例：15 / 15

```sql
# Write your MySQL query statement below
select
Email
from
(select
email,count(email) as num
from person
group by 
email) as tab
where num >1;

```



1. group by+having

> 执行用时：435 ms, 在所有 MySQL 提交中击败了15.93%的用户
>
> 内存消耗：0 B, 在所有 MySQL 提交中击败了100.00%的用户
>
> 通过测试用例：15 / 15

```sql
# Write your MySQL query statement below
select
Email
from 
Person
group by
Email
having count(Email)>1;
```

