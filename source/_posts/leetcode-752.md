---
title: leetcode 752
tags: 刷题
category: leetcode
abbrlink: 28042
date: 2023-03-07 11:35:58
---

## 题目描述

#### [752. 打开转盘锁](https://leetcode.cn/problems/open-the-lock/)



你有一个带有四个圆形拨轮的转盘锁。每个拨轮都有10个数字： `'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'` 。每个拨轮可以自由旋转：例如把 `'9'` 变为 `'0'`，`'0'` 变为 `'9'` 。每次旋转都只能旋转一个拨轮的一位数字。

锁的初始数字为 `'0000'` ，一个代表四个拨轮的数字的字符串。

列表 `deadends` 包含了一组死亡数字，一旦拨轮的数字和列表里的任何一个元素相同，这个锁将会被永久锁定，无法再被旋转。

字符串 `target` 代表可以解锁的数字，你需要给出解锁需要的最小旋转次数，如果无论如何不能解锁，返回 `-1` 。

 

**示例 1:**

```
输入：deadends = ["0201","0101","0102","1212","2002"], target = "0202"
输出：6
解释：
可能的移动序列为 "0000" -> "1000" -> "1100" -> "1200" -> "1201" -> "1202" -> "0202"。
注意 "0000" -> "0001" -> "0002" -> "0102" -> "0202" 这样的序列是不能解锁的，
因为当拨动到 "0102" 时这个锁就会被锁定。
```



## 解题思路

1. BFS

> 执行用时：86 ms, 在所有 Java 提交中击败了31.88%的用户
>
> 内存消耗：46.8 MB, 在所有 Java 提交中击败了58.50%的用户
>
> 通过测试用例：48 / 48
>
> 时间 O(N)
>
> 空间 O(N)



```java
class Solution {
    public String up(String s,int i){
        char []charArray=s.toCharArray();
        if(charArray[i]=='9'){
            charArray[i]='0';
        }
        else{
            charArray[i]+=1;
        }
        return new String(charArray);
    }
    public String down(String s,int i){
        char []charArray=s.toCharArray();
        if(charArray[i]=='0'){
            charArray[i]='9';
        }
        else{
            charArray[i]-=1;
        }
        return new String(charArray);

    }    
    public int openLock(String[] deadends, String target) {
        Queue<String> queue=new LinkedList();
        Set<String> set=new HashSet();
        Set<String> visited=new HashSet();
        // for(String s:deadends)set.add(s);
        Collections.addAll(set,deadends);
        queue.offer("0000");
        visited.add("0000");
        int ans=0;
        while(!queue.isEmpty()){
            int len=queue.size();
            for(int i=0;i<len;i++){
                String val=queue.poll();
                if(set.contains(val))continue;
                if(val.equals(target)){
                    return ans;
                }
                for(int j=0;j<4;j++){
                    String up=up(val,j);
                    String down=down(val,j);
                    if(!visited.contains(up)){
                        queue.offer(up);
                        visited.add(up);
                    }
                    if(!visited.contains(down)){
                        queue.offer(down);
                        visited.add(down);
                    }

                }
            }
            ans++;
        }
        return -1;
    }
}
```

