---
title: leetcode 1124
tags: 刷题
category: leetcode
abbrlink: 14764
date: 2023-02-14 20:29:10
---

## 题目描述

#### [1124. 表现良好的最长时间段](https://leetcode.cn/problems/longest-well-performing-interval/)



给你一份工作时间表 `hours`，上面记录着某一位员工每天的工作小时数。

我们认为当员工一天中的工作小时数大于 `8` 小时的时候，那么这一天就是「**劳累的一天**」。

所谓「表现良好的时间段」，意味在这段时间内，「劳累的天数」是严格 **大于**「不劳累的天数」。

请你返回「表现良好时间段」的最大长度。

 

**示例 1：**

```
输入：hours = [9,9,6,0,6,6,9]
输出：3
解释：最长的表现良好时间段是 [9,9,6]。
```



## 解题思路

1. 哈希表+前缀和：将原问题转化为和大于0的最小子数组的问题，通过前缀和求解。

如果hours[i]>8，则arr[i]为1，否则为-1，然后再用arr[i]表示前i个元素的和，要寻找i和j，使得在i<j时，arr[i]-arr[j]>0（也就意味着i到j之间的和大于0，也即问题的求解）

对于arr[i]，有两种情况

- arr[i]>0，表示前i+1个元素的和是表现良好的时间段
- arr[i]<=0，则需要找到一个j，满足j<i，arr[i]-arr[j]>0，对于arr[j]来说，存在两种情况
  - j<i时，不存在arr[i]-arr[j]>0，
  - j<i时，存在arr[i]-arr[j]>0，那么此时也一定存在arr[i]-arr[j]=1，也即arr[j]=arr[i]-1，使用哈希表存储第一次出现的arr[j]即可

> 执行用时：8 ms, 在所有 Java 提交中击败了70.25%的用户
>
> 内存消耗：42.1 MB, 在所有 Java 提交中击败了44.50%的用户
>
> 通过测试用例：98 / 98
>
> 时间 O(N)
>
> 空间 O(N)

```java
class Solution {
    public int longestWPI(int[] hours) {
        int n=hours.length;
        int [] arr=new int[n];
        int ans=0;
        Map<Integer,Integer> map=new HashMap();
        arr[0]=hours[0]>8?1:-1;
        for(int i=1;i<n;i++){
            arr[i]=arr[i-1]+(hours[i]>8?1:-1);
        }
        for(int i=0;i<n;i++){
            if(arr[i]>0){
                ans=Math.max(ans,i+1);
            }
            else{
                int tmp=map.getOrDefault(arr[i]-1,-1);
                if(tmp!=-1){
                    ans=Math.max(ans,i-tmp);
                }
                map.putIfAbsent(arr[i],i);
            }
        }
        return ans;

    }
}
```

