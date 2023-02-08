---
title: leetcode 102
tags: 刷题
category: leetcode
abbrlink: 15465
date: 2023-02-07 19:48:50
---

## 题目描述

#### [102. 二叉树的层序遍历](https://leetcode.cn/problems/binary-tree-level-order-traversal/)



给你二叉树的根节点 `root` ，返回其节点值的 **层序遍历** 。 （即逐层地，从左到右访问所有节点）。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/tree1.jpg)

```
输入：root = [3,9,20,null,null,15,7]
输出：[[3],[9,20],[15,7]]
```



## 解题思路

1. 使用list按顺序存储节点，由于返回值 List<List<Integer>>，因此需要记录每层的节点数，获取一个节点，上层节点数减一，没添加一个节点，下层节点数加一；获取的节点值加入list，上层节点数为0时，将list加入结果队列并置空。

> 执行用时：1 ms, 在所有 Java 提交中击败了60.14%的用户
>
> 内存消耗：41.8 MB, 在所有 Java 提交中击败了26.37%的用户
>
> 通过测试用例：34 / 34
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
    public List<List<Integer>> levelOrder(TreeNode root) {
        if(root==null)return new ArrayList();
        // 使用list存储子节点，从list头部访问一个节点时，将其子节点将入队尾
        List<List<Integer>> res=new ArrayList();
        List<TreeNode> tmp=new ArrayList();
        // 使用num存储当前层和下一层的节点数
        int numUp=1;
        int numLow=0;
        tmp.add(root);
        List<Integer> value=new ArrayList();
        while(!tmp.isEmpty()){
            TreeNode node=tmp.get(0);
            tmp.remove(0);
            value.add(node.val);
            numUp--;
            if(node.left!=null){
                tmp.add(node.left);
                numLow++;
            }
            if(node.right!=null){
                tmp.add(node.right);
                numLow++;
            }
            if(numUp==0){
                res.add(value);
                value=new ArrayList();
                numUp=numLow;
                numLow=0;
            }
        }
        return res;
    }
}
```

2. 根据官方题解，使用ArrayDeque试了一下，效果差不多

> 执行用时：1 ms, 在所有 Java 提交中击败了60.14%的用户
>
> 内存消耗：41.4 MB, 在所有 Java 提交中击败了83.45%的用户
>
> 通过测试用例：34 / 34
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
    public List<List<Integer>> levelOrder(TreeNode root) {
        if(root==null)return new ArrayList();
        // 使用list存储子节点，从list头部访问一个节点时，将其子节点将入队尾
        List<List<Integer>> res=new ArrayList();
        Queue<TreeNode> queue=new ArrayDeque();

        // 使用num存储当前层和下一层的节点数
        if(root!=null){
            queue.add(root);
        }
        while(!queue.isEmpty()){
            List<Integer> value=new ArrayList();
            int n=queue.size();
            for(int i=0;i<n;i++){
                TreeNode node =queue.poll();
                value.add(node.val);
                if(node.left!=null){
                    queue.add(node.left);
                }
                if(node.right!=null){
                    queue.add(node.right);
                }
            }
            res.add(value);
        }
        return res;
    }
}
```

