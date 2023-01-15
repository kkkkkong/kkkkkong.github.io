---
title: leetcode 104
tags: 刷题
category: leetcode
abbrlink: 16105
date: 2023-01-15 22:56:59
---

## 题目描述

#### [104. 二叉树的最大深度](https://leetcode.cn/problems/maximum-depth-of-binary-tree/)



给定一个二叉树，找出其最大深度。

二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

**说明:** 叶子节点是指没有子节点的节点。

**示例：**
给定二叉树 `[3,9,20,null,null,15,7]`，

```
    3
   / \
  9  20
    /  \
   15   7
```

返回它的最大深度 3 。



## 解题思路

1. 递归，深度优先搜索

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41.1 MB, 在所有 Java 提交中击败了69.57%的用户
>
> 通过测试用例：39 / 39
>
> 时间 O(n)
>
> 空间 O(n)

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
    public int maxDepth(TreeNode root) {
        if(root==null)return 0;
        int left_len=maxDepth(root.left);
        int right_len=maxDepth(root.right);
        return Math.max(left_len,right_len)+1;
    }
}
```