---
title: leetcode 145
tags: 刷题
category: leetcode
abbrlink: 15914
date: 2023-03-22 09:20:51
---

## 题目描述

#### [145. 二叉树的后序遍历](https://leetcode.cn/problems/binary-tree-postorder-traversal/)

难度简单1009收藏分享切换为英文接收动态反馈

给你一棵二叉树的根节点 `root` ，返回其节点值的 **后序遍历** 。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/pre1.jpg)



## 解题思路

1. 递归

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：39.8 MB, 在所有 Java 提交中击败了38.80%的用户
>
> 通过测试用例：68 / 68

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
    ArrayList<Integer> list;
    public List<Integer> postorderTraversal(TreeNode root) {
        list=new ArrayList();
        getNode(root);
        return list;


    }
    public void getNode(TreeNode root){
        if(root==null)return ;
        getNode(root.left);
        getNode(root.right);
        list.add(root.val);

    }
}
```

