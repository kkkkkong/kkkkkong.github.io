---
date: 2022-07-18 12:00:00
title: "git merge与git pull的区别"
author: "kong"
tags: [git ,merge ,pull]
---

### 使用GitHubPages+jekyll搭建博客平台

### git merge与git pull的区别



#### 前言

最近做项目的时候使用git，遇到一个情形：

在本地自己的分支开发的时候，主分支合并了其他人的工作，此时需要将主分支的代码合并过来，一直使用的是git pull origin main命令，如果有他人合并的工作与我本地工作有冲突，需要自己处理对应冲突

今天偶然看到其他的做法是git pull origin main main，然后git merge main mybranch，发现这也是种实现方式

于是乎开始查这两种做法的区别

#### git pull

直接将origin的分支与本地当前分支合并，会将过程都隐藏起来，

遇到冲突解决



#### git fetch+ git merge

git fetch origin main 将远程仓库中的最新代码拉回，

git merge origin/main 把本地代码和已取得的main代码合并

遇到冲突去解决



#### 对比

网上很多文章都推荐使用fetch+merge，因为pull会直接更改你的工作，你不了解具体更改了什么

但如果使用了IDE，现在的IDE都集成了冲突处理功能，所以我觉着使用pull也问题不大