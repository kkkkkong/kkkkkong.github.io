---
title: centos上使用docker部署hexo
tags:
  - docker
  - linux
  - nginx
category: 服务器
abbrlink: 19452
date: 2023-04-13 10:54:56
---

## 背景

### 需求描述

最近有个需求，服务器上运行三个docker容器，目前分别使用ip:4000、ip:18000、ip:18080来访问，但这样子记得很麻烦，ip本身不规律，很不好记，于是有了域名+端口号的写法 [(kkkkkong.top:4000)](http://kkkkkong.top:4000/)

但是用久了感觉还是不够流畅，写端口号的方式会显得比较low，因此考虑使用nginx反向代理的方式实现优雅的访问

### 预期

> 现有三个服务分别运行在三个docker容器中，其占用的宿主机端口号分别为4000/18000/18080，容器内部端口号都为80

- 采用kkkkkong.top来访问4000端口
- 采用kkkkkong.top/nextcloud 来访问18000端口
- 采用kkkkkong.top/opengrok 来访问18080端口



## 部署

先进行hexo的docker版本的部署

```shell
docker create -it --name=hexo -e HEXO_SERVER_PORT=4000 -e GIT_USER="kong" -e GIT_EMAIL="376634352@qq.com" -v /mnt/blog.kong.site:/app -p 4000:80 bloodstar/hexo
```



### 配置nginx -docker

```shell
docker pull nginx
```

```shell
docker run --name=nginx -d -p 80:80
```

修改nginx的配置，通过命令找到其他容器的ip

```shell
docker inspect containsID
```

<img src="https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20230413191601873.png" alt="image-20230413191601873" style="zoom: 67%;" />

图中红框部分即为我们需要的容器IP地址

### 配置nginx的代理

进入容器内部

```shell
docker exec -it nginx bash
```

找到nginx的配置文件

```shell
vim /etc/nginx/conf.d/default.conf
```

将你需要的信息添加到location中

![image-20230413191958986](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20230413191958986.png)

三个红框分别为匹配规则，匹配路径和匹配的url

- 匹配规则可以参考官方文档 [nginx news](https://nginx.org/)
- 匹配路径是设置跟在域名后的名字
- url是由容器的ip+内部暴露的端口号构成

保存退出，查看配置信息是否可用，看见有successful ，成功（这里如果不留神改错了，会导致重启容器后修改比较麻烦）

```shell
nginx -t
```

![image-20230413192338410](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20230413192338410.png)

退出容器重启就可以优雅的访问了

[虫兑变的博客 (kkkkkong.top)](http://www.kkkkkong.top/)





## 参考链接

[Docker教程：使用Docker容器运行Nginx并实现反向代理 - .NET开发菜鸟 - 博客园 (cnblogs.com)](https://www.cnblogs.com/dotnet261010/p/12596185.html)

[Appotry/docker-hexo： hexo docker 一键部署环境。增加CJK中国环境适配和常用软件，hexo 插件等易用设置。开箱即用。 (github.com)](https://github.com/appotry/docker-hexo)
