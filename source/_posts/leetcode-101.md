---
title: leetcode 101
tags: 刷题
category: leetcode
abbrlink: 15657
date: 2023-01-15 20:04:58
---

## 题目描述

#### [101. 对称二叉树](https://leetcode.cn/problems/symmetric-tree/)



给你一个二叉树的根节点 `root` ， 检查它是否轴对称。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/symtree1.jpg)

```
输入：root = [1,2,2,3,4,4,3]
输出：true
```

## 解题思路

1. 递归

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：39.4 MB, 在所有 Java 提交中击败了92.19%的用户
>
> 通过测试用例：199 / 199
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
    public boolean isSymmetric(TreeNode root) {
        return isTrue(root.left,root.right);

    }
    public boolean isTrue(TreeNode left,TreeNode right){
        // 两个节点都为null，显然为true
        if(left==null&&right==null)return true;
        // 两个节点都不为null，那么需要继续比较其子节点
        else if(left!=null&&right!=null){
            if(left.val!=right.val)return false;
            return isTrue(left.left,right.right)&&isTrue(left.right,right.left);
        }
        // 两个节点一个为null，另一个不为null，那么一定是false
        else{
            return false;
        }
    }
}
```

