---
title: leetcode 11
tags: 刷题
category: leetcode
abbrlink: 43427
date: 2022-12-31 19:11:30
---

## 题目描述

给定一个长度为 n 的整数数组 height 。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i]) 。

找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

返回容器可以储存的最大水量。

说明：你不能倾斜容器。

[题目链接11. 盛最多水的容器 - 力扣（LeetCode）](https://leetcode.cn/problems/container-with-most-water/)



## 解决思路

1. 拿过来一看，最先想到的就是暴力解法，两层for循环遍历，寻找最大元素，但作为中等题，果然是超时的

   ```java
   class Solution {
       public int maxArea(int[] height) {
           int max=0;
           for(int left=0;left<height.length-1;left++){
               for(int right=left+1;right<height.length;right++){
                   int tmp =(height[right]>height[left]?height[left]:height[right])*(right-left);
                   max=max>tmp?max:tmp;
               }
           }
           return max;
       }
   }
   ```

   

2. 暴力不行，然后考虑采用其他方式，按照提示，考虑采用双指针，分别指向开头和结尾，从两边向中间缩，但怎么移动指针是关键，面积是容器底[1]*两边中较小的一方[2]，底随着移动不断缩小，因此只有增大[2]，短板效应，需要将[2]中较小的一方扩大，才能扩大，因此较小的一方移动

   ```java
   class Solution {
       public int maxArea(int[] height) {
           int max=0;
           int left=0,right=height.length-1;
           while(left<right){
               int tmp=(height[right]>height[left]?height[left]:height[right])*(right-left);
               max=max>tmp?max:tmp;
               if(height[right]>height[left]){
                   left++;
               }
               else{
                   right--;
               }
           }
           return max;
       }
   }
   ```

   

