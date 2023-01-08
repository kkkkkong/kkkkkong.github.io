---
title: leetcode 206
tags: 刷题
abbrlink: 65432
date: 2023-01-08 18:17:01
---

## 题目描述

#### [206. 反转链表](https://leetcode.cn/problems/reverse-linked-list/)

给你单链表的头节点 `head` ，请你反转链表，并返回反转后的链表。

## 解题思路

1. 迭代，原地翻转，将待翻转链表头部的node摘出来；遍历链表时，将当前head.next存储起来，然后将head插入res和res.next 之间

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41.6 MB, 在所有 Java 提交中击败了9.12%的用户
>
> 通过测试用例：28 / 28
>
> 时间 O(n)
>
> 空间 O(1)

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode reverseList(ListNode head) {
        ListNode res=new ListNode();
        while(head!=null){
            ListNode tmp=head.next;
            head.next=res.next;
            res.next=head;
            head=tmp;
        }
        return res.next;
    }
}
```

2. 递归