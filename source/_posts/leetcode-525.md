---
title: leetcode 525
tags: 刷题
category: leetcode
abbrlink: 24424
date: 2023-02-17 11:20:26
---

## 题目描述

#### [525. 连续数组](https://leetcode.cn/problems/contiguous-array/)



给定一个二进制数组 `nums` , 找到含有相同数量的 `0` 和 `1` 的最长连续子数组，并返回该子数组的长度。

 

**示例 1:**

```
输入: nums = [0,1]
输出: 2
说明: [0, 1] 是具有相同数量 0 和 1 的最长连续子数组。
```



## 解题思路

> 这里的变0为-1真的是神来之笔

1. 前缀和+变0为-1，将0变为-1后，主要统计前缀和，将第一次出现的元素保存到map中。特殊的，和为0的表示天然符合题目要求

> 执行用时：13 ms, 在所有 Java 提交中击败了97.19%的用户
>
> 内存消耗：49.6 MB, 在所有 Java 提交中击败了95.36%的用户
>
> 通过测试用例：564 / 564
>
> 时间 O(n)
>
> 空间 O(n)

```java
class Solution {
    public int findMaxLength(int[] nums) {
        int n=nums.length;
        int ans =0;
        for(int i=0;i<n;i++){
            if(nums[i]==0)nums[i]=-1;
        }
        int sum=0;
        // 存放第一个和为k的元素位置
        HashMap<Integer,Integer> map=new HashMap();
        for(int i=0;i<n;i++){
            sum+=nums[i];
            if(sum==0){
                ans=Math.max(ans,i+1);
            }
            int tmp=map.getOrDefault(sum,-1);
            if(tmp==-1){
                map.put(sum,i);
            }
            else{
                ans=Math.max(ans,i-tmp);
            }
        }
        return ans;

    }
}
```

