---
title: leetcode 94
tags: 刷题
category: leetcode
abbrlink: 27236
date: 2023-01-09 09:01:51
---

## 题目描述

#### [94. 二叉树的中序遍历](https://leetcode.cn/problems/binary-tree-inorder-traversal/)



给定一个二叉树的根节点 `root` ，返回 *它的 **中序** 遍历* 。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/inorder_1.jpg)

```
输入：root = [1,null,2,3]
输出：[1,3,2]
```

## 解题思路

1. 中序遍历，递归

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：39.7 MB, 在所有 Java 提交中击败了44.46%的用户
>
> 通过测试用例：70 / 70
>
> 时间 O(n)
>
> 空间 O(h) h是树高

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
    public List<Integer> inorderTraversal(TreeNode root) {
        List<Integer> res=new ArrayList();
        if(root==null)return res;
        List<Integer> left=inorderTraversal(root.left);
        List<Integer> right=inorderTraversal(root.right);
        res.addAll(left);
        res.add(root.val);
        res.addAll(right);
        return res;
    }
}
```

