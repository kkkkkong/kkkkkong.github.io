---
title: leetcode 114
tags: 刷题
category: leetcode
abbrlink: 44776
date: 2023-02-05 21:19:25
---

## 题目描述

#### [114. 二叉树展开为链表](https://leetcode.cn/problems/flatten-binary-tree-to-linked-list/)



给你二叉树的根结点 `root` ，请你将它展开为一个单链表：

- 展开后的单链表应该同样使用 `TreeNode` ，其中 `right` 子指针指向链表中下一个结点，而左子指针始终为 `null` 。
- 展开后的单链表应该与二叉树 [**先序遍历**](https://baike.baidu.com/item/先序遍历/6442839?fr=aladdin) 顺序相同。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/flaten.jpg)

```
输入：root = [1,2,5,3,4,null,6]
输出：[1,null,2,null,3,null,4,null,5,null,6]
```



## 解题思路

1. 递归

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：40.6 MB, 在所有 Java 提交中击败了99.52%的用户
>
> 通过测试用例：225 / 225
>
> 时间 O(N)
>
> 空间 O(N) 树的深度

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
    public void flatten(TreeNode root) {
        root=getDeep(root);
    }
    public TreeNode getDeep(TreeNode root){
        if(root==null)return null;        
        TreeNode res=root,tmp=root.right;
        // 将树的左子树展开后赋给右子树
        root.right=getDeep(root.left);
        // 左子树置空
        root.left=null;
        // 将右子树遍历到叶子节点
        while(root.right!=null){
            root=root.right;
        }
        // 将原来的右子树展开
        root.right=getDeep(tmp);
        return res;
    }
}
```

