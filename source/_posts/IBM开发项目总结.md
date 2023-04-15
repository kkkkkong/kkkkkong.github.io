---
title: IBM开发项目总结
tags:
  - Python
  - 开发
category: 学习
abbrlink: 59923
date: 2023-04-15 22:50:44
---

# IBM后端开发项目总结

>  项目名称：IBM的资源部署后端开发
>
> 单位：IBM中国
>
> 编程语言：Python
>
> web框架：CherryPy
>
> 开发时间：2022.7-2022.11

------

> IBM项目经历了大概4个月的开发，截止半个月前（11.10）已经结束，上周开了最后一次项目总结会议，也算是给这几个月的开发画了一个圆满的句号

## 编程方面

1. 对于python的web框架CherryPy有了一定的了解，可以部署并使用
2. 对于所谓的三层架构的规范更加熟悉（DAO、Service、Controller）
   1. DAO只负责对于数据库的增删改查，将基础的操作抽象出函数提供给service使用
   2. service负责接受controller的调用，负责主要的业务逻辑的编写，一般不需要做参数检查；在编写业务逻辑时使用DAO提供的函数
   3. controller层主要是接受HTTP请求，对参数进行校验，然后传参给service并接收其结果返回给前端
3. model模块主要将数据库表与类一一对应，类中设置相应的属性，目的是DAO调用的时候更加规范清晰
4. 抽象工具类的使用，这个是以前没有涉及到太多的，很多会重复调用的代码，这时将一些工具类单独抽象出来，如`log_config.py、locks_handler.py、db_connection.py、thread_pool.py`等
5. 代码复用，将公共方法抽象出来，减少代码冗余，如`base_dao.py`
6. 将常量统一管理起来，方便修改 `constant.py`

## 工程方面：

1. 在做数据库设计的时候，充分考虑表与表之间的关系，尽量减少返工

2. docker的使用更加熟练了，项目本身是在docker上跑的数据库、前后端的服务也是docker上跑的

   ![image-20230415225410492](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20230415225410492.png)

   1. 

3. 需要继续重视log的使用，在进行越来越大的工程开发时，往往进行debug的机会不大，所以要充分运用log，通过log查bug

4. 写代码的时候，问清楚需求，搞清楚具体点的逻辑，按部就班的进行

5. RESTful API的设计使用更加熟练了，毕竟写了超多API

6. apidoc文档创建工具的使用熟悉起来了

7. postman的使用熟练了

8. git的使用逐渐熟练

## 整体

算是第一个参与的人数较多的真实项目，虽然项目整体不大，所做工作不复杂，但总结了一下还是有不少收获的。而且通过项目认识了几个好朋友，收获颇丰

> 看了一下git的代码量统计，还是写了一些代码的（虽然有一些是API的文档，hh）

![image-20230415225332248](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20230415225332248.png)

## 参考链接

- 统计git代码参考链接：

https://www.cnblogs.com/0616--ataozhijia/p/8081329.html