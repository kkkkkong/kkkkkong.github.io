---
title: leetcode 111
tags: 刷题
category: leetcode
abbrlink: 44328
date: 2023-03-07 10:44:50
---

## 题目描述

#### [111. 二叉树的最小深度](https://leetcode.cn/problems/minimum-depth-of-binary-tree/)



给定一个二叉树，找出其最小深度。

最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

**说明：**叶子节点是指没有子节点的节点。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/ex_depth.jpg)

```
输入：root = [3,9,20,null,null,15,7]
输出：2
```



## 解题思路

1. BFS

> 执行用时：1 ms, 在所有 Java 提交中击败了93.80%的用户
>
> 内存消耗：60.4 MB, 在所有 Java 提交中击败了86.65%的用户
>
> 通过测试用例：52 / 52
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
    public int minDepth(TreeNode root) {
        if(root==null)return 0;
        Queue<TreeNode> queue=new LinkedList();
        queue.offer(root);
        int deepth=1;
        while(!queue.isEmpty()){
            int len=queue.size();
            for(int i=0;i<len;i++){
                TreeNode node=queue.poll();
                if(node.left==null&&node.right==null){
                    return deepth;
                }
                if(node.left!=null){
                    queue.offer(node.left);
                }
                if(node.right!=null){
                    queue.offer(node.right);
                }

            }
            deepth++;
        }
        return deepth;
    }

}
```

