---
title: leetcode 92
tags: 刷题
category: leetcode
abbrlink: 26852
date: 2023-04-05 09:14:16
---

## 题目描述

#### [92. 反转链表 II](https://leetcode.cn/problems/reverse-linked-list-ii/)



给你单链表的头指针 `head` 和两个整数 `left` 和 `right` ，其中 `left <= right` 。请你反转从位置 `left` 到位置 `right` 的链表节点，返回 **反转后的链表** 。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/rev2ex2.jpg)

```
输入：head = [1,2,3,4,5], left = 2, right = 4
输出：[1,4,3,2,5]
```



## 解题思路

1. 迭代，主要在于找到被反转的链表，然后切割，与无关字符串断开

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：38.9 MB, 在所有 Java 提交中击败了84.13%的用户
>
> 通过测试用例：44 / 44

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
    public ListNode reverseBetween(ListNode head, int left, int right) {
        ListNode zeroNode=new ListNode();
        ListNode res=zeroNode;
        zeroNode.next=head;
        for(int i=0;i<left-1;i++){
            zeroNode=zeroNode.next;
        }
        ListNode prev=zeroNode;
        for(int i=0;i<right-left+1;i++){
            zeroNode=zeroNode.next;
        }
        ListNode rightNode=zeroNode;
        ListNode leftNode=prev.next;
        prev.next=null;
        ListNode afNode=rightNode.next;
        rightNode.next=null;
        prev.next= reverseList(leftNode);
        for(int i=0;i<right-left+1;i++){
            prev=prev.next;
        }
        prev.next=afNode;
        return res.next;

    }
    public ListNode reverseList(ListNode head) {
        ListNode prev=null;
        ListNode curr=head;
        while(curr!=null){
            ListNode tmp=curr.next;
            curr.next=prev;
            prev=curr;
            curr=tmp;
        }
        return prev;
    }
}
```

