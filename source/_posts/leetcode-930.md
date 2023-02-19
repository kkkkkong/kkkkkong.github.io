---
title: leetcode 930
tags: 刷题
category: leetcode
abbrlink: 53097
date: 2023-02-19 15:17:09
---

## 题目描述

#### [930. 和相同的二元子数组](https://leetcode.cn/problems/binary-subarrays-with-sum/)



给你一个二元数组 `nums` ，和一个整数 `goal` ，请你统计并返回有多少个和为 `goal` 的 **非空** 子数组。

**子数组** 是数组的一段连续部分。

 

**示例 1：**

```
输入：nums = [1,0,1,0,1], goal = 2
输出：4
解释：
有 4 个满足题目要求的子数组：[1,0,1]、[1,0,1,0]、[0,1,0,1]、[1,0,1]
```





## 解题思路

1. 哈希表+前缀和：hashmap存放sum出现的次数

> 执行用时：20 ms, 在所有 Java 提交中击败了59.25%的用户
>
> 内存消耗：46.1 MB, 在所有 Java 提交中击败了35.95%的用户
>
> 通过测试用例：60 / 60
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public int numSubarraysWithSum(int[] nums, int goal) {
        // hashmap存放sum出现的次数
        Map <Integer,Integer> map=new HashMap();
        map.put(0,1);
        int n=nums.length;
        int sum=0,ans=0;;
        for(int i=0;i<n;i++){
            sum+=nums[i];
            int value=map.getOrDefault(sum-goal,-1);
            if(value!=-1){
                ans+=value;
            }
            map.put(sum,map.getOrDefault(sum,0)+1);
        }
        return ans;
    }
}
```

2. 滑动窗口，重点打开思路，因为数组中只有0和1，需要使用两个左指针来表示right固定的情况下，有多少种情况满足

> 执行用时：3 ms, 在所有 Java 提交中击败了78.77%的用户
>
> 内存消耗：45.2 MB, 在所有 Java 提交中击败了60.27%的用户
>
> 通过测试用例：60 / 60
>
> 时间 O(N)
>
> 空间 O(1)

```java
class Solution {
    public int numSubarraysWithSum(int[] nums, int goal) {
        int n=nums.length;
        int left1=0,left2=0,right=0,ans=0,sum1=0,sum2=0;
        while(right<n){
            sum1+=nums[right];
            while(left1<=right&&sum1>goal){
                sum1-=nums[left1];
                left1++;
            }
            sum2+=nums[right];
            while(left2<=right&&sum2>=goal){
                sum2-=nums[left2];
                left2++;
            }
            ans+=left2-left1;
            right++;
        }
        return ans;
    }
}
```

