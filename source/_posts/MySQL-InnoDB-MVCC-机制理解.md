---
title: MySQL InnoDB MVCC 机制理解
tags:
  - MySQL
  - MVCC
category: MySQL
abbrlink: 37067
date: 2023-04-18 11:33:33
---

## MySQL InnoDB MVCC 机制理解

### 1. 什么是MVCC

MVCC，即**Multi-Version Concurrency Control （多版本并发控制）**。它是一种并发控制的方法，一般在数据库管理系统中，实现对数据库的并发访问，在编程语言中实现事务内存。

mysql数据库隔离级别读**已提交、可重复读** 都是基于MVCC实现的，相对于加锁简单粗暴的方式，它用更好的方式去处理读写冲突，能有效提高数据库并发性能。



### 2. MVCC实现关键知识点

MVCC是通过UndoLog+ReadView实现

#### 2.1 Undolog

Undo log 主要用于`记录`数据被`修改之前`的日志，在表信息修改之前先会把数据拷贝到`undo log`里。
当`事务`进行`回滚时`可以通过undo log 里的日志进行`数据还原`。

**undo log主要分为两种：**

- insert undo log
  代表事务在insert新记录时产生的undo log , 只在事务回滚时需要，并且在事务提交后可以被立即丢弃
- update undo log（主要）
  事务在进行update或delete时产生的undo log ; 不仅在事务回滚时需要，在快照读时也需要；
  所以不能随便删除，只有在快速读或事务回滚不涉及该日志时，对应的日志才会被purge线程统一清除

#### 2.2 Readview

##### readview中的属性

1. `trx_ids`: 当前系统活跃(`未提交`)事务版本号集合。
2. `low_limit_id`: 创建当前read view 时“当前系统`最大事务版本号`+1”。
3. `up_limit_id(min_limit_id)`: 创建当前read view 时“系统正处于活跃事务`最小版本号`”
4. `creator_trx_id`: 创建当前read view的事务版本号；

##### readview匹配规则

1. 如果数据事务ID `trx_id < min_limit_id`，表明生成该版本的事务在生成Read View前，已经提交(因为事务ID是递增的)，所以该版本可以被当前事务访问。
2. 如果`trx_id>= max_limit_id`，表明生成该版本的事务在生成ReadView后才生成，所以该版本不可以被当前事务访问。
3. 如果 `min_limit_id =<trx_id< max_limit_id`,需要分3种情况讨论
4. > - 如果`m_ids`包含`trx_id`,则代表Read View生成时刻，这个事务还未提交，但是如果数据的`trx_id`等于`creator_trx_id`的话，表明数据是自己生成的，因此是**可见**的。
   > - 如果`m_ids`包含`trx_id`，并且`trx_id`不等于`creator_trx_id`，则Read   View生成时，事务未提交，并且不是自己生产的，所以当前事务也是**看不见**的；
   > - 如果`m_ids`不包含`trx_id`，则说明你这个事务在Read View生成之前就已经提交了，修改的结果，当前事务是能看见的。

#### 2.3 主要过程

1. 获取事务自己的版本号，即事务ID
2. 获取Read View
3. 查询得到的数据，然后Read View中的事务版本号进行比较。
4. 如果不符合Read View的可见性规则， 即就需要Undo log中历史快照;
5. 最后返回符合规则的数据

#### 2.4 MVCC在RC和RR实现上的区别



在RC下，事务中每执行一条sql都会有**新的readview**，所以会出现不可重复读的问题，但RR下在同一个事务中**使用同一个readview对象**



### 3. 参考链接

[看一遍就理解:MVCC原理详解 - 掘金](https://juejin.cn/post/7016165148020703246#heading-22)