---
title: leetcode 86
tags: 刷题
category: leetcode
abbrlink: 15332
date: 2023-02-28 11:11:28
---

## 题目描述

#### [86. 分隔链表](https://leetcode.cn/problems/partition-list/)



给你一个链表的头节点 `head` 和一个特定值 `x` ，请你对链表进行分隔，使得所有 **小于** `x` 的节点都出现在 **大于或等于** `x` 的节点之前。

你应当 **保留** 两个分区中每个节点的初始相对位置。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/partition.jpg)

```
输入：head = [1,4,3,2,5,2], x = 3
输出：[1,2,2,4,3,5]
```

## 解题思路

1. 注意要断开原指针的链接

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41.1 MB, 在所有 Java 提交中击败了40.53%的用户
>
> 通过测试用例：168 / 168
>
> 时间 O(N)
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
    public ListNode partition(ListNode head, int x) {
        ListNode ans=new ListNode(-1),p=ans;
        ListNode tail=new ListNode(-1),p2=tail;
        while(head!=null){
            if(head.val<x){
                p.next=head;
                p=p.next;
            }
            else{
                p2.next=head;
                p2=p2.next;
            }
            // 断开原链表中的每个节点的 next 指针
            ListNode tmp=head.next;
            head.next=null;
            head=tmp;
        }
        p.next=tail.next;
        return ans.next;

    }
}
```

