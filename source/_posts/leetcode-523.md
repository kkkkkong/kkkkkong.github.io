---
title: leetcode 523
tags: 刷题
category: leetcode
abbrlink: 24040
date: 2023-02-20 09:08:11
---

## 题目描述

#### [523. 连续的子数组和](https://leetcode.cn/problems/continuous-subarray-sum/)



给你一个整数数组 `nums` 和一个整数 `k` ，编写一个函数来判断该数组是否含有同时满足下述条件的连续子数组：

- 子数组大小 **至少为 2** ，且
- 子数组元素总和为 `k` 的倍数。

如果存在，返回 `true` ；否则，返回 `false` 。

如果存在一个整数 `n` ，令整数 `x` 符合 `x = n * k` ，则称 `x` 是 `k` 的一个倍数。`0` 始终视为 `k` 的一个倍数。

 

**示例 1：**

```
输入：nums = [23,2,4,6,7], k = 6
输出：true
解释：[2,4] 是一个大小为 2 的子数组，并且和为 6 。
```



## 解题思路

1. 哈希表+同余定理+前缀和

> 执行用时：25 ms, 在所有 Java 提交中击败了9.51%的用户
>
> 内存消耗：56.9 MB, 在所有 Java 提交中击败了59.05%的用户
>
> 通过测试用例：98 / 98
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public boolean checkSubarraySum(int[] nums, int k) {
        Map<Integer,Integer> map=new HashMap();
        map.put(0,-1);
        int sum=0,n=nums.length;
        for(int i=0;i<n;i++){
            sum+=nums[i];
            int mod=sum%k;
            int value=map.getOrDefault(mod,-2);
            if(value!=-2&&i-value>1){
                return true;
            }
            map.put(mod,map.getOrDefault(mod,i));
        }
        return false;

    }
}
```

