---
title: docker 部署opengrok方便代码阅读
tags:
  - docker
  - opengrok
category: 
- git
- 服务器
abbrlink: 1728
date: 2023-03-18 10:41:18
---

## 背景描述

接上次部署NextCloud，继续把原来服务器上的opengrok部署过来。

opengrok是我们在开发DragonOS的过程中的源码阅读工具，用起来还不错，可以实现函数的跳转，方便快速查找内容。同时还可以查看历史版本。推荐大家使用，让我们一起**RTFSC**(Reading The F**king Source Code!)--- Linus



## OpenGrok介绍

OpenGrok是一种流行的、功能强大的源代码搜索和交叉引用引擎，允许用户在多个存储库和语言中搜索和分析源代码。OpenGrok最初由Sun Microsystems创建，并在后来在CDDL许可下开源。

OpenGrok提供基于Web的界面，允许用户浏览、搜索和分析源代码，包括代码历史、语法高亮和交叉引用等功能。它支持广泛的编程语言和源代码控制系统，包括Git、Mercurial、Subversion、CVS和ClearCase等。

OpenGrok广泛应用于软件开发人员、系统管理员和其他需要处理大型代码库的技术专业人员。它可以帮助用户快速找到和分析代码、识别依赖关系和跟踪时间的变化等用例。OpenGrok还具有高度的可定制性，允许用户配置其行为以适应其特定需求。





## 主要步骤

本文是在CentOS7.6，docker版本是23.0.1

1. 获取最新opengrok镜像：docker pull opengrok/docker

2. 运行opengrok容器

   1. `docker run -d -v <path/to/your/src>:/opengrok/src -e SYNC_PERIOD_MINUTES=30 -p 18080:8080 opengrok/docker:latest`

   2. 参数说明

      1. -d：后台运行
      2. -v：将宿主机的某个目录挂载到容器内的目录，这里是将某个目录挂载到`/opengrok/src`
      3. -p：将宿主机的18080端口映射到容器的8080端口
      4. -e：设置环境变量，SYNC_PERIOD_MINUTES是索引的更新周期，这里设置半小时更新一次

   3. 映射包含以下目录

      1. | 目录             | 描述                                             |
         | ---------------- | ------------------------------------------------ |
         | `/opengrok/etc`  | 存储 Web 应用和索引器的配置                      |
         | `/opengrok/data` | 数据根 - 索引数据                                |
         | `/opengrok/src`  | 源根目录 - 输入数据                              |
         | `/scripts`       | 启动脚本和顶级配置。除非进行调试，否则不要重写。 |

      2. 更多配置可以参考opengrok官网，[Opengrok/docker at Master ·甲骨文/Opengrok (github.com)](https://github.com/oracle/opengrok/tree/master/docker)

3. 进入容器

   1. `docker exec -it <container> bash`通过命令进入容器修改你想要的配置

4. 访问索引的源代码。一旦索引完成，您就可以使用OpenGrok Web界面搜索和查看您的源代码了。

   1. 我这里通过 `ip:18080`访问



> 需要注意的是，你的仓库如果是在github上，你需要在保证仓库是完整的放在 <path/to/your/src>下的，我最开始的时候，只是从windows上复制了文件到linux上，但文件夹里没有.git的信息，所以他没被识别为git仓库，所以建索引的时候会报一些错误，导致无法定时更新索引，我猜是因为他找不到目标地址。



## 参考链接

[Opengrok/docker at Master ·甲骨文/Opengrok (github.com)](https://github.com/oracle/opengrok/tree/master/docker)

[【docker】docker run命令详解_yinni11的博客-CSDN博客](https://blog.csdn.net/yinni11/article/details/81559175)