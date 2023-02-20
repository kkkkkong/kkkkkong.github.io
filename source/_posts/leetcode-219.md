---
title: leetcode 219
tags: 刷题
category: leetcode
abbrlink: 27609
date: 2023-02-20 10:31:47
---

## 题目描述

#### [219. 存在重复元素 II](https://leetcode.cn/problems/contains-duplicate-ii/)



给你一个整数数组 `nums` 和一个整数 `k` ，判断数组中是否存在两个 **不同的索引** `i` 和 `j` ，满足 `nums[i] == nums[j]` 且 `abs(i - j) <= k` 。如果存在，返回 `true` ；否则，返回 `false` 。

 

**示例 1：**

```
输入：nums = [1,2,3,1], k = 3
输出：true
```



## 解题思路

1. 哈希表+滑动窗口

> 执行用时：16 ms, 在所有 Java 提交中击败了84.97%的用户
>
> 内存消耗：51.8 MB, 在所有 Java 提交中击败了34.72%的用户
>
> 通过测试用例：54 / 54
>
> 时间 O(N)
>
> 空间 O(N)

```java
	class Solution {
    public boolean containsNearbyDuplicate(int[] nums, int k) {
        Set<Integer> set=new HashSet();
        int left=0,right=0;
        int n=nums.length;
        while(right<n){
            if(right-left<=k){
                if(set.contains(nums[right])){
                    return true;
                }
                set.add(nums[right]);
                right++;
            }
            else{
                set.remove(nums[left]);
                left++;
            }
        }
        return false;
    }
}
```

