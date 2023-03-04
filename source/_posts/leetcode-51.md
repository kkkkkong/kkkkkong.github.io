---
title: leetcode 51
tags: 刷题
category: leetcode
abbrlink: 27041
date: 2023-03-02 16:37:21
---

## 题目描述

#### [51. N 皇后](https://leetcode.cn/problems/n-queens/)



按照国际象棋的规则，皇后可以攻击与之处在同一行或同一列或同一斜线上的棋子。

**n 皇后问题** 研究的是如何将 `n` 个皇后放置在 `n×n` 的棋盘上，并且使皇后彼此之间不能相互攻击。

给你一个整数 `n` ，返回所有不同的 **n 皇后问题** 的解决方案。

每一种解法包含一个不同的 **n 皇后问题** 的棋子放置方案，该方案中 `'Q'` 和 `'.'` 分别代表了皇后和空位。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/queens.jpg)

```
输入：n = 4
输出：[[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
解释：如上图所示，4 皇后问题存在两个不同的解法。
```



## 解题思路

1. 回溯+哈希：做前序状态记录比较麻烦，导致效率不高

> 执行用时：9 ms, 在所有 Java 提交中击败了10.60%的用户
>
> 内存消耗：41.9 MB, 在所有 Java 提交中击败了34.87%的用户
>
> 通过测试用例：9 / 9
>
> 时间 O(NLogN)
>
> 空间 O(N)

```java
class Solution {
    List<List<String>> ans=new ArrayList<List<String>>();
    public List<List<String>> solveNQueens(int n) {
        backTrack(n,new ArrayList<String>(),new HashMap<Integer,Integer>());
        return ans;
    }
    public void backTrack(int n,List<String> list,HashMap<Integer,Integer> used){
        if(list.size()==n){
            ans.add(new ArrayList(list));
            return ;
        }
        for(int i=0;i<n;i++){
            if(used.containsValue(i))continue;
            int x=used.getOrDefault(used.size()-1,-1);
            if(x!=-1&&!isTrue(used,i,n)){
                continue;
            }
            char []c=new char[n];
            Arrays.fill(c,'.');
            c[i]='Q';
            used.put(used.size(),i);
            list.add(String.valueOf(c));
            backTrack(n,list,used);
            list.remove(list.size()-1);
            used.remove(used.size()-1);
        }
    }
    public boolean isTrue(HashMap<Integer,Integer> used,int i,int n){
        int j=used.size();
        for(int t=0;t<j;t++){
            if(used.getOrDefault(t,-1)==i){
                return false;
            }
        }
        for(int t=1;t+i<n&&j-t>=0;t++){
            if(used.getOrDefault(j-t,-1)==i+t){
                return false;
            }
        }
        for(int t=1;t<=j&&t<=i;t++){
            if(used.getOrDefault(j-t,-1)==i-t){
                return false;
            }
        }
        return true;
    }
}
```

