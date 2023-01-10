---
title: leetcode 543
tags: 刷题
category: leetcode
abbrlink: 65003
date: 2023-01-10 08:37:00
---

## 题目描述

#### [543. 二叉树的直径](https://leetcode.cn/problems/diameter-of-binary-tree/)



给定一棵二叉树，你需要计算它的直径长度。一棵二叉树的直径长度是任意两个结点路径长度中的最大值。这条路径可能穿过也可能不穿过根结点。

 

**示例 :**
给定二叉树

```
          1
         / \
        2   3
       / \     
      4   5    
```

返回 **3**, 它的长度是路径 [4,2,1,3] 或者 [5,2,1,3]。

 

**注意：**两结点之间的路径长度是以它们之间边的数目表示。

## 解题思路

1. 深度优先搜索，使用一个全局变量统计最大半径，递归时获取分别获取左右子树的高度，同时更新最大半径。递归返回的条件是root为null，需要理解清楚叶子结点作为长度为1的存在

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41 MB, 在所有 Java 提交中击败了70.54%的用户
>
> 通过测试用例：104 / 104
>
> 时间 O(n)
>
> 空间 O(1)

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
    int res=0;
    public int diameterOfBinaryTree(TreeNode root) {
        getMaxDeep(root);
        return res;
    }
    public int getMaxDeep(TreeNode root){
        if(root==null)return 0;
        int len_l=getMaxDeep(root.left);
        int len_r=getMaxDeep(root.right);
        res=Math.max(res,len_l+len_r);
        return Math.max(len_l,len_r)+1;
    }
}
```

