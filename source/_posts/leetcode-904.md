---
title: leetcode 904
tags: 刷题
category: leetcode
abbrlink: 64616
date: 2023-02-28 10:04:57
---

## 题目描述

#### [904. 水果成篮](https://leetcode.cn/problems/fruit-into-baskets/)



你正在探访一家农场，农场从左到右种植了一排果树。这些树用一个整数数组 `fruits` 表示，其中 `fruits[i]` 是第 `i` 棵树上的水果 **种类** 。

你想要尽可能多地收集水果。然而，农场的主人设定了一些严格的规矩，你必须按照要求采摘水果：

- 你只有 **两个** 篮子，并且每个篮子只能装 **单一类型** 的水果。每个篮子能够装的水果总量没有限制。
- 你可以选择任意一棵树开始采摘，你必须从 **每棵** 树（包括开始采摘的树）上 **恰好摘一个水果** 。采摘的水果应当符合篮子中的水果类型。每采摘一次，你将会向右移动到下一棵树，并继续采摘。
- 一旦你走到某棵树前，但水果不符合篮子的水果类型，那么就必须停止采摘。

给你一个整数数组 `fruits` ，返回你可以收集的水果的 **最大** 数目。

 

**示例 1：**

```
输入：fruits = [1,2,1]
输出：3
```



## 解题思路

1. 滑动窗口+哈希表

> 执行用时：42 ms, 在所有 Java 提交中击败了64.08%的用户
>
> 内存消耗：50.6 MB, 在所有 Java 提交中击败了52.45%的用户
>
> 通过测试用例：91 / 91
>
> 时间 O(N)
>
> 空间 O(1),最多只用3个空间的map，可以看做是常数空间

```java
class Solution {
    public int totalFruit(int[] fruits) {
        HashMap<Integer,Integer> map=new HashMap();
        int left=0,right=0,n=fruits.length,ans=0;
        while(right<n){
            map.put(fruits[right],map.getOrDefault(fruits[right],0)+1);
            right++;
            while(map.size()>2){
                int value=map.get(fruits[left]);
                if(value>1){
                    map.put(fruits[left],value-1);
                }
                else{
                    map.remove(fruits[left]);
                }
                left++;
            }
            ans=Math.max(ans,right-left);
        }
        return ans;
    }
}
```

