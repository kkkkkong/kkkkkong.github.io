---
title: leetcode 1814
tags: 刷题
category: leetcode
abbrlink: 52092
date: 2023-01-17 17:22:52
---

## 题目描述

#### [1814. 统计一个数组中好对子的数目](https://leetcode.cn/problems/count-nice-pairs-in-an-array/)



给你一个数组 `nums` ，数组中只包含非负整数。定义 `rev(x)` 的值为将整数 `x` 各个数字位反转得到的结果。比方说 `rev(123) = 321` ， `rev(120) = 21` 。我们称满足下面条件的下标对 `(i, j)` 是 **好的** ：

- `0 <= i < j < nums.length`
- `nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])`

请你返回好下标对的数目。由于结果可能会很大，请将结果对 `109 + 7` **取余** 后返回。

 

**示例 1：**

```
输入：nums = [42,11,1,97]
输出：2
解释：两个坐标对为：
 - (0,3)：42 + rev(97) = 42 + 79 = 121, 97 + rev(42) = 97 + 24 = 121 。
 - (1,2)：11 + rev(1) = 11 + 1 = 12, 1 + rev(11) = 1 + 11 = 12 。
```

## 解题思路

1. 暴力解法，两层for循环

> 超时
>
> 时间 O(n*n)
>
> 空间 O(1)

```java
class Solution {
    public int countNicePairs(int[] nums) {
        int n=nums.length;
        int res=0;
        for(int i=0;i<n-1;i++){
            for(int j=i+1;j<n;j++){
                if(isGood(nums[i],nums[j])){
                    res++;
                    res=res%1000000007;
                }
            }
        }
        return res;

    }
    public int getRevert(int num){
        int res=0;
        while(num!=0){
            res=res*10+num%10;
            num=num/10;
        }
        return res;

    }
    public boolean isGood(int i,int j){
        int iRevert=getRevert(i);
        int jRevert=getRevert(j);
        if(i+jRevert==j+iRevert){
            return true;
        }
        return false;

    }
}
```



2. 哈希表，将等式`nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])`转换为：`nums[i] - rev(nums[i]) == nums[j] - rev(nums[j]) `，那么只需对`nums[i] - rev(nums[i])`做哈希表计数，然后进行统计，排列组合的结果输出；需要注意的是，计算排列组合结果时，乘法会超出int的范围，需要用long来转换

> 执行用时：34 ms, 在所有 Java 提交中击败了53.15%的用户
>
> 内存消耗：57.7 MB, 在所有 Java 提交中击败了26.13%的用户
>
> 通过测试用例：84 / 84
>
> 时间 O(n)
>
> 空间 O(n)

```java
class Solution {
    public int countNicePairs(int[] nums) {
        Map<Integer,Integer> map=new HashMap();
        System.out.println((long)(100000*99999/2));
        int res=0;
        for(int i=0;i<nums.length;i++){
            int key=nums[i]-getRevert(nums[i]);
            map.put(key,map.getOrDefault(key,0)+1);
        }
        for(int num:map.values()){
            long tmp=((long)num*((long)num-1)/2)%1000000007;
            res+=(int)tmp;
            res%=1000000007;
        }
        return res;

    }
    public int getRevert(int num){
        int res=0;
        while(num!=0){
            res=res*10+num%10;
            num=num/10;
        }
        return res;
    }
}
```

