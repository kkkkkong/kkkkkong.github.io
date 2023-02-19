---
title: leetcode 974
tags: 刷题
category: leetcode
abbrlink: 52330
date: 2023-02-19 16:52:01
---

## 题目描述

#### [974. 和可被 K 整除的子数组](https://leetcode.cn/problems/subarray-sums-divisible-by-k/)



给定一个整数数组 `nums` 和一个整数 `k` ，返回其中元素之和可被 `k` 整除的（连续、非空） **子数组** 的数目。

**子数组** 是数组的 **连续** 部分。

 

**示例 1：**

```
输入：nums = [4,5,0,-2,-3,1], k = 5
输出：7
解释：
有 7 个子数组满足其元素之和可被 k = 5 整除：
[4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]
```



## 解题思路

1. 前缀和+同余定理+哈希表，a和b对k的余数相同，那么(a-b)对k取余为0

> 执行用时：16 ms, 在所有 Java 提交中击败了81.95%的用户
>
> 内存消耗：47.6 MB, 在所有 Java 提交中击败了5.25%的用户
>
> 通过测试用例：73 / 73
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public int subarraysDivByK(int[] nums, int k) {
        Map<Integer,Integer> map=new HashMap();
        map.put(0,1);
        int ans=0,sum=0,n=nums.length;
        for(int i=0;i<n;i++){
            sum+=nums[i];
            int mod=(sum%k+k)%k;
            int value=map.getOrDefault(mod,0);
            if(value!=0){
                ans+=value;
            }
            map.put(mod,value+1);
        }
        return ans;
    }
}
```

