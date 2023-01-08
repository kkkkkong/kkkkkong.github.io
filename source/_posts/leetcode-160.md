---
title: leetcode 160
tags: 刷题
category: leetcode
abbrlink: 24043
date: 2023-01-08 18:54:04
---

## 题目描述

#### [160. 相交链表](https://leetcode.cn/problems/intersection-of-two-linked-lists/)

难度简单1931收藏分享切换为英文接收动态反馈

给你两个单链表的头节点 `headA` 和 `headB` ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 `null` 。

图示两个链表在节点 `c1` 开始相交**：**

[![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/160_statement.png)](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/12/14/160_statement.png)

题目数据 **保证** 整个链式结构中不存在环。

**注意**，函数返回结果后，链表必须 **保持其原始结构** 。

**自定义评测：**

**评测系统** 的输入如下（你设计的程序 **不适用** 此输入）：

- `intersectVal` - 相交的起始节点的值。如果不存在相交节点，这一值为 `0`
- `listA` - 第一个链表
- `listB` - 第二个链表
- `skipA` - 在 `listA` 中（从头节点开始）跳到交叉节点的节点数
- `skipB` - 在 `listB` 中（从头节点开始）跳到交叉节点的节点数

评测系统将根据这些输入创建链式数据结构，并将两个头节点 `headA` 和 `headB` 传递给你的程序。如果程序能够正确返回相交节点，那么你的解决方案将被 **视作正确答案** 。

## 解题思路

1. 迭代，先遍历获取m n，较长的向后移动abs(m-n)，然后同时向后移动，记录最后一个不相等元素的next node

> 执行用时：1 ms, 在所有 Java 提交中击败了97.99%的用户
>
> 内存消耗：44.2 MB, 在所有 Java 提交中击败了70.32%的用户
>
> 通过测试用例：39 / 39
>
> 时间 O(2m+2n)
>
> 空间 O(1)

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        // 先遍历获取m n，较长的向后移动abs(m-n)，然后同时向后移动
        ListNode tmpA=headA,tmpB=headB;
        int lenA=0,lenB=0;
        while(tmpA!=null){
            lenA++;
            tmpA=tmpA.next;
        }
        while(tmpB!=null){
            lenB++;
            tmpB=tmpB.next;
        }
        tmpA=headA;
        tmpB=headB;
        if(lenA>lenB){
            for(int i=0;i<lenA-lenB;i++){
                tmpA=tmpA.next;
            }
        }
        else{
            for(int i=0;i<lenB-lenA;i++){
                tmpB=tmpB.next;
            }
        }
        ListNode res=tmpA;
        while(tmpA!=null){
            if(tmpA!=tmpB){
                if(tmpA.next!=null){
                    res=tmpA.next;
                }
                else{
                    return null;
                }
            }
            tmpA=tmpA.next;
            tmpB=tmpB.next;
        }
        return res;
    }
}
```

2. 大神题解

```java
public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
    if (headA == null || headB == null) return null;
    ListNode pA = headA, pB = headB;
    while (pA != pB) {
        pA = pA == null ? headB : pA.next;
        pB = pB == null ? headA : pB.next;
    }
    return pA;
}
```

