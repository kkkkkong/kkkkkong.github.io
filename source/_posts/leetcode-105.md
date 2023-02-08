---
title: leetcode 105
tags: 刷题
category: leetcode
abbrlink: 65064
date: 2023-02-08 19:06:03
---

## 题目描述

#### [105. 从前序与中序遍历序列构造二叉树](https://leetcode.cn/problems/construct-binary-tree-from-preorder-and-inorder-traversal/)



给定两个整数数组 `preorder` 和 `inorder` ，其中 `preorder` 是二叉树的**先序遍历**， `inorder` 是同一棵树的**中序遍历**，请构造二叉树并返回其根节点。

 

**示例 1:**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/tree.jpg)

```
输入: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
输出: [3,9,20,null,null,15,7]
```



## 解题思路

1. 递归，根据前序和中序的特性，前序数组的第一个元素一定为根节点，那么在中序数组中找到该节点，在中序数组中，该节点左侧的都是left上的节点，对应数量在前序数组的root节点之后，以此将其分开

> 执行用时：9 ms, 在所有 Java 提交中击败了8.56%的用户
>
> 内存消耗：86.4 MB, 在所有 Java 提交中击败了5.00%的用户
>
> 通过测试用例：203 / 203
>
> 时间 O(N)
>
> 空间 O(N)

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
    public TreeNode buildTree(int[] preorder, int[] inorder) {
        if(preorder.length==0)return null;
        TreeNode root=new TreeNode(preorder[0]);
        int tmp=preorder[0];
        int i=0;
        while(inorder[i]!=tmp){
            i++;
        }
        root.left=buildTree(Arrays.copyOfRange(preorder,1,i+1),Arrays.copyOfRange(inorder,0,i));
        root.right=buildTree(Arrays.copyOfRange(preorder,i+1,preorder.length),Arrays.copyOfRange(inorder,i+1,inorder.length));
        return root;
    }
}
```

2. 递归但不使用 Arrays.copyOfRange，

> 执行用时：3 ms, 在所有 Java 提交中击败了42.85%的用户
>
> 内存消耗：40.9 MB, 在所有 Java 提交中击败了97.12%的用户
>
> 通过测试用例：203 / 203
>
> 时间 O(N)
>
> 空间 O(N)

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
    public TreeNode buildTree(int[] preorder, int[] inorder) {
        return myBuildTree(preorder,0,preorder.length-1,inorder,0,inorder.length-1);
    }
    public TreeNode myBuildTree(int[] preorder,int preI,int preJ, int[] inorder,int inI,int inJ){
        if(preJ<preI)return null;
        TreeNode root=new TreeNode(preorder[preI]);
        int i=inI;
        while(inorder[i]!=preorder[preI]){
            i++;
        }
        root.left=myBuildTree(preorder,preI+1,preI+i-inI,inorder,inI,i-1);
        root.right=myBuildTree(preorder,preI+1+i-inI,preJ,inorder,i+1,inJ );
        return root;
    }
}
```

