---
title: leetcode 724
tags: 刷题
category: leetcode
abbrlink: 24328
date: 2023-02-19 10:26:13
---

## 题目描述

#### [724. 寻找数组的中心下标](https://leetcode.cn/problems/find-pivot-index/)



给你一个整数数组 `nums` ，请计算数组的 **中心下标** 。

数组 **中心下标** 是数组的一个下标，其左侧所有元素相加的和等于右侧所有元素相加的和。

如果中心下标位于数组最左端，那么左侧数之和视为 `0` ，因为在下标的左侧不存在元素。这一点对于中心下标位于数组最右端同样适用。

如果数组有多个中心下标，应该返回 **最靠近左边** 的那一个。如果数组不存在中心下标，返回 `-1` 。

 

**示例 1：**

```
输入：nums = [1, 7, 3, 6, 5, 6]
输出：3
解释：
中心下标是 3 。
左侧数之和 sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11 ，
右侧数之和 sum = nums[4] + nums[5] = 5 + 6 = 11 ，二者相等。
```



## 解题思路

1. 前缀和

> 执行用时：1 ms, 在所有 Java 提交中击败了73.45%的用户
>
> 内存消耗：42.4 MB, 在所有 Java 提交中击败了32.02%的用户
>
> 通过测试用例：746 / 746
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public int pivotIndex(int[] nums) {
        int n=nums.length;
        int []sum=new int [n+1];
        for(int i=1;i<n+1;i++){
            sum[i]=sum[i-1]+nums[i-1];
        }
        for(int i=0;i<n;i++){
            if(sum[i]==sum[n]-sum[i+1]){
                return i;
            }
        }
        return -1;
    }
}
```

2. 前缀和优化，不需要使用数组存储，只需要用一个变量记录当前的数组和是多少即可

> 执行用时：3 ms, 在所有 Java 提交中击败了36.89%的用户
>
> 内存消耗：42 MB, 在所有 Java 提交中击败了75.86%的用户
>
> 通过测试用例：746 / 746
>
> 时间 O(N)
>
> 空间 O(1)
>
> 一样的代码，运行两次，也不知道是为何两次差距这么大
>
> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：42.6 MB, 在所有 Java 提交中击败了10.93%的用户
>
> 通过测试用例：746 / 746

```java
class Solution {
    public int pivotIndex(int[] nums) {
        int n=nums.length;
        int sum=0;
        for(int i=0;i<n;i++){
            sum+=nums[i];
        }
        int pre=0;
        for(int i=0;i<n;i++){
            if(pre==sum-pre-nums[i]){
                return i;
            }
            pre+=nums[i];
        }
        return -1;

    }
}
```

