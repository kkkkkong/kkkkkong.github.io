---
title: leetcode 48
tags: 刷题
category: leetcode
abbrlink: 65376
date: 2023-02-05 11:15:13
---

## 题目描述

#### [48. 旋转图像](https://leetcode.cn/problems/rotate-image/)



给定一个 *n* × *n* 的二维矩阵 `matrix` 表示一个图像。请你将图像顺时针旋转 90 度。

你必须在**[ 原地](https://baike.baidu.com/item/原地算法)** 旋转图像，这意味着你需要直接修改输入的二维矩阵。**请不要** 使用另一个矩阵来旋转图像。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/mat1.jpg)

```
输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
输出：[[7,4,1],[8,5,2],[9,6,3]]
```

## 解题思路

1. 使用辅助矩阵：空间O(N)
2. 原地旋转：找交换位置的规律，矩阵位置是对称的，因此每次交换的位置是有规律的，以最外圈的n个元素为例，前n-1个元素都会交换到对应的位置。将n-1个元素交换完，最外层也就结束了，接下来进入下一层交换元素。

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：40 MB, 在所有 Java 提交中击败了93.91%的用户
>
> 通过测试用例：21 / 21
>
> 时间 O(N*N)
>
> 空间 O(1)

```java
class Solution {
    public void rotate(int[][] matrix) {
        int len=matrix[0].length;
        if(len==1)return;
        // n表示不重复的圈数
        int n=len/2-1;
        // i 表示层数-1
        int i=0;
        while(i<=n){
            // 矩阵中每次交换的元素的横纵坐标
            int rui=0+i,ruj=len-1-i,rli=len-1-i,rlj=len-1-i,lli=len-1-i,llj=0+i,lui=0+i,luj=0+i;
            // j 为单边的第几个元素
            int j=i;
            // 小于当前圈的边长 len/(lu+1)
            while(j<len-1-i){
                // 交换元素
                int tmp=matrix[lui][luj];
                matrix[lui][luj]=matrix[lli][llj];
                matrix[lli][llj]=matrix[rli][rlj];
                matrix[rli][rlj]=matrix[rui][ruj];
                matrix[rui][ruj]=tmp;
                // 向后移动，移动j
                luj+=1;
                rui+=1;
                rlj-=1;
                lli-=1;
                j++;
            }
            i++;
        }
    }
}
```

