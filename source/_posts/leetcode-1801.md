---
title: leetcode 1801
tags: 刷题
abbrlink: 22717
date: 2023-01-02 20:01:58
---

## 题目描述

给你一个二维整数数组 orders ，其中每个 orders[i] = [pricei, amounti, orderTypei] 表示有 amounti 笔类型为 orderTypei 、价格为 pricei 的订单。

订单类型 orderTypei 可以分为两种：

0 表示这是一批采购订单 buy
1 表示这是一批销售订单 sell
注意，orders[i] 表示一批共计 amounti 笔的独立订单，这些订单的价格和类型相同。对于所有有效的 i ，由 orders[i] 表示的所有订单提交时间均早于 orders[i+1] 表示的所有订单。

存在由未执行订单组成的 积压订单 。积压订单最初是空的。提交订单时，会发生以下情况：

如果该订单是一笔采购订单 buy ，则可以查看积压订单中价格 最低 的销售订单 sell 。如果该销售订单 sell 的价格 低于或等于 当前采购订单 buy 的价格，则匹配并执行这两笔订单，并将销售订单 sell 从积压订单中删除。否则，采购订单 buy 将会添加到积压订单中。
反之亦然，如果该订单是一笔销售订单 sell ，则可以查看积压订单中价格 最高 的采购订单 buy 。如果该采购订单 buy 的价格 高于或等于 当前销售订单 sell 的价格，则匹配并执行这两笔订单，并将采购订单 buy 从积压订单中删除。否则，销售订单 sell 将会添加到积压订单中。
输入所有订单后，返回积压订单中的 订单总数 。由于数字可能很大，所以需要返回对 109 + 7 取余的结果。

[1801. 积压订单中的订单总数 - 力扣（LeetCode）](https://leetcode.cn/problems/number-of-orders-in-the-backlog/)

## 解题思路

> 采用优先级队列解决，但由于对于这里不太熟，所以参考了解析
>
> 按照题目描述的思路，主要是捋顺了比较的逻辑，加上清楚优先级队列的使用；这题可以做出来

```java
class Solution {
    public int getNumberOfBacklogOrders(int[][] orders) { 
        PriorityQueue<int[]> buyOrders=new PriorityQueue<>((a,b)->b[0]-a[0]);
        PriorityQueue<int[]> sellOrders=new PriorityQueue<>((a,b)->a[0]-b[0]);
        for(int [] order:orders){
            int price=order[0],amount=order[1],orderType=order[2];
            // 采购订单
            if(orderType==0){
                while(amount>0&&!sellOrders.isEmpty()&&sellOrders.peek()[0]<=price){
                    // 取出销售订单中的最低销售订单
                    int[] sellOrder=sellOrders.poll();
                    int dellAmount=amount>sellOrder[1]?sellOrder[1]:amount;
                    amount-=dellAmount;
                    sellOrder[1]-=dellAmount;
                    // 如果最低销售订单未耗尽
                    if(sellOrder[1]>0){
                        sellOrders.offer(sellOrder);
                    }
                }
                // 如果耗尽了所有的低价订单，仍有部分未采购，则加入购买的积压订单
                if(amount>0){
                    buyOrders.offer(new int[]{price,amount});
                }
            }
            // 销售订单
            else{
                while(amount>0&&!buyOrders.isEmpty()&&buyOrders.peek()[0]>=price){
                    // 取出采购订单中的最高订单
                    int[] buyOrder=buyOrders.poll();
                    int dellAmount=amount>buyOrder[1]?buyOrder[1]:amount;
                    amount-=dellAmount;
                    buyOrder[1]-=dellAmount;
                    if(buyOrder[1]>0){
                        buyOrders.offer(buyOrder);
                    }
                }
                if(amount>0){
                    sellOrders.offer(new int[]{price,amount});
                }

            }
        }
        int res=0;
        for(PriorityQueue<int[]> pq: Arrays.asList(buyOrders,sellOrders)){
            while(!pq.isEmpty()){
                int[] order=pq.poll();
                res=(res+order[1])%1000000007;
            }
        }
        return res;
    }
}
```

