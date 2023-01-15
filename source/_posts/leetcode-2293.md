---
title: leetcode 2293
tags: 刷题
category: leetcode
abbrlink: 36634
date: 2023-01-15 10:59:12
---

## 题目描述

#### [2293. 极大极小游戏](https://leetcode.cn/problems/min-max-game/)



给你一个下标从 **0** 开始的整数数组 `nums` ，其长度是 `2` 的幂。

对 `nums` 执行下述算法：

1. 设 `n` 等于 `nums` 的长度，如果 `n == 1` ，**终止** 算法过程。否则，**创建** 一个新的整数数组 `newNums` ，新数组长度为 `n / 2` ，下标从 **0** 开始。
2. 对于满足 `0 <= i < n / 2` 的每个 **偶数** 下标 `i` ，将 `newNums[i]` **赋值** 为 `min(nums[2 * i], nums[2 * i + 1])` 。
3. 对于满足 `0 <= i < n / 2` 的每个 **奇数** 下标 `i` ，将 `newNums[i]` **赋值** 为 `max(nums[2 * i], nums[2 * i + 1])` 。
4. 用 `newNums` 替换 `nums` 。
5. 从步骤 1 开始 **重复** 整个过程。

执行算法后，返回 `nums` 中剩下的那个数字。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/example1drawio-1.png)

```
输入：nums = [1,3,5,2,4,8,2,2]
输出：1
解释：重复执行算法会得到下述数组。
第一轮：nums = [1,5,4,2]
第二轮：nums = [1,4]
第三轮：nums = [1]
1 是最后剩下的那个数字，返回 1 。
```



## 解题思路

1. 迭代，除了个别行，和官方题解竟然一模一样，变量名都一样

> 执行用时：1 ms, 在所有 Java 提交中击败了71.01%的用户
>
> 内存消耗：40.8 MB, 在所有 Java 提交中击败了92.02%的用户
>
> 通过测试用例：96 / 96
>
> 时间 O(n)
>
> 空间 O(n)

```java
class Solution {
    public int minMaxGame(int[] nums) {
        // 迭代
        int n=nums.length;
        while(n!=1){
            int []newNums=new int[n/2];
            for(int i=0;i<n/2;i++){
                if(i%2==0){
                    newNums[i]=Math.min(nums[2*i],nums[2*i+1]);
                }
                else{
                    newNums[i]=Math.max(nums[2*i],nums[2*i+1]);
                }
            }
            n=newNums.length;
            nums=newNums;
        }
        return nums[0];
    }
}
```

2. 原地操作：在顺序遍历的情况下，newNums[i]的结果可以直接存在nums[i]中，因为，nums[i]的值在本次循环中不会再使用了，之前在计算nums[i/2]的时候已经被使用过了。但不只为何，内存消耗不降反增。

> 执行用时：1 ms, 在所有 Java 提交中击败了71.01%的用户
>
> 内存消耗：41.1 MB, 在所有 Java 提交中击败了47.06%的用户
>
> 通过测试用例：96 / 96
>
> 时间 O(n)
>
> 空间 O(1)

```java
class Solution {
    public int minMaxGame(int[] nums) {
        // 原地操作
        int n=nums.length;
        while(n!=1){
            int m=n/2;
            for(int i=0;i<n/2;i++){
                if(i%2==0){
                    nums[i]=Math.min(nums[2*i],nums[2*i+1]);
                }
                else{
                    nums[i]=Math.max(nums[2*i],nums[2*i+1]);
                }
            }
            n=m;
        }
        return nums[0];
    }
}
```

