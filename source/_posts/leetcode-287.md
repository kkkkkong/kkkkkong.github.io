---
title: leetcode 287
tags: 刷题
category: leetcode
abbrlink: 65374
date: 2023-02-07 20:38:48
---

## 题目描述

#### [287. 寻找重复数](https://leetcode.cn/problems/find-the-duplicate-number/)



给定一个包含 `n + 1` 个整数的数组 `nums` ，其数字都在 `[1, n]` 范围内（包括 `1` 和 `n`），可知至少存在一个重复的整数。

假设 `nums` 只有 **一个重复的整数** ，返回 **这个重复的数** 。

你设计的解决方案必须 **不修改** 数组 `nums` 且只用常量级 `O(1)` 的额外空间。

 

**示例 1：**

```
输入：nums = [1,3,4,2,2]
输出：2
```



## 解题思路

因题目要求不修改数组且空间复杂度为O(1)，因此有些思路不可用，如

1. 排序+遍历

   1. > 时间 O(NlogN)、空间 O(N)

2. 哈希表

   1. 时间 O(N)、空间 O(N)

符合题目要求的思路

1. 两层for，暴力求解

> 超时
>
> 时间 O(N*N)
>
> 空间 O(1)

2. 参考题解，二进制法。核心思想：考虑数字的第 i 位，nums数组中的数字，第 i 位为1的数字个数为x；[1,n]中的数字，第 i 位为1的数字个数为y，x>y是 <=> 重复的数字第 i 位为1。

> 执行用时：48 ms, 在所有 Java 提交中击败了5.05%的用户
>
> 内存消耗：58.4 MB, 在所有 Java 提交中击败了84.90%的用户
>
> 通过测试用例：58 / 58
>
> 时间 O(NlogN)
>
> 空间 O(1)

```java
class Solution {
    public int findDuplicate(int[] nums) {
        int res=0;
        int n=nums.length;
        // 记录n的最大位数
        int bitMax=31;
        // 找到n-1的有效位数
        while((n-1)>>bitMax==0){
            bitMax--;
        }
        for(int bit=0;bit<=bitMax;bit++){
            int x=0,y=0;
            for(int i=0;i<n;i++){
                if((nums[i]&(1<<bit))!=0){
                    x++;
                }
                if(i!=0&& (i&(1<<bit))!=0){
                    y++;
                }
            }
            if(x>y){
                res|=1<<bit;
            }
        }
        return res;
    }
}
```

3. 双指针，将数组问题转换为环形链表问题

> 如果数组中有重复的数，以数组 [1,3,4,2,2] 为例,我们将数组下标 n 和数 nums[n] 建立一个映射关系 f(n)，
> 其映射关系 n->f(n) 为：
> 0->1
> 1->3
> 2->4
> 3->2
> 4->2
> 同样的，我们从下标为 0 出发，根据 
> f(n) 计算出一个值，以这个值为新的下标，再用这个函数计算，以此类推产生一个类似链表一样的序列。
> 0->1->3->2->4->2->4->2->……

> 评论区大神：（**这应该是142题的解法证明，关键在于理解在找到环以后，为什么fast和从0开始向前移动，会同时到达环形开始点**） low = fast 时，快慢指针相遇，low 走过的距离是初始点（0）到环状开始的点 （x） 加上 环状开始的点（x） 到相遇点（y） 这段距离，而fast走过的距离是 初始点（0）到环状开始的点（x），点（x） 到点（y），点（y）到点（x），点（x）到点（y）。又因为fast走过的距离是low的两倍，设0到x长度为a，x到y长度为b,则有2*（a+b） = a+ b+ (y到x的距离) + b，则y到x的距离就等于0到x的距离。所以当新的两个指针 一个从0出发，一个从相遇点y出发时，他们走到的相同的值就是环状开始的点，即x点。
>
> 执行用时：4 ms, 在所有 Java 提交中击败了93.31%的用户
>
> 内存消耗：59 MB, 在所有 Java 提交中击败了29.98%的用户
>
> 通过测试用例：58 / 58

```java
class Solution {
    public int findDuplicate(int[] nums) {
        int slow=nums[0],fast=nums[nums[0]];
        while(slow!=fast){
            slow=nums[slow];
            fast=nums[nums[fast]];
        }
        int pre1=0,pre2=fast;
        while(pre1!=pre2){
            pre1=nums[pre1];
            pre2=nums[pre2];
        }
        return pre1;
    }
}
```

