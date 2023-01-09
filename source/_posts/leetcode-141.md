---
title: leetcode 141
tags: 刷题
category: leetcode
abbrlink: 64811
date: 2023-01-09 09:25:27
---

## 题目描述

#### [141. 环形链表](https://leetcode.cn/problems/linked-list-cycle/)



给你一个链表的头节点 `head` ，判断链表中是否有环。

如果链表中有某个节点，可以通过连续跟踪 `next` 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 `pos` 来表示链表尾连接到链表中的位置（索引从 0 开始）。**注意：`pos` 不作为参数进行传递** 。仅仅是为了标识链表的实际情况。

*如果链表中存在环* ，则返回 `true` 。 否则，返回 `false` 。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/circularlinkedlist.png)

```
输入：head = [3,2,0,-4], pos = 1
输出：true
解释：链表中有一个环，其尾部连接到第二个节点。
```

## 解题思路

1. 快慢指针，使用两个指针遍历链表，快指针每次都向前，慢指针逢二向前。如果链表无环，那么快指针总是跑到null；如果链表有环，那么两个指针会相遇

> 执行用时：1 ms, 在所有 Java 提交中击败了23.59%的用户
>
> 内存消耗：43 MB, 在所有 Java 提交中击败了9.25%的用户
>
> 通过测试用例：23 / 23
>
> 时间 O(n)
>
> 空间 O(1)

```java
/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public boolean hasCycle(ListNode head) {
        if(head==null||head.next==null)return false;
        ListNode low=head,fast=head.next;
        int num=0;
        while(fast!=null){
            if(fast==low)return true;
            fast=fast.next;
            if(num++%2==0){
                low=low.next;
            }
        }
        return false;
        
    }
}
```

2. 快慢指针，但是快指针每次向前2，慢指针每次向前1

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：42.5 MB, 在所有 Java 提交中击败了63.94%的用户
>
> 通过测试用例：23 / 23
>
> 时间 O(n)
>
> 空间 O(1)

```java
/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public boolean hasCycle(ListNode head) {
        if(head==null||head.next==null)return false;
        ListNode low=head,fast=head.next;
        while(fast!=null){
            if(fast==low)return true;
            if(fast.next==null)return false;
            fast=fast.next.next;
            low=low.next;
        }
        return false;
    }
}
```

3. （官方题解）哈希表，使用哈希表存储访问过的节点，每次判断是否访问过

```java
public class Solution {
    public boolean hasCycle(ListNode head) {
        Set<ListNode> seen = new HashSet<ListNode>();
        while (head != null) {
            if (!seen.add(head)) {
                return true;
            }
            head = head.next;
        }
        return false;
    }
}
```

