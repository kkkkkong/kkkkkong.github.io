---
layout: post
title: "Coding based Distributed Data Shufflfling for Low Communication Cost in DataCenter Networks"
author: "kong"
tags: 论文阅读 算力网络 边缘博弈
---

### Coding based Distributed Data Shufflfling for Low Communication Cost in DataCenter Networks

### 基于编码的在数据中心网络中实现低通信成本的分布式数据洗牌



### 背景

分布式机器学习框架在实际使用中依然存在许多挑战与问题，训练数据样本分布和训练数据样本输入顺序是影响机器学习模型收敛效果的重要因素。全局数据重排能够为分布式机器学习提供更接近于单机的机器学习的数据重排效果。然而其会带来巨大的网络开销

为了让全局数据重排能够应用到实际的分布式机器学习中，目前存在一些使用编码的方法来降低其网络资源开销。

但目前的基于编码的网络传输优化方法都假设存在一台拥有无限存储能力的机器
存储了整个训练样本集中的所有样本，并且由这台机器负责所有样本数据的发送工作，
而其他机器不具备发送数据的功能。

### 系统模型和问题制定



![image-20220724195221509](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220724195221509.png)

基于上述模型优化



![image-20220724195252224](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220724195252224.png)

![image-20220724195300494](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220724195300494.png)

![image-20220724195308972](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220724195308972.png)

![image-20220724195316646](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220724195316646.png)

![image-20220724195326229](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220724195326229.png)

![image-20220724195336124](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220724195336124.png)





### 方法制定

Distributed Coded Shuffling（DCS算法）

![image-20220724195407995](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20220724195407995.png)

