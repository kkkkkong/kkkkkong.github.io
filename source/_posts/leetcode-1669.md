---
title: leetcode  1669
tags: 刷题
category: leetcode
abbrlink: 52549
date: 2023-01-30 22:02:15
---

## 题目描述

#### [1669. 合并两个链表](https://leetcode.cn/problems/merge-in-between-linked-lists/)



给你两个链表 `list1` 和 `list2` ，它们包含的元素分别为 `n` 个和 `m` 个。

请你将 `list1` 中下标从 `a` 到 `b` 的全部节点都删除，并将`list2` 接在被删除节点的位置。

下图中蓝色边和节点展示了操作后的结果：

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/fig1.png)

请你返回结果链表的头指针。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/merge_linked_list_ex1.png)

```
输入：list1 = [0,1,2,3,4,5], a = 3, b = 4, list2 = [1000000,1000001,1000002]
输出：[0,1,2,1000000,1000001,1000002,5]
解释：我们删除 list1 中下标为 3 和 4 的两个节点，并将 list2 接在该位置。上图中蓝色的边和节点为答案链表。
```

## 解题思路

1. 模拟，按流程办事

> 执行用时：1 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：45.1 MB, 在所有 Java 提交中击败了15.14%的用户
>
> 通过测试用例：61 / 61
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
    public ListNode mergeInBetween(ListNode list1, int a, int b, ListNode list2) {
        ListNode res=list1;
        // 找到a节点
        for(int i=0;i<a-1;i++){
            list1=list1.next;
        }
        // 将a以后的暂存在tmp
        ListNode tmp=list1.next;
        // 将list2的拼接上
        list1.next=list2;
        // 访问到list2的末尾
        while(list1!=null&&list1.next!=null){
            list1=list1.next;
        }
        // 移除a到b的中间元素
        for(int i=0;i<b-a;i++){
            tmp=tmp.next;
        }
        list1.next=tmp.next;
        return res;

    }
}
```

