---
title: DragonOS前三个进程的创建
tags: DragonOS
category: DragonOS
abbrlink: 13195
date: 2023-03-20 16:43:40
---

## 操作系统加载过程

1. 内核引导
   1. POST
   2. BIOS
   3. MBR：主引导记录
   4. 硬盘启动，grub，选择启用哪个系统
   5. 操作系统：start，手动创建0号进程
2. 加载init，1，2号进程的初始化
3. 系统初始化：加载开机启动程序 init.d
4. 建立终端
5. 用户登录

![img](https://e1sw9jmnjt.feishu.cn/space/api/box/stream/download/asynccode/?code=NGZlMDI2YTA3NmY3NzQ0MjQyYjUyODVkNWI5YWVhMmNfQlRMc21VVXROWjU5NjljRzFPeUxuRTliYjlUMGdOcXBfVG9rZW46WkNVWmIzbHBZb1NiZTV4c1F3dGNyTGFkbm9lXzE2NzkzMDMzMDg6MTY3OTMwNjkwOF9WNA)

## 进程创建的时机

do_fork()

任何进程都是由其他进程创建的。**操作系统通过系统调用fork(),vfork()和clone()函数来完成进程的创建。**

- **这三个系统调用最终都调用了内核函数do_fork()**
- **这三个函数的唯一区别在于随后调用do_fork(0时设置的标志不同。**

## 进程的功能

### 0号进程：IDLE

系统中的第一个进程，PID为0，是init进程和kthread的父进程，



### 1号进程：init



是第一个用户空间的进程，PID为1，是其他用户空间进程的父进程

### 2号进程：kthreadd



是内核空间其他内核进程的父进程，PID为2，

负责内核线程的创建工作



结构树(篇幅原因移除部分子进程)

> [root@VM-8-5-centos ~]# pstree 0 -p
> ?()─┬─kthreadd(2)─┬─ata_sff(257)
>     │             ├─bioset(23)
>     │             ├─bioset(24)
>     │             ├─bioset(25)
>     │             ├─crypto(38)
>     └─systemd(1)─┬─YDLive(1789)─┬─YDService(2493)─┬─sh(2603)─┬─{sh}(2604)
>                  │              │                 │          ├─{sh}(2605)
>                  │              │                 │          ├─{sh}(2609)
>                  │              │                 │          ├─{sh}(2610)
>                  │              │                 │          └─{sh}(15243)
>                  │              │                 ├─{YDService}(2494)
>                  │              │                 ├─{YDService}(2497)
>                  │              ├─{YDLive}(1790)
>                  │              ├─{YDLive}(1796)
>                  │              └─{YDLive}(6911)
>                  ├─abrt-dbus(21662)─┬─{abrt-dbus}(21663)
>                  │                  └─{abrt-dbus}(21665)
>                  ├─acpid(666)
>

## 参考链接



[Linux中的特殊进程：idle进程、init进程、kthreadd进程_JoggingPig的博客-CSDN博客](https://blog.csdn.net/joggingpig/article/details/110239518)



sql语句查询过程

查缓存

解析器：语法、词法

优化器：逻辑优化、物理

执行器：



# 解决由于在中断上下文以外，sched_enqueue时，未关中断导致cpu_queue双重加锁的问题 #201