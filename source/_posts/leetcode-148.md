---
title: leetcode 148
tags: 刷题
category: leetcode
abbrlink: 64491
date: 2023-02-09 14:54:04
---

## 题目描述

#### [148. 排序链表](https://leetcode.cn/problems/sort-list/)



给你链表的头结点 `head` ，请将其按 **升序** 排列并返回 **排序后的链表** 。



 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/sort_list_1.jpg)

```
输入：head = [4,2,1,3]
输出：[1,2,3,4]
```



## 解题思路

1. 排序+链表：将链表存储在ArrayList中，使用库函数sort，然后在写入链表中，返回。自己没有写sort

> 执行用时：18 ms, 在所有 Java 提交中击败了14.19%的用户
>
> 内存消耗：52.4 MB, 在所有 Java 提交中击败了7.16%的用户
>
> 通过测试用例：30 / 30
>
> 时间 O(NLogN)
>
> 空间O(N)

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
    public ListNode sortList(ListNode head) {
        ListNode ans=new ListNode();
        ListNode res=ans;
        ListNode tmp=head;
        List<Integer> list=new ArrayList();
        while(head!=null){
            list.add(head.val);
            head=head.next;
        }
        list.sort(Comparator.naturalOrder());
        for(int i=0;i<list.size();i++){
            ans.next=new ListNode(list.get(i));
            ans=ans.next;
        }
        return res.next;

    }
}
```

2. 递归+归并排序：首先将链表找到链表的中间节点一分为二进行排序，将排序后的两个链表合并，参考《两个有序链表的合并》，此方法由于使用了递归，所以空间复杂度为O(logN)，尚未达到常数级

> 执行用时：11 ms, 在所有 Java 提交中击败了55.92%的用户
>
> 内存消耗：49.8 MB, 在所有 Java 提交中击败了48.05%的用户
>
> 通过测试用例：30 / 30
>
> 时间 O(NLogN)
>
> 空间 O(logN)

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
    public ListNode sortList(ListNode head) {
        return sortList(head,null);

    }
    public ListNode sortList(ListNode head,ListNode tail){
        if(head==null)return null;
        if(head.next==tail){
            head.next=null;
            return head;
        }
        ListNode low=head,fast=head;
        ListNode tmp=head;
        while(fast!=tail){
            low=low.next;
            fast=fast.next;
            if(fast!=tail){
                fast=fast.next;
            }
        }
        ListNode mid=low;
        ListNode left=sortList(tmp,mid);
        ListNode right=sortList(mid,tail);
        return merge(left,right);
    }
    public ListNode merge(ListNode node1,ListNode node2){
        ListNode ans=new ListNode();
        ListNode tmp=ans;
        while(node1!=null&&node2!=null){
            if(node1.val<=node2.val){
                ans.next=node1;
                node1=node1.next;
            }
            else{
                ans.next=node2;
                node2=node2.next;
            }
            ans=ans.next;
        }
        if(node1!=null){
            ans.next=node1;
        }
        else{
            ans.next=node2;
        }
        return tmp.next;
    }
}
```

3. 遍历，重度参考了官方题解

> 执行用时：15 ms, 在所有 Java 提交中击败了30.16%的用户
>
> 内存消耗：49.4 MB, 在所有 Java 提交中击败了64.19%的用户
>
> 通过测试用例：30 / 30
>
> 时间 O(NLogN)
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
    public ListNode sortList(ListNode head) {
        // 归并排序
        // 首先获取链表长度
        int length=0;
        ListNode tmp=head;
        while(tmp!=null){
            tmp=tmp.next;
            length++;
        }
        ListNode ans=new ListNode(0,head);
        // 将链表分成slenth长的段，初始为1，合并
        for(int slen=1;slen<length;slen<<=1){
            ListNode curr=ans.next,prev=ans;
            while(curr!=null){
                // 需要排序的第一个元素
                ListNode head1=curr;
                for(int i=1;i<slen&&curr.next!=null;i++){
                    curr=curr.next;
                }
                // 需要排序的第二个元素
                ListNode head2=curr.next;
                curr.next=null;
                curr=head2;
                for(int i=1;i<slen&&curr!=null&&curr.next!=null;i++){
                    curr=curr.next;
                }
                // 保存后续未排序元素的头节点，并将排序的部分切分
                // 这句话会导致超时
                // ListNode next=new ListNode();
                ListNode next=null;
                if(curr!=null){
                    next=curr.next;
                    curr.next=null;
                }

                ListNode merged=merge(head1,head2);
                prev.next=merged;
                while(prev.next!=null){
                    prev=prev.next;
                }
                curr=next;
            }
        }
        return ans.next;

    }
    public ListNode merge(ListNode node1,ListNode node2){
        ListNode ans=new ListNode();
        ListNode tmp=ans;
        while(node1!=null&&node2!=null){
            if(node1.val<=node2.val){
                ans.next=node1;
                node1=node1.next;
            }
            else{
                ans.next=node2;
                node2=node2.next;
            }
            ans=ans.next;
        }
        if(node1!=null){
            ans.next=node1;
        }
        else{
            ans.next=node2;
        }
        return tmp.next;
    }
}
```

