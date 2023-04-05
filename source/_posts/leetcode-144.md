---
title: leetcode 144
tags: 刷题
category: leetcode
abbrlink: 65259
date: 2023-03-22 09:23:30
---

## 题目描述

#### [144. 二叉树的前序遍历](https://leetcode.cn/problems/binary-tree-preorder-traversal/)

难度简单1028收藏分享切换为英文接收动态反馈

给你二叉树的根节点 `root` ，返回它节点值的 **前序** 遍历。

 

**示例 1：**

![img](https://assets.leetcode.com/uploads/2020/09/15/inorder_1.jpg)

## 解题思路

1. 递归

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：39.8 MB, 在所有 Java 提交中击败了35.01%的用户
>
> 通过测试用例：70 / 70

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    List<Integer> list;
    public List<Integer> preorderTraversal(TreeNode root) {
        list=new ArrayList();
        getNode(root);
        return list;
    }
    public void getNode(TreeNode root){
        if(root==null)return ;
        list.add(root.val);
        getNode(root.left);
        getNode(root.right);

    }
}
```

