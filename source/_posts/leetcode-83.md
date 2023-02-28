---
title: leetcode 83
tags: 刷题
category: leetcode
abbrlink: 14372
date: 2023-02-28 15:01:20
---

## 题目描述

#### [83. 删除排序链表中的重复元素](https://leetcode.cn/problems/remove-duplicates-from-sorted-list/)



给定一个已排序的链表的头 `head` ， *删除所有重复的元素，使每个元素只出现一次* 。返回 *已排序的链表* 。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/list1.jpg)

```
输入：head = [1,1,2]
输出：[1,2]
```

## 解题思路

1. 双指针

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：40.9 MB, 在所有 Java 提交中击败了69.93%的用户
>
> 通过测试用例：166 / 166
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
    public ListNode deleteDuplicates(ListNode head) {
        if(head==null||head.next==null)return head;
        ListNode low=head,fast=head.next;
        while(fast!=null){
            if(fast.val==low.val){
                low.next=fast.next;
                fast=low.next;
            }
            else{
                fast=fast.next;
                low=low.next;
            }
        }
        return head;
    }
}
```

