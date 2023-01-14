---
title: leetcode 2
tags: 刷题
category: leetcode
abbrlink: 25580
date: 2023-01-14 20:56:23
---

## 题目描述

#### [2. 两数相加](https://leetcode.cn/problems/add-two-numbers/)



给你两个 **非空** 的链表，表示两个非负的整数。它们每位数字都是按照 **逆序** 的方式存储的，并且每个节点只能存储 **一位** 数字。

请你将两个数相加，并以相同形式返回一个表示和的链表。

你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/addtwonumber1.jpg)

```
输入：l1 = [2,4,3], l2 = [5,6,4]
输出：[7,0,8]
解释：342 + 465 = 807.
```

## 解题思路



1. 模拟：由于都是逆序存储，因此可以直接相加，大于10的情况进位，直到一个链表为null，那么只计算剩余链表和进位情况。都为空则停止。此外，如果最后的进位仍为1，那么结果尾部需要新加一个节点1。

> 执行用时：1 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41.8 MB, 在所有 Java 提交中击败了23.99%的用户
>
> 通过测试用例：1568 / 1568
>
> 时间 O(n)
>
> 空间 O(n)

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
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        // 统计链表长度，加和进位，返回结果
        ListNode res=new ListNode();
        ListNode tmp=res;
        // next 表示进位
        int next=0,sum=0;
        while(l1!=null||l2!=null){
            if(l1==null){
                sum = l2.val+next;
                l2=l2.next;
            }
            else if(l2==null){
                sum = l1.val+next;
                l1=l1.next;
            }
            else{
                sum=l1.val+l2.val+next;
                l1=l1.next;
                l2=l2.next;
            }
            next=sum>9?1:0;
            int num=sum>9?sum-10:sum;
            tmp.next=new ListNode(num);
            tmp=tmp.next;
        }
        // 进位不为0，则表示需要进位，末尾添加1
        if(next!=0){
            tmp.next=new ListNode(1);
        }
        return res.next;
    }
}
```

