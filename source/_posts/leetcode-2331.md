---
title: leetcode 2331
tags: 刷题
category: leetcode
abbrlink: 11980
date: 2023-02-06 09:07:26
---

## 题目描述

#### [2331. 计算布尔二叉树的值](https://leetcode.cn/problems/evaluate-boolean-binary-tree/)



给你一棵 **完整二叉树** 的根，这棵树有以下特征：

- **叶子节点** 要么值为 `0` 要么值为 `1` ，其中 `0` 表示 `False` ，`1` 表示 `True` 。
- **非叶子节点** 要么值为 `2` 要么值为 `3` ，其中 `2` 表示逻辑或 `OR` ，`3` 表示逻辑与 `AND` 。

**计算** 一个节点的值方式如下：

- 如果节点是个叶子节点，那么节点的 **值** 为它本身，即 `True` 或者 `False` 。
- 否则，**计算** 两个孩子的节点值，然后将该节点的运算符对两个孩子值进行 **运算** 。

返回根节点 `root` 的布尔运算值。

**完整二叉树** 是每个节点有 `0` 个或者 `2` 个孩子的二叉树。

**叶子节点** 是没有孩子的节点。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/example1drawio1.png)

```
输入：root = [2,1,3,null,null,0,1]
输出：true
解释：上图展示了计算过程。
AND 与运算节点的值为 False AND True = False 。
OR 运算节点的值为 True OR False = True 。
根节点的值为 True ，所以我们返回 true 。
```



## 解题思路

1. 递归，简单题我重拳出击

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：41.4 MB, 在所有 Java 提交中击败了70.42%的用户
>
> 通过测试用例：75 / 75
>
> 时间 O(N)
>
> 空间 O(N)，到不了N，取决于二叉树层数

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
    public boolean evaluateTree(TreeNode root) {
        if(root.val<=1)return root.val==1;
        return root.val==2?evaluateTree(root.left)||evaluateTree(root.right):evaluateTree(root.left)&&evaluateTree(root.right);
    }
}
```

