---
title: git常用命令
tags: git
abbrlink: 953
date: 2022-11-28 19:21:24
---

## git常用命令总结

> 总结我常用的git命令，不然每次想不起来了还要去找
>
> 持续更新...

- git add ：添加文件到缓存，常用git add . 添加所有文件夹
- git status ：查看项目内文件的状态
- git diff ：查看未缓存的更改
- git commit ：提交命令，
  - 常用git commit -m “update内容”
  - 偷懒可以git commit -am “update内容”，这样不需要每次都add
- git push originname a:b ：将本地的a分支推送到originname 的b上去
- git pull originname a ：将远程originname分支的a拉取到本地当前分支上
- git reset --hard “commitID” ：回退到某个版本
- git reset HEAD test.txt ：取消已缓存的test.txt文件
- git branch ：查看本地的分支
  - git branch newbranch ：创建分支newbranch 
- git checkout branchname：切换到branchname 分支
- git merge branchname ：将任意分支合并到到当前分支中
- git branch -d branchname)：删除某个分支
- git remote add urlname urllink：添加新的远程仓库地址，一般一个项目托管到不同平台用得到
- git remote：查看当前的远程仓库
- git merge --abort ：取消merging状态
- git checkout -b newbranch origin/abranch ：从远程分支abranch创建本地新分支newbranch



## 未完待续