---
title: leetcode 146
tags: 刷题
category: leetcode
abbrlink: 16234
date: 2023-03-13 10:24:44
---

## 题目描述

#### [146. LRU 缓存](https://leetcode.cn/problems/lru-cache/)



请你设计并实现一个满足 [LRU (最近最少使用) 缓存](https://baike.baidu.com/item/LRU) 约束的数据结构。

实现 `LRUCache` 类：

- `LRUCache(int capacity)` 以 **正整数** 作为容量 `capacity` 初始化 LRU 缓存
- `int get(int key)` 如果关键字 `key` 存在于缓存中，则返回关键字的值，否则返回 `-1` 。
- `void put(int key, int value)` 如果关键字 `key` 已经存在，则变更其数据值 `value` ；如果不存在，则向缓存中插入该组 `key-value` 。如果插入操作导致关键字数量超过 `capacity` ，则应该 **逐出** 最久未使用的关键字。

函数 `get` 和 `put` 必须以 `O(1)` 的平均时间复杂度运行。

 

**示例：**

```
输入
["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
输出
[null, null, null, 1, null, -1, null, -1, 3, 4]

解释
LRUCache lRUCache = new LRUCache(2);
lRUCache.put(1, 1); // 缓存是 {1=1}
lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
lRUCache.get(1);    // 返回 1
lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
lRUCache.get(2);    // 返回 -1 (未找到)
lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
lRUCache.get(1);    // 返回 -1 (未找到)
lRUCache.get(3);    // 返回 3
lRUCache.get(4);    // 返回 4
```



## 解题思路

1. LinkedHashMap实现

> 执行用时：52 ms, 在所有 Java 提交中击败了30.61%的用户
>
> 内存消耗：117.7 MB, 在所有 Java 提交中击败了10.73%的用户
>
> 通过测试用例：22 / 22
>
> 时间 O(1)
>
> 空间 O(N)

```java
class LRUCache {
    LinkedHashMap<Integer,Integer> map=new LinkedHashMap();
    int cap;
    public LRUCache(int capacity) {
        this.cap=capacity;
    }
    
    public int get(int key) {
        int ans=map.getOrDefault(key,-1);
        if(ans !=-1){
            makeRecently(key);
        }
        return ans;

    }
    
    public void put(int key, int value) {
        if(map.containsKey(key)){
            map.remove(key);
            map.put(key,value); 
            return ;
        }
        while(map.size()>=cap){
            int firstKey=map.keySet().iterator().next();
            map.remove(firstKey);
        }
        map.put(key,value);
    }
    public void makeRecently(int key){
        int val=map.get(key);
        map.remove(key);
        map.put(key,val);
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache obj = new LRUCache(capacity);
 * int param_1 = obj.get(key);
 * obj.put(key,value);
 */
```

2. 自实现双向链表+哈希表：费了老鼻子劲，主要是那几个抽出来操作map和list的函数，需要想清楚他们使用的场景

> 执行用时：48 ms, 在所有 Java 提交中击败了43.19%的用户
>
> 内存消耗：116.2 MB, 在所有 Java 提交中击败了17.51%的用户
>
> 通过测试用例：22 / 22
>
> 时间 O(1)
>
> 空间 O(N)

```
class Node{
    int key,val;
    Node prev,next;
    public Node(int key,int val){
        this.key=key;
        this.val=val;
    }
}
class DoubleList{
    Node head,tail;
    int size;
    public DoubleList(){
        head =new Node(0,0);
        tail =new Node(0,0);
        head.next=tail;
        tail.prev=head;
        size=0;
    }
    public void addNode(Node node){
        node.prev=tail.prev;
        node.next=tail;

        tail.prev.next=node;
        tail.prev=node;

        size++;
    }
    public void removeNode(Node node){
        node.prev.next=node.next;
        node.next.prev=node.prev;
        size--;
    }
    public Node removeFirstNode(){
        if(head.next==tail){
            return null;
        }
        Node first =head.next;
        this.removeNode(first);
        return first;
    }
    public int size(){
        return size;
    }
}

class LRUCache {
    int cap;
    DoubleList list=new DoubleList();
    HashMap<Integer,Node> map=new HashMap();
    public LRUCache(int capacity) {
        this.cap=capacity;
    }
    
    public int get(int key) {
        if(!map.containsKey(key)){
            return -1;
        }
        makeRecently(key);
        return map.get(key).val;
    }
    
    public void put(int key, int value) {
        if(map.containsKey(key)){
            deleteKey(key);
            addRecently(key,value);
            return;
        }
        if(list.size()>=cap){
            removeLeastRecently();
        }
        addRecently(key,value);
    }
    public void makeRecently(int key){
        
        Node node=map.get(key);
        list.removeNode(node);
        list.addNode(node);
    }
    public void deleteKey(int key){
        Node node=map.get(key);
        list.removeNode(node);
        map.remove(key);

    }
    public void removeLeastRecently(){
        Node node=list.removeFirstNode();
        map.remove(node.key);

    }
    // put的处理，将普通元素提到最近使用
    public void addRecently(int key,int value){
        Node node =new Node(key,value);
        list.addNode(node);
        map.put(key,node);
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache obj = new LRUCache(capacity);
 * int param_1 = obj.get(key);
 * obj.put(key,value);
 */
```

