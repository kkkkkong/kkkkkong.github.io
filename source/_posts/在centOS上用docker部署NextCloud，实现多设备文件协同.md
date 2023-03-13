---
title: 在CentOS上用docker部署NextCloud，实现多设备文件协同
tags: NextCloud
category: 服务器
abbrlink: 28348
date: 2023-03-13 16:35:43
---

## 需求描述

最近上一个服务器到期了，上面部署着以前的NextCloud，又新租了一个服务器，准备重新配置，顺便记录下



## NextCloud介绍

NextCloud是我以前在寻找OneDrive的平替版找到的一块软件，我平时在实验室、宿舍以及笔记本上要看论文或者写一些文档，当时的文件同步给我造成了很大的困扰，在寻找解决方案时找到了这款软件，用起来比较舒服，传输速度取决于你的服务器带宽，一般来说是够用的，维基百科中对他的介绍是这样的：

> **Nextcloud**是一套用于创建[网络硬盘](https://zh.wikipedia.org/wiki/网络硬盘)的[客户端－服务器软件](https://zh.wikipedia.org/wiki/主從式架構)。其功能与[Dropbox](https://zh.wikipedia.org/wiki/Dropbox)相近，但Nextcloud是[自由及开放源代码软件](https://zh.wikipedia.org/wiki/自由及开放源代码软件)，每个人都可以在私人服务器上安装并执行它。
>
> 与Dropbox等专有服务相比，Nextcloud的开放架构让用户可以利用应用程序的方式在服务器上新增额外的功能，并让用户可以完全掌控自己的资料。
>
> [Nextcloud - 维基百科，自由的百科全书 (wikipedia.org)](https://zh.wikipedia.org/zh-cn/Nextcloud)





## 主要步骤

本文是在CentOS7.6，docker版本是23.0.1

1. 安装docker，具体的细节参照菜鸟教程：[CentOS Docker 安装 | 菜鸟教程 (runoob.com)](https://www.runoob.com/docker/centos-docker-install.html)

2. 获取最新版NextCloud镜像

   1. docker search一下现有与NextCloud相关的内容，docker search nextcloud，发现第一个就是，而且是官方高星的

      1. <img src="https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20230313164208285.png" alt="image-20230313164208285" style="zoom: 50%;" />

   2. docker pull nextcloud 获取最新版本

   3. 创建容器

      1. ```
         docker run -d -p 8080:80 -v /home/nextcloud:/var/www/html --name nextcloud nextcloud
         ```

      2. -d #容器后台运行

         –name nextcloud #容器名

         -v /data/nextcloud:/var/www/html #将宿主机的目录/data/nextcloud挂载到容器的/var/www/html

         -p 18000:80 #将宿主机的端口（此处以18000为例）映射到容器的80端口

3. web 登录

   1. 第一次使用nextcloud要通过Web端进行配置，记得开启云服务器上对应的端口，这里是18000端口，按照自己的需求配置
      1. <img src="https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20230313164518805.png" alt="image-20230313164518805" style="zoom: 50%;" />
   2. 访问ip:18000
      1. 此处需要设置密码和选择相应的数据库，我这里是个人使用，所以就直接用了SQLLite，如果是多人协作，官方推荐使用mysql等数据库（我这里忘记截图了，就偷个懒）

4. 客户端下载

   1. 访问官方[Install - Nextcloud](https://nextcloud.com/install/)下载对应版本资源，安装然后配置链接即可
   2. Windows上安装好之后是这个样子，登录到你的账号，注意这里填了地址之后会默认按照https方式链接，我这里会报错，改成http即可
   3. <img src="https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20230313164953262.png" alt="image-20230313164953262" style="zoom:50%;" />