---
title: leetcode 77
tags: 刷题
category: leetcode
abbrlink: 2848
date: 2023-03-06 10:57:08
---

## 题目描述

#### [77. 组合](https://leetcode.cn/problems/combinations/)



给定两个整数 `n` 和 `k`，返回范围 `[1, n]` 中所有可能的 `k` 个数的组合。

你可以按 **任何顺序** 返回答案。

 

**示例 1：**

```
输入：n = 4, k = 2
输出：
[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]
```





## 解题思路

1. 回溯：元素无重复不可复选问题

> 执行用时：18 ms, 在所有 Java 提交中击败了25.06%的用户
>
> 内存消耗：42.9 MB, 在所有 Java 提交中击败了37.61%的用户
>
> 通过测试用例：27 / 27
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    List<List<Integer>> res=new ArrayList<List<Integer>>();
    List<Integer> list=new ArrayList<Integer>();
    public List<List<Integer>> combine(int n, int k) {
        backTrace(n,1,k);
        return res;
    }
    public void backTrace(int n,int begin,int k){
        if(list.size()==k){
            res.add(new ArrayList(list));
            return;
        }
        for(;begin<=n;begin++){
            list.add(begin);
            backTrace(n,begin+1,k);
            list.remove(list.size()-1);
        }
    }
}
```

