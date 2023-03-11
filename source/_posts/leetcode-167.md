---
title: leetcode 167
tags: 刷题
category: leetcode
abbrlink: 40874
date: 2023-03-10 09:47:54
---

## 题目描述

#### [167. 两数之和 II - 输入有序数组](https://leetcode.cn/problems/two-sum-ii-input-array-is-sorted/)



给你一个下标从 **1** 开始的整数数组 `numbers` ，该数组已按 **非递减顺序排列** ，请你从数组中找出满足相加之和等于目标数 `target` 的两个数。如果设这两个数分别是 `numbers[index1]` 和 `numbers[index2]` ，则 `1 <= index1 < index2 <= numbers.length` 。

以长度为 2 的整数数组 `[index1, index2]` 的形式返回这两个整数的下标 `index1` 和 `index2`。

你可以假设每个输入 **只对应唯一的答案** ，而且你 **不可以** 重复使用相同的元素。

你所设计的解决方案必须只使用常量级的额外空间。

**示例 1：**

```
输入：numbers = [2,7,11,15], target = 9
输出：[1,2]
解释：2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。返回 [1, 2] 。
```



## 解题思路

1. 排序+双指针

> 执行用时：2 ms, 在所有 Java 提交中击败了36.44%的用户
>
> 内存消耗：44.3 MB, 在所有 Java 提交中击败了50.61%的用户
>
> 通过测试用例：22 / 22
>
> 时间 O(nlongn)
>
> 空间 O(N)

```java
class Solution {
    public int[] twoSum(int[] numbers, int target) {
        Arrays.sort(numbers);
        int left=0,right=numbers.length-1;
        while(left<right){
            int sum=numbers[left]+numbers[right];
            if(sum>target){
                right--;
            }
            else if(sum<target){
                left++;
            }
            else{
                return new int []{left+1,right+1};
            }
        }
        return new int[2];
    }
}
```

