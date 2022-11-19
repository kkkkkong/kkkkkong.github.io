---
layout: post
title: "push项目遇到timeout"
author: "kong"
tags: github
---



### 今天push项目遇到timeout

![image-20211014223237685](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20211014223237685.png)

不知为何遇到了这个问题，仿佛不是第一次了

经过一番百度，找到了解决方案

![image-20211014223326834](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20211014223326834.png)

但不知道为什么，其中的端口号是clash使用的端口号，猜测与其有关

### 具体操作

查看全局配置参数

```
git config --global --list
```

在开启shadowsock的前提下，手动配置git的代理。git客户端输入如下两个命令就可以了。

``` git
git config --global http.proxy http://127.0.0.1:7890
git config --global https.proxy http://127.0.0.1:7890
```

>  其中的7890改成你的ssh端口号
>
> http://也可以改成sockets5://,但是区别在于：socks5不支持通过pubkey免密登录github，每次提交代码只能输入用户名和密码。http可以支持免密登录。 

**取消代理：** 

``` git
git config --global --unset http.proxy  
git config --global --unset https.proxy 
```

然后就可以使用了