---
date: 2021-10-18 12:00:00
title: "使用typora+github实现图床"
author: "kong"
tags: [typora ,github]
---



## 使用typora+github实现图床

[TOC]



## 需求

- 在使用typora的时候，有时需要放图片，但截图之类的只能保存在本地，如果换了电脑或者将正篇文档给别人，就无法打开，因此使用图床，方便使用typora

## 解决方式

### 下载PicGo-Core

首先保证有nodejs环境

然后安装picgo

```shell
npm install picgo -g
```

安装后查看版本，检查是否安装成功

```she
picgo -v
```

### 安装github-plus

官方给的github上传不好用，安装github-plus

```shell
picgo install github-plus
```

### Typora设置

- 使用typora的PicGo-Core（不需要下载APP）+ github实现
  - github上创建一个仓库，填写readme，拿到对应的拥有仓库读写权限的token
  - typora上打开偏好设置，图像栏选择如下图
    <img src="https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20211003144400515.png" alt="image-20211003144400515" style="zoom: 67%;" />

### 修改picgo配置

打开配置文件更改

- ```JSON
  {
    "picBed": {
      "uploader": "githubPlus",
      "current": "githubPlus",
      "githubPlus": {
        "branch": "master", // 仓库的分支
        "customUrl": "https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest", // 访问的自定义url
        "origin": "github", // 存放的图片类型
        "repo": "Kong-PR/Typora-picture", // 存放图片的仓库
        "path": "img", // 仓库中存放图片的文件夹，也可以不填
        "token": "" // 访问github的仓库的token，就是一开始生成的
      }
    },
    "picgoPlugins": {
      "picgo-plugin-github-plus": true//启动github-plus插件
    },
    "picgo-plugin-github-plus": {
      "lastSync": "2021-10-03 02:44:04"
    }
  }
  ```

- 对应的插件一栏是在PicGo-Core的安装目录下安装的,有的没用上

  - picgo install smms-user
  - picgo install gitee-uploader
  - picgo install github-plus

- 上面的 `customUrl`，在这里我是使用了 *jsdeliver* cdn 进行加速访问.比正常要上传快很多

- token填写github的对应token

- 然后就可以使用了,图片放上去就自动上传了

> 有一个疑问
>
> 在我github账户改名后，我仍然可以通过原用户名访问，这是什么原因呢

------

## 参考

- [使用jsdelivr + GitHub + PicGo搭建免费图床 - 啸歌 - 博客园 (cnblogs.com)](https://www.cnblogs.com/SeanYoung/p/13407250.html#:~:text=由于GitHub国内访问速度慢，所以可以考虑使用CDN优化加速进行访问，这里选择免费的jsdeliver进行CDN优化。 jsDelivr 是一个免费开源的 CDN 解决方案，用于帮助开发者和站长。 包含,JavaScript 库、jQuery 插件、CSS 框架、字体等等 Web 上常用的静态资源。)
- [Typora + PicGo-Core + Github 实现图片上传到Github - 码农教程 (manongjc.com)](http://www.manongjc.com/detail/20-pgwghzxhklulekh.html)

