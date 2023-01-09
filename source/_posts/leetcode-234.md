---
title: leetcode 234
tags: 刷题
category: leetcode
abbrlink: 52761
date: 2023-01-09 10:44:53
---

## 题目描述

#### [234. 回文链表](https://leetcode.cn/problems/palindrome-linked-list/)



给你一个单链表的头节点 `head` ，请你判断该链表是否为回文链表。如果是，返回 `true` ；否则，返回 `false` 。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/pal1linked-list.jpg)

```
输入：head = [1,2,2,1]
输出：true
```

## 解题思路

1. 使用栈遍历

> 执行用时：36 ms, 在所有 Java 提交中击败了5.73%的用户
>
> 内存消耗：58.2 MB, 在所有 Java 提交中击败了21.65%的用户
>
> 通过测试用例：88 / 88
>
> 时间 O(2n)
>
> 空间 O(n) 使用了栈存储数据

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
    public boolean isPalindrome(ListNode head) {
        // 使用stack存储val，第一次遍历入栈，二次遍历出栈对比
        Stack<Integer> s=new Stack();
        ListNode tmp=head,tmp2=head;
        while(tmp!=null){
            s.push(tmp.val);
            tmp=tmp.next;
        }
        while(tmp2!=null){
            if(tmp2.val!=s.pop()){
                return false;
            }
            tmp2=tmp2.next;
        }
        return true;
    }
}
```

2. 要想使得空间为O(1)，就需要改变输入，主要步骤为
   1. 找到前半部分链表的尾结点
   2. 翻转后半部分链表
   3. 双指针同时向后移动，比较，判断是否为回文
   4. // 恢复链表
   5. 返回结果

> 执行用时：8 ms, 在所有 Java 提交中击败了39.41%的用户
>
> 内存消耗：51.4 MB, 在所有 Java 提交中击败了96.77%的用户
>
> 通过测试用例：88 / 88
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
    public boolean isPalindrome(ListNode head) {
        int num=0;
        ListNode tmp=head;
        while(tmp!=null){
            num++;
            tmp=tmp.next;
        }
        tmp = head;
        // 前半部分取较短的部分
        for(int i=0;i<num/2;i++){
            tmp=tmp.next;
        }
        // 这里有个问题，翻转后的链表，对原来的链表有影响，对于例子[1,2,3,2,1]左半部分的应该为[1,2]，右半部分为[3,2,1],翻转后为[1,2,1,2,3]
        ListNode right=reverseList(tmp);
        while (right!=null){
            if(head.val!=right.val){
                return false;
            }
            head=head.next;
            right=right.next;
        }
        return true;
    }
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

