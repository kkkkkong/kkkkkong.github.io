---
title: leetcode 1233
tags: 刷题
category: leetcode
abbrlink: 27420
date: 2023-02-08 16:40:58
---

## 题目描述

#### [1233. 删除子文件夹](https://leetcode.cn/problems/remove-sub-folders-from-the-filesystem/)



你是一位系统管理员，手里有一份文件夹列表 `folder`，你的任务是要删除该列表中的所有 **子文件夹**，并以 **任意顺序** 返回剩下的文件夹。

如果文件夹 `folder[i]` 位于另一个文件夹 `folder[j]` 下，那么 `folder[i]` 就是 `folder[j]` 的 **子文件夹** 。

文件夹的「路径」是由一个或多个按以下格式串联形成的字符串：'/' 后跟一个或者多个小写英文字母。

- 例如，`"/leetcode"` 和 `"/leetcode/problems"` 都是有效的路径，而空字符串和 `"/"` 不是。

 

**示例 1：**

```
输入：folder = ["/a","/a/b","/c/d","/c/d/e","/c/f"]
输出：["/a","/c/d","/c/f"]
解释："/a/b/" 是 "/a" 的子文件夹，而 "/c/d/e" 是 "/c/d" 的子文件夹。
```

## 解题思路

1. 暴力求解

> 超时
>
> 时间 O(N*N)
>
> 空间 O(N)

```java
class Solution {
    public List<String> removeSubfolders(String[] folder) {
        List<String> ans=new ArrayList();
        for(int i=0;i<folder.length;i++){
            boolean isChild=false;
            for(int j=0;j<folder.length;j++){
                if(i!=j){
                    if(isChildFolder(folder[i],folder[j])){
                        isChild=true;
                    }
                }
            }
            if(!isChild){
                ans.add(folder[i]);
            }
        }
        return ans;
    }
    // 判断a是否是b的子文件夹
    public boolean isChildFolder(String a,String b){
        if(a.length()<=b.length())return false;
        return a.startsWith(b)&&a.charAt(b.length())=='/';
    }
}
```

2. 排序+规律，核心的规律为：在将字符串数组按照字典序排序之后，父子文件夹是相邻的，并且父在前，子在后。

> 执行用时：43 ms, 在所有 Java 提交中击败了82.84%的用户
>
> 内存消耗：51.5 MB, 在所有 Java 提交中击败了30.77%的用户
>
> 通过测试用例：32 / 32
>
> 时间 O(NLogN)，排序算法复杂度
>
> 空间 O(N)，排序算法

```java
class Solution {
    public List<String> removeSubfolders(String[] folder) {
        List<String> ans=new ArrayList();
        Arrays.sort(folder);
        String tmp=folder[0];
        ans.add(tmp);
        for(int i=1;i<folder.length;i++){
            if(!isChildFolder(folder[i],tmp)){
                tmp=folder[i];
                ans.add(tmp);
            }
        }
        return ans;
    }
    // 判断a是否是b的子文件夹
    public boolean isChildFolder(String a,String b){
        if(a.length()<=b.length())return false;
        return a.startsWith(b)&&a.charAt(b.length())=='/';
    }
}
```