---
title: leetcode 538
tags: 刷题
category: leetcode
abbrlink: 2728
date: 2023-02-05 22:07:34
---

## 题目描述

#### [538. 把二叉搜索树转换为累加树](https://leetcode.cn/problems/convert-bst-to-greater-tree/)



给出二叉 **搜索** 树的根节点，该树的节点值各不相同，请你将其转换为累加树（Greater Sum Tree），使每个节点 `node` 的新值等于原树中大于或等于 `node.val` 的值之和。

提醒一下，二叉搜索树满足下列约束条件：

- 节点的左子树仅包含键 **小于** 节点键的节点。
- 节点的右子树仅包含键 **大于** 节点键的节点。
- 左右子树也必须是二叉搜索树。

**注意：**本题和 1038: https://leetcode-cn.com/problems/binary-search-tree-to-greater-sum-tree/ 相同

 

**示例 1：**

**![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/tree.png)**

```
输入：[4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
输出：[30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]
```



## 解题思路

> 这个题代码写起来简单，但是想了半天才想明白这个反向的中序遍历该怎么用，以及num的累计值的使用方式

1. 中序遍历，递归，不难发现，题目要求结果的二叉树，如果按照中序遍历，返回的结果中，节点的val是严格递减的，因此采用中序遍历的方法，依次将val累加到节点中

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41.8 MB, 在所有 Java 提交中击败了28.56%的用户
>
> 通过测试用例：215 / 215
>
> 时间 O(N)，二叉树节点数
>
> 空间 O(N)，二叉搜索树的深度

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
    int num=0;
    public TreeNode convertBST(TreeNode root) {
        if(root==null)return null;
        root.right=convertBST(root.right);
        root.val+= num;
        num=root.val;
        root.left=convertBST(root.left);
        return root;
    }
}
```

