---
title: leetcode 978
tags: 刷题
category: leetcode
abbrlink: 51562
date: 2023-02-27 11:31:23
---

## 题目描述

#### [978. 最长湍流子数组](https://leetcode.cn/problems/longest-turbulent-subarray/)



给定一个整数数组 `arr` ，返回 `arr` 的 *最大湍流子数组的**长度*** 。

如果比较符号在子数组中的每个相邻元素对之间翻转，则该子数组是 **湍流子数组** 。

更正式地来说，当 `arr` 的子数组 `A[i], A[i+1], ..., A[j]` 满足仅满足下列条件时，我们称其为*湍流子数组*：

- 若 

  ```
  i <= k < j
  ```

   ：

  - 当 `k` 为奇数时， `A[k] > A[k+1]`，且
  - 当 `k` 为偶数时，`A[k] < A[k+1]`；

- 或 

  若 

  ```
  i <= k < j
  ```

   ：

  - 当 `k` 为偶数时，`A[k] > A[k+1]` ，且
  - 当 `k` 为奇数时， `A[k] < A[k+1]`。

 

**示例 1：**

```
输入：arr = [9,4,2,10,7,8,8,1,9]
输出：5
解释：arr[1] > arr[2] < arr[3] > arr[4] < arr[5]
```



## 解题思路

1. 滑窗，使用一个boolean类型变量记录情况，

面向测试用例编程

> 执行用时：6 ms, 在所有 Java 提交中击败了43.97%的用户
>
> 内存消耗：45.5 MB, 在所有 Java 提交中击败了70.82%的用户
>
> 通过测试用例：91 / 91
>
> 时间 O(N)
>
> 空间 O(1)

```java
    class Solution {
        public int maxTurbulenceSize(int[] arr) {
            int ans=0;
            int left=0,right=0,n=arr.length;
            if(n<2)return n;
            boolean judge=arr[0]>arr[1];
            while(right<n-1){
                // 如果符合条件
                if((arr[right]>arr[right+1])==judge&&arr[right]!=arr[right+1]){
                    right++;
                    judge=!judge;
                }
                else{
                    if(arr[right]==arr[right+1])right++;
                    left=right;
                    if(right<n-1){
                        judge=arr[right]>arr[right+1];
                    }
                }
                ans=Math.max(ans,right-left+1);
            }
            return ans;
        }
    }
```

