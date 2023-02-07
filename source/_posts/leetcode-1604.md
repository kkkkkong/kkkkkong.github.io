---
title: leetcode 1604
tags: 刷题
category: leetcode
abbrlink: 38940
date: 2023-02-07 10:27:38
---

## 题目描述

#### [1604. 警告一小时内使用相同员工卡大于等于三次的人](https://leetcode.cn/problems/alert-using-same-key-card-three-or-more-times-in-a-one-hour-period/)



力扣公司的员工都使用员工卡来开办公室的门。每当一个员工使用一次他的员工卡，安保系统会记录下员工的名字和使用时间。如果一个员工在一小时时间内使用员工卡的次数大于等于三次，这个系统会自动发布一个 **警告** 。

给你字符串数组 `keyName` 和 `keyTime` ，其中 `[keyName[i], keyTime[i]]` 对应一个人的名字和他在 **某一天** 内使用员工卡的时间。

使用时间的格式是 **24小时制** ，形如 **"HH:MM"** ，比方说 `"23:51"` 和 `"09:49"` 。

请你返回去重后的收到系统警告的员工名字，将它们按 **字典序****升序** 排序后返回。

请注意 `"10:00"` - `"11:00"` 视为一个小时时间范围内，而 `"23:51"` - `"00:10"` 不被视为一小时内，因为系统记录的是某一天内的使用情况。

 

**示例 1：**

```
输入：keyName = ["daniel","daniel","daniel","luis","luis","luis","luis"], keyTime = ["10:00","10:40","11:00","09:00","11:00","13:00","15:00"]
输出：["daniel"]
解释："daniel" 在一小时内使用了 3 次员工卡（"10:00"，"10:40"，"11:00"）。
```

## 解题思路

> 这个题题目示例给人的误导性很强，以为是时间是天然有序的，结果不然

1. 哈希表+排序。按部就班，首先使用哈希表存储keyname和对应的set，然后遍历哈希表，找出一个小时内打卡次数>=3的人名，最后将人名按照字典序排序输出（这里的打卡时间是随机的，并非升序，因此需要排序后使用）

> 执行用时：65 ms, 在所有 Java 提交中击败了72.50%的用户
>
> 内存消耗：61.1 MB, 在所有 Java 提交中击败了67.50%的用户
>
> 通过测试用例：77 / 77
>
> 时间 O(NlogN) 根据主要是排序时间
>
> 空间 O(N)，哈希表占用

```java
class Solution {
    public List<String> alertNames(String[] keyName, String[] keyTime) {
        Map<String,List<String>> map=new HashMap();
        List<String> res=new ArrayList();
        int n=keyName.length;
        // 将数组使用哈希表存储
        for(int i=0;i<n;i++){
            List<String> tmp=map.getOrDefault(keyName[i],new ArrayList());
            tmp.add(keyTime[i]);
            map.put(keyName[i],tmp);
        }
        // 遍历哈希表，找出一个小时内打卡次数>=3的人名
        for(Map.Entry<String,List<String>> keyEntry:map.entrySet()){
            String key=keyEntry.getKey();
            List<String> value=keyEntry.getValue();
            // value 需要经过排序
            Collections.sort(value);
            if(isMore3(value)){
                res.add(key);
            }
        }
        // 对结果进行字典序排序
        Collections.sort(res);
        return res;

    }
    public boolean isMore3(List<String> list){
        if(list.size()<3)return false;
        for(int k=0;k<list.size()-2;k++){
            String l=list.get(k);
            String r=list.get(k+2);
            String []lArray=l.split(":");
            String []rArray=r.split(":");
            int i=Integer.parseInt(lArray[0]);
            int j=Integer.parseInt(rArray[0]);
            if(i==j){
                return true;
            }
            else if(j-i==1){
                int ir=Integer.parseInt(lArray[1]);
                int jr=Integer.parseInt(rArray[1]);
                if(jr<=ir){
                    return true;
                }
            }
        }
        return false;
    }
}
```

- 在进行时间的比较时，可以将时间换算为分钟，这样可以减小比较逻辑，对于跨天问题天然有优势