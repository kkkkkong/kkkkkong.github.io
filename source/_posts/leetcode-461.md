---
title: leetcode 461
tags: 刷题
category: leetcode
abbrlink: 39994
date: 2023-01-18 09:54:22
---

## 题目描述

#### [461. 汉明距离](https://leetcode.cn/problems/hamming-distance/)



两个整数之间的 [汉明距离](https://baike.baidu.com/item/汉明距离) 指的是这两个数字对应二进制位不同的位置的数目。

给你两个整数 `x` 和 `y`，计算并返回它们之间的汉明距离。

 

**示例 1：**

```
输入：x = 1, y = 4
输出：2
解释：
1   (0 0 0 1)
4   (0 1 0 0)
       ↑   ↑
上面的箭头指出了对应二进制位不同的位置。
```

## 解题思路

1. 位运算

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：38.6 MB, 在所有 Java 提交中击败了31.43%的用户
>
> 通过测试用例：149 / 149
>
> 时间 O(n)
>
> 空间 O(1)

```java
class Solution {
    public int hammingDistance(int x, int y) {
        int res=0;
        while(x!=0||y!=0){
            // 如果末尾不同
            if((x&1)!=(y&1)){
                res++;
            }
            x>>=1;
            y>>=1;
        }
        return res;
    }
}
```

