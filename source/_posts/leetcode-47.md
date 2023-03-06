---
title: leetcode 47
tags: 刷题
category: leetcode
abbrlink: 64288
date: 2023-03-06 17:08:01
---

## 题目描述

#### [47. 全排列 II](https://leetcode.cn/problems/permutations-ii/)



给定一个可包含重复数字的序列 `nums` ，***按任意顺序*** 返回所有不重复的全排列。

 

**示例 1：**

```
输入：nums = [1,1,2]
输出：
[[1,1,2],
 [1,2,1],
 [2,1,1]]
```



## 解题思路

1. 回溯：元素重复的不可重复选的排列问题

> 执行用时：2 ms, 在所有 Java 提交中击败了41.88%的用户
>
> 内存消耗：41.9 MB, 在所有 Java 提交中击败了89.25%的用户
>
> 通过测试用例：33 / 33
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    List<List<Integer>> ans=new ArrayList();
    List<Integer> list=new ArrayList();
    public List<List<Integer>> permuteUnique(int[] nums) {
        boolean []used=new boolean[nums.length];
        backTrack(nums,used);
        return ans;

    }
    public void backTrack(int []nums,boolean []used){
        if(list.size()==nums.length){
            ans.add(new ArrayList(list));
            return ;
        }
        Set<Integer> set=new HashSet();
        for(int i=0;i<nums.length;i++){
            if(set.contains(nums[i])||used[i]==true){
                continue;
            }
            set.add(nums[i]);
            list.add(nums[i]);
            used[i]=true;
            backTrack(nums,used);
            list.remove(list.size()-1);
            used[i]=false;
        }
    }
}
```

