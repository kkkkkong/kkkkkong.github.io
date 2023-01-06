---
title: leetcode 617
tags: 刷题
category: leetcode
abbrlink: 28185
date: 2023-01-06 20:38:05
---

## 题目描述

#### [617. 合并二叉树](https://leetcode.cn/problems/merge-two-binary-trees/)

给你两棵二叉树： `root1` 和 `root2` 。

想象一下，当你将其中一棵覆盖到另一棵之上时，两棵树上的一些节点将会重叠（而另一些不会）。你需要将这两棵树合并成一棵新二叉树。合并的规则是：如果两个节点重叠，那么将这两个节点的值相加作为合并后节点的新值；否则，**不为** null 的节点将直接作为新二叉树的节点。

返回合并后的二叉树。

**注意:** 合并过程必须从两个树的根节点开始。



## 解题思路

1. 深度优先搜索，从根节点开始，依次合并两个树的节点，将合并后的节点存在root1中，合并时有几种情况：
   1. 两个节点都为null，那么返回null
   2. 两个节点有一个为null，返回非空节点
   3. 两个节点都不为空，合并两个节点，并将左右孩子节点递归调用合并

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41.4 MB, 在所有 Java 提交中击败了73.39%的用户
>
> 通过测试用例：182 / 182

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
    public TreeNode mergeTrees(TreeNode root1, TreeNode root2) {
        if(root1!=null&&root2!=null){
            root1.val+=root2.val;
            root1.left=mergeTrees(root1.left,root2.left);
            root1.right=mergeTrees(root1.right,root2.right);
            return root1;
        }
        else if(root1!=null||root2!=null){
            return root1==null?root2:root1;
        }
        else{
            return null;
        }
    }
}
```

官方题解更优雅

```java
class Solution {
    public TreeNode mergeTrees(TreeNode t1, TreeNode t2) {
        if (t1 == null) {
            return t2;
        }
        if (t2 == null) {
            return t1;
        }
        TreeNode merged = new TreeNode(t1.val + t2.val);
        merged.left = mergeTrees(t1.left, t2.left);
        merged.right = mergeTrees(t1.right, t2.right);
        return merged;
    }
}
```

