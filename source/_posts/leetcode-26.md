---
title: leetcode 26
tags: 刷题
category: leetcode
abbrlink: 39906
date: 2023-02-28 14:35:28
---

## 题目描述

#### [26. 删除有序数组中的重复项](https://leetcode.cn/problems/remove-duplicates-from-sorted-array/)



给你一个 **升序排列** 的数组 `nums` ，请你**[ 原地](http://baike.baidu.com/item/原地算法)** 删除重复出现的元素，使每个元素 **只出现一次** ，返回删除后数组的新长度。元素的 **相对顺序** 应该保持 **一致** 。

由于在某些语言中不能改变数组的长度，所以必须将结果放在数组nums的第一部分。更规范地说，如果在删除重复项之后有 `k` 个元素，那么 `nums` 的前 `k` 个元素应该保存最终结果。

将最终结果插入 `nums` 的前 `k` 个位置后返回 `k` 。

不要使用额外的空间，你必须在 **[原地 ](https://baike.baidu.com/item/原地算法)修改输入数组** 并在使用 O(1) 额外空间的条件下完成。

**判题标准:**

系统会用下面的代码来测试你的题解:

```
int[] nums = [...]; // 输入数组
int[] expectedNums = [...]; // 长度正确的期望答案

int k = removeDuplicates(nums); // 调用

assert k == expectedNums.length;
for (int i = 0; i < k; i++) {
    assert nums[i] == expectedNums[i];
}
```

如果所有断言都通过，那么您的题解将被 **通过**。





## 解题思路

1. 快慢指针

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：43.3 MB, 在所有 Java 提交中击败了29.47%的用户
>
> 通过测试用例：361 / 361
>
> 时间 O(N)
>
> 空间 O(1)

```java
class Solution {
    public int removeDuplicates(int[] nums) {
        int low=1,fast=1,n=nums.length;
        for(int i=1;i<n;i++){
            if(nums[i]!=nums[i-1]){
                nums[low]=nums[i];
                low++;
            }
        }
        return low;

    }
}
```

