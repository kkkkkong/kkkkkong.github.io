---
title: leetcode 2341
tags: 刷题
category: leetcode
abbrlink: 7886
date: 2023-02-16 09:09:05
---

## 题目描述

#### [2341. 数组能形成多少数对](https://leetcode.cn/problems/maximum-number-of-pairs-in-array/)



给你一个下标从 **0** 开始的整数数组 `nums` 。在一步操作中，你可以执行以下步骤：

- 从 `nums` 选出 **两个** **相等的** 整数
- 从 `nums` 中移除这两个整数，形成一个 **数对**

请你在 `nums` 上多次执行此操作直到无法继续执行。

返回一个下标从 **0** 开始、长度为 `2` 的整数数组 `answer` 作为答案，其中 `answer[0]` 是形成的数对数目，`answer[1]` 是对 `nums` 尽可能执行上述操作后剩下的整数数目。

 

**示例 1：**

```
输入：nums = [1,3,2,1,3,2,2]
输出：[3,1]
解释：
nums[0] 和 nums[3] 形成一个数对，并从 nums 中移除，nums = [3,2,3,2,2] 。
nums[0] 和 nums[2] 形成一个数对，并从 nums 中移除，nums = [2,2,2] 。
nums[0] 和 nums[1] 形成一个数对，并从 nums 中移除，nums = [2] 。
无法形成更多数对。总共形成 3 个数对，nums 中剩下 1 个数字。
```



## 解题思路

1. 排序+枚举：排序后遍历数组，如果一个数和他后面的数相等，那么说明这两个数需要移除，否则继续向后移动

> 时间 O(NLogN)
>
> 空间 O(N)

```java
class Solution {
    public int[] numberOfPairs(int[] nums) {
        int n=nums.length;
        int []ans=new int []{0,n};
        Arrays.sort(nums);
        for(int i=0;i<n-1;i++){
            if(nums[i]==nums[i+1]){
                i++;
                ans[0]++;
                ans[1]-=2;
            }
        }
        return ans;
    }
}
```

2. 哈希+枚举

> 执行用时：1 ms, 在所有 Java 提交中击败了54.00%的用户
>
> 内存消耗：40.3 MB, 在所有 Java 提交中击败了40.80%的用户
>
> 通过测试用例：128 / 128
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public int[] numberOfPairs(int[] nums) {
        int n=nums.length;
        int ans=0;
        Map<Integer,Boolean> map=new HashMap();
        for(int i:nums){
            map.put(i,!map.getOrDefault(i,true));
            if(map.get(i)){
                ans++;
            }
        }
        return new int[]{ans,n-ans*2};
    }
}
```

