---
title: leetcode 225
tags: 刷题
category: leetcode
abbrlink: 40665
date: 2023-03-14 11:47:44
---

## 题目描述

#### [225. 用队列实现栈](https://leetcode.cn/problems/implement-stack-using-queues/)



请你仅使用两个队列实现一个后入先出（LIFO）的栈，并支持普通栈的全部四种操作（`push`、`top`、`pop` 和 `empty`）。

实现 `MyStack` 类：

- `void push(int x)` 将元素 x 压入栈顶。
- `int pop()` 移除并返回栈顶元素。
- `int top()` 返回栈顶元素。
- `boolean empty()` 如果栈是空的，返回 `true` ；否则，返回 `false` 。

 

**注意：**

- 你只能使用队列的基本操作 —— 也就是 `push to back`、`peek/pop from front`、`size` 和 `is empty` 这些操作。
- 你所使用的语言也许不支持队列。 你可以使用 list （列表）或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。

 

**示例：**

```
输入：
["MyStack", "push", "push", "top", "pop", "empty"]
[[], [1], [2], [], [], []]
输出：
[null, null, null, 2, 2, false]

解释：
MyStack myStack = new MyStack();
myStack.push(1);
myStack.push(2);
myStack.top(); // 返回 2
myStack.pop(); // 返回 2
myStack.empty(); // 返回 False
```

## 解题思路

1. 一个队列模拟：N个长度的队列，出队n-1次，下一次出队的元素就是我们要的。主要主要pop的时候对于top元素的保存

> 执行用时：0 ms, 在所有 Java 提交中击败了100.00%的用户
>
> 内存消耗：39.2 MB, 在所有 Java 提交中击败了67.93%的用户
>
> 通过测试用例：17 / 17
>
> 时间 n
>
> 空间 n

```java
class MyStack {
    ArrayList<Integer> list;
    int top;
    public MyStack() {
        list=new ArrayList();
        top=0;

    }
    
    public void push(int x) {
        list.add(x);
        top=x;

    }
    
    public int pop() {
        int size=list.size();
        while(size>1){
            top=list.get(0);
            list.add(list.remove(0));
            size--;
        }
        int tmp=list.remove(0);
        return tmp;

    }
    
    public int top() {
        return top;

    }
    
    public boolean empty() {
        return list.isEmpty();
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * MyStack obj = new MyStack();
 * obj.push(x);
 * int param_2 = obj.pop();
 * int param_3 = obj.top();
 * boolean param_4 = obj.empty();
 */
```

