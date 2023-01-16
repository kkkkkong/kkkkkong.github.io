---
title: leetcode 169
tags: 刷题
category: leetcode
abbrlink: 23339
date: 2023-01-16 23:04:04
---

## 题目描述

#### [169. 多数元素](https://leetcode.cn/problems/majority-element/)



给定一个大小为 `n` 的数组 `nums` ，返回其中的多数元素。多数元素是指在数组中出现次数 **大于** `⌊ n/2 ⌋` 的元素。

你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 

**示例 1：**

```
输入：nums = [3,2,3]
输出：3
```

## 解题思路

1. 使用HashMap存储，遍历

> 执行用时：21 ms, 在所有 Java 提交中击败了6.60%的用户
>
> 内存消耗：46.6 MB, 在所有 Java 提交中击败了16.36%的用户
>
> 通过测试用例：45 / 45
>
> 时间 O(n)
>
> 空间 O(n) 使用了一个HashMap存储

```java
class Solution {
    public int majorityElement(int[] nums) {
        Map<Integer,Integer> map=new HashMap();
        int n=nums.length;
        for(int i=0;i<n;i++){
            int key=nums[i];
            if(map.getOrDefault(key,0)==n/2)return nums[i];
            map.put(key,map.getOrDefault(key,0)+1);
        }
        return 0;
    }
}
```

2. 时空 O(n) O(1)的还没看懂