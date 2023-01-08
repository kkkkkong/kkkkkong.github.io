---
title: leetcode 226
tags: 刷题
category: leetcode
abbrlink: 40857
date: 2023-01-08 17:01:50
---

## 题目描述

#### [226. 翻转二叉树](https://leetcode.cn/problems/invert-binary-tree/)



给你一棵二叉树的根节点 `root` ，翻转这棵二叉树，并返回其根节点。



## 解题思路

1. 深度优先(递归)

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：39.4 MB, 在所有 Java 提交中击败了8.65%的用户
>
> 通过测试用例：77 / 77
>
> 时间 O(n)
>
> 空间 O(h)，h是树的高度

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
    public TreeNode invertTree(TreeNode root) {
        if(root==null)return null;
        TreeNode tmp=root.right;
        root.right=invertTree(root.left);
        root.left=invertTree(tmp);
        return root;
    }
}
```

2. 广度优先（迭代），懒得写