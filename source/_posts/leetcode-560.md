---
title: leetcode 560
tags: 刷题
category: leetcode
abbrlink: 40106
date: 2023-02-18 15:49:42
---

## 题目描述

#### [560. 和为 K 的子数组](https://leetcode.cn/problems/subarray-sum-equals-k/)



给你一个整数数组 `nums` 和一个整数 `k` ，请你统计并返回 *该数组中和为 `k` 的连续子数组的个数* 。

 

**示例 1：**

```
输入：nums = [1,1,1], k = 2
输出：2
```



## 解题思路

1. 哈希表+前缀和：查找tmp[i]-k出现的次数

> 执行用时：17 ms, 在所有 Java 提交中击败了98.66%的用户
>
> 内存消耗：45.6 MB, 在所有 Java 提交中击败了39.34%的用户
>
> 通过测试用例：93 / 93
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public int subarraySum(int[] nums, int k) {
        Map <Integer,Integer> map=new HashMap();
        int n=nums.length;
        int []tmp=new int[n];
        int ans=0;
        tmp[0]=nums[0];
        for(int i=1;i<n;i++){
            tmp[i]=tmp[i-1]+nums[i];
        }
        // 查找tmp[i]-k出现的次数
        for(int i=0;i<n;i++){
            int q=tmp[i]-k;
            if(q==0){
                ans++;
            }
            int value=map.getOrDefault(q,0);
            if(value!=0){
                ans+=value;
            }
            map.put(tmp[i],map.getOrDefault(tmp[i],0)+1);
        }
        return ans;

    }
}
```

2. 方法一的优化，笑死，优化完，时间翻倍了

> 执行用时：29 ms, 在所有 Java 提交中击败了40.76%的用户
>
> 内存消耗：44.9 MB, 在所有 Java 提交中击败了63.23%的用户
>
> 通过测试用例：93 / 93
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public int subarraySum(int[] nums, int k) {
        Map <Integer,Integer> map=new HashMap();
        map.put(0,1);
        int ans=0,sum=0;
        for(int i=0;i<nums.length;i++){
            sum+=nums[i];
            int q=sum-k;
            int value=map.getOrDefault(q,0);
            if(value!=0){
                ans+=value;
            }
            map.put(sum,map.getOrDefault(sum,0)+1);
        }
        return ans;
    }
}
```

