---
title: leetcode 1664
tags: 刷题
category: leetcode
abbrlink: 14367
date: 2023-01-28 11:42:28
---

## 题目描述

#### [1664. 生成平衡数组的方案数](https://leetcode.cn/problems/ways-to-make-a-fair-array/)



给你一个整数数组 `nums` 。你需要选择 **恰好** 一个下标（下标从 **0** 开始）并删除对应的元素。请注意剩下元素的下标可能会因为删除操作而发生改变。

比方说，如果 `nums = [6,1,7,4,1]` ，那么：

- 选择删除下标 `1` ，剩下的数组为 `nums = [6,7,4,1]` 。
- 选择删除下标 `2` ，剩下的数组为 `nums = [6,1,4,1]` 。
- 选择删除下标 `4` ，剩下的数组为 `nums = [6,1,7,4]` 。

如果一个数组满足奇数下标元素的和与偶数下标元素的和相等，该数组就是一个 **平衡数组** 。

请你返回删除操作后，剩下的数组 `nums` 是 **平衡数组** 的 **方案数** 。

 

**示例 1：**

```
输入：nums = [2,1,6,4]
输出：1
解释：
删除下标 0 ：[1,6,4] -> 偶数元素下标为：1 + 4 = 5 。奇数元素下标为：6 。不平衡。
删除下标 1 ：[2,6,4] -> 偶数元素下标为：2 + 4 = 6 。奇数元素下标为：6 。平衡。
删除下标 2 ：[2,1,4] -> 偶数元素下标为：2 + 4 = 6 。奇数元素下标为：1 。不平衡。
删除下标 3 ：[2,1,6] -> 偶数元素下标为：2 + 6 = 8 。奇数元素下标为：1 。不平衡。
只有一种让剩余数组成为平衡数组的方案。
```



## 解题思路

1. 奇偶前缀和：四个变量模拟计算结果，从后往前依次移除元素，因为题目设定每次只移除一个元素，因此在从后向前移动的过程中，right元素的奇偶性是变换的

> 执行用时：5 ms, 在所有 Java 提交中击败了85.71%的用户
>
> 内存消耗：51.9 MB, 在所有 Java 提交中击败了21.80%的用户
>
> 通过测试用例：105 / 105
>
> 时间 O(n)
>
> 空间 O(1)
>
> 竟然和官方题解是一样的

```java
class Solution {
    public int waysToMakeFair(int[] nums) {
        // 分别新建变量表示奇数和与偶数和，并将其分为左右两部分表示
        int odd_sum_left=0,odd_sum_right=0,even_sum_left=0,even_sum_right=0;
        int n=nums.length;
        int res=0;
        for(int i=0;i<n;i++){
            if((i&1)!=0) odd_sum_left+=nums[i];
            else even_sum_left+=nums[i];
        }
        for(int i=n-1;i>=0;i--){
            if((i&1)!=0){
                odd_sum_left-=nums[i];
            }
            else{
                even_sum_left-=nums[i];
            }
            // 将两个right交换相加到left中
            if(odd_sum_left+even_sum_right==even_sum_left+odd_sum_right){
                res++;
            }
            if((i&1)!=0){
                odd_sum_right+=nums[i];
            }
            else{
                even_sum_right+=nums[i];
            }
        }
        return res;
    }
}
```

