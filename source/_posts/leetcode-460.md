---
title: leetcode 460
tags: 刷题
category: leetcode
abbrlink: 23803
date: 2023-03-14 10:48:40
---



## 题目描述

#### [460. LFU 缓存](https://leetcode.cn/problems/lfu-cache/)



请你为 [最不经常使用（LFU）](https://baike.baidu.com/item/缓存算法)缓存算法设计并实现数据结构。

实现 `LFUCache` 类：

- `LFUCache(int capacity)` - 用数据结构的容量 `capacity` 初始化对象
- `int get(int key)` - 如果键 `key` 存在于缓存中，则获取键的值，否则返回 `-1` 。
- `void put(int key, int value)` - 如果键 `key` 已存在，则变更其值；如果键不存在，请插入键值对。当缓存达到其容量 `capacity` 时，则应该在插入新项之前，移除最不经常使用的项。在此问题中，当存在平局（即两个或更多个键具有相同使用频率）时，应该去除 **最近最久未使用** 的键。

为了确定最不常使用的键，可以为缓存中的每个键维护一个 **使用计数器** 。使用计数最小的键是最久未使用的键。

当一个键首次插入到缓存中时，它的使用计数器被设置为 `1` (由于 put 操作)。对缓存中的键执行 `get` 或 `put` 操作，使用计数器的值将会递增。

函数 `get` 和 `put` 必须以 `O(1)` 的平均时间复杂度运行。

 

**示例：**

```
输入：
["LFUCache", "put", "put", "get", "put", "get", "get", "put", "get", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [3], [4, 4], [1], [3], [4]]
输出：
[null, null, null, 1, null, -1, 3, null, -1, 3, 4]

解释：
// cnt(x) = 键 x 的使用计数
// cache=[] 将显示最后一次使用的顺序（最左边的元素是最近的）
LFUCache lfu = new LFUCache(2);
lfu.put(1, 1);   // cache=[1,_], cnt(1)=1
lfu.put(2, 2);   // cache=[2,1], cnt(2)=1, cnt(1)=1
lfu.get(1);      // 返回 1
                 // cache=[1,2], cnt(2)=1, cnt(1)=2
lfu.put(3, 3);   // 去除键 2 ，因为 cnt(2)=1 ，使用计数最小
                 // cache=[3,1], cnt(3)=1, cnt(1)=2
lfu.get(2);      // 返回 -1（未找到）
lfu.get(3);      // 返回 3
                 // cache=[3,1], cnt(3)=2, cnt(1)=2
lfu.put(4, 4);   // 去除键 1 ，1 和 3 的 cnt 相同，但 1 最久未使用
                 // cache=[4,3], cnt(4)=1, cnt(3)=2
lfu.get(1);      // 返回 -1（未找到）
lfu.get(3);      // 返回 3
                 // cache=[3,4], cnt(4)=1, cnt(3)=3
lfu.get(4);      // 返回 4
                 // cache=[3,4], cnt(4)=2, cnt(3)=3
```

## 解题思路

1. 哈希表+linkedHashSet：通过三个结构来存储当前情况，
   1. key2Val 用来存放key对应的value
   2. key2Freq 用来存放key出现的频率
   3. freq2keys 用来存放频率对应的key的列表。因为在频率相同的情况下，需要抛弃最久未使用的，因此需要用有序的结构存储，而且需要O(1)的时间复杂度，因此LinkedHashSet最合适。
2. 整体思路不难，但很多细节，因为要操作很多数据表，CPU快给我干烧了

> 执行用时：69 ms, 在所有 Java 提交中击败了41.72%的用户
>
> 内存消耗：122.7 MB, 在所有 Java 提交中击败了45.30%的用户
>
> 通过测试用例：25 / 25
>
> 时间 O(n)
>
> 空间 O(n)

```java
class LFUCache {
    HashMap <Integer,Integer> key2Val=new HashMap();
    HashMap<Integer,Integer> key2Freq=new HashMap();
    HashMap<Integer,LinkedHashSet<Integer>> freq2keys=new HashMap();
    int minCap=Integer.MAX_VALUE;
    int cap=0;

    public LFUCache(int capacity) {
        cap=capacity;
    }
    
    public int get(int key) {
        if(key2Val.containsKey(key)){
            increaseFreq(key);
            return key2Val.get(key); 
        }
        else{
            return -1;
        }
    }
    
    public void put(int key, int value) {
        // 如果已有key元素，那么修改
        if(key2Val.containsKey(key)){
            key2Val.put(key,value);
            increaseFreq(key);
            return ;
        }
        // 如果没有，那么增加
        // 如果超出容量，需要去除lr的键
        if(key2Val.size()>=cap){
            removeMinFreq();
        }
        // 增加
        key2Val.put(key,value);
        key2Freq.put(key,1);
        freq2keys.putIfAbsent(1,new LinkedHashSet<Integer>());
        freq2keys.get(1).add(key);
        // LinkedHashSet set=freq2keys.getOrDefault(1,new LinkedHashSet<Integer>());
        // set.add(key);
        // freq2keys.put(1,set);
        minCap=1;
    }
    public void removeMinFreq(){
        LinkedHashSet<Integer> set= freq2keys.get(minCap);
        int deletedKey = set.iterator().next();
        set.remove(deletedKey);
        if(set.isEmpty()){
            freq2keys.remove(minCap);
        }

        key2Val.remove(deletedKey);
        key2Freq.remove(deletedKey);
    }
    public void increaseFreq(int key){
        int freq=key2Freq.get(key);

        LinkedHashSet set=freq2keys.get(freq);
        // 从set中移除掉当前freq中的队列中的key
        set.remove(key);
        if(set.isEmpty()){
            freq2keys.remove(freq);
        }
        // 将key加入到freq+1的队列中去
        freq2keys.putIfAbsent(freq+1,new LinkedHashSet<Integer>());
        freq2keys.get(freq+1).add(key);
        // 更新key2Freq
        key2Freq.put(key,freq+1);
        if(minCap==freq){
            if(set.isEmpty()){
                minCap++;
            }
        }
    }

}

/**
 * Your LFUCache object will be instantiated and called as such:
 * LFUCache obj = new LFUCache(capacity);
 * int param_1 = obj.get(key);
 * obj.put(key,value);
 */
```

