---
title: leetcode 21
tags: 刷题
category: leetcode
abbrlink: 22947
date: 2023-01-15 18:53:35
---

## 题目描述

#### [21. 合并两个有序链表](https://leetcode.cn/problems/merge-two-sorted-lists/)



将两个升序链表合并为一个新的 **升序** 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/merge_ex1.jpg)

```
输入：l1 = [1,2,4], l2 = [1,3,4]
输出：[1,1,2,3,4,4]
```

## 解题思路

1. 模拟，模拟同时访问两个链表的头，将较小的元素加入结果中

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41 MB, 在所有 Java 提交中击败了51.93%的用户
>
> 通过测试用例：208 / 208
>
> 时间 O(n) 为两个链表长度
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
    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        ListNode res=new ListNode();
        ListNode tmp=res;
        while(list1!=null&&list2!=null){
            if(list1.val>list2.val){
                res.next=list2;
                list2=list2.next;
            }
            else{
                res.next=list1;
                list1=list1.next;
            }
            res=res.next;
        }
        if(list1!=null){
            res.next=list1;
        }
        else if(list2!=null){
            res.next=list2;
        }
        return tmp.next;
    }
}
```

