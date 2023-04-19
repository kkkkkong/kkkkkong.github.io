---
title: leetcode 354
tags: 刷题
category: leetcode
abbrlink: 44619
date: 2023-04-19 09:19:34
---

## 题目描述

#### [354. 俄罗斯套娃信封问题](https://leetcode.cn/problems/russian-doll-envelopes/)



给你一个二维整数数组 `envelopes` ，其中 `envelopes[i] = [wi, hi]` ，表示第 `i` 个信封的宽度和高度。

当另一个信封的宽度和高度都比这个信封大的时候，这个信封就可以放进另一个信封里，如同俄罗斯套娃一样。

请计算 **最多能有多少个** 信封能组成一组“俄罗斯套娃”信封（即可以把一个信封放到另一个信封里面）。

**注意**：不允许旋转信封。

**示例 1：**

```
输入：envelopes = [[5,4],[6,4],[6,7],[2,3]]
输出：3
解释：最多信封的个数为 3, 组合为: [2,3] => [5,4] => [6,7]。
```

## 解题思路

1. 拆解为二维dp，先将原数组按照宽度升序排序，如果宽度相同，按照长度降序排序，这样不会出现多个宽度相同的信封

> 超时
>
> 时间 O(NlogN)
>
> 空间 O(N)

```java
class Solution {
    public int maxEnvelopes(int[][] envelopes) {
        Arrays.sort(envelopes,new Comparator<int[]>(){
            public int compare(int []o1,int []o2){
                // 宽度相同，按长度降序排序
                return o1[0]==o2[0]?
                o2[1]-o1[1]:o1[0]-o2[0];
            }
        });
        int len=envelopes.length;
        int []length=new int[len];
        for(int i=0;i<len;i++){
            length[i]=envelopes[i][1];
        }
        return getLis(length);

    }
    public int getLis(int []arr){
        int []dp=new int [arr.length];
        Arrays.fill(dp,1);
        for(int i=0;i<arr.length;i++){
            for(int j=0;j<i;j++){
                if(arr[i]>arr[j]){
                    dp[i]=Math.max(dp[i],dp[j]+1);
                }
            }
        }
        int ans=0;
        for(int i=0;i<arr.length;i++){
            ans=Math.max(ans,dp[i]);
        }
        return ans;
    }
}
```

2. 使用二分做，不是正常人想的，近期理解普通dp就行