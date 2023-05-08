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
- git stash : 暂存当前的修改（不能保存为追踪文件，如新建文件）
- git stash pop : 将暂存文件恢复，与git stash 配合使用
- git diff ：查看未缓存的更改
- git commit ：提交命令，
  - 常用git commit -m “update内容”
  - 偷懒可以git commit -am “update内容”，这样不需要每次都add
- git push originname a:b ：将本地的a分支推送到originname 的b上去
- git pull originname a ：将远程originname分支的a拉取到本地当前分支上
- git reset --hard “commitID” ：回退到某个版本
- git reset HEAD test.txt ：取消已缓存的test.txt文件
- git merge branchname ：将任意分支合并到到当前分支中
- git branch -d branchname)：删除某个分支
- git remote add urlname urllink：添加新的远程仓库地址，一般一个项目托管到不同平台用得到
- git remote：查看当前的远程仓库
- git merge --abort ：取消merging状态
- git fetch --all : 拉取远程仓库的所有数据，包括更新的分支和提交
- git fetch <remote-name> : 只想更新特定的远程仓库



### 对于分支的操作

- 新建分支
  - git checkout -b new_barnch origin/master： 从origin的master创建new_branch，后面不写默认从当前分支创建新分支
  - git branch newbranch ：创建分支newbranch 
- 删除分支
  - git branch -d new_branch： 删除本地分支new_branch，-D强制删除
  - git push origin_name -d branch_name：删除远程分支
- 查看分支
  - git branch：-a是查看全部，-r是查看远程，默认是看本地
- 切换分支
  - git checkout other_branch：切换到其他分支

### feature分支合并一些主分支的新内容常见步骤

1. 从feature分支新建分支new_feature ：git checkout -b new_feature origin/feature_barnch 
2. 合并master : git pull origin master
3. merge后提交远程，然后pr到feature

### stash

主要用来存储当前的代码，主要应用场景为需要切换到其他分支，但又不想提交一个commit，此时使用stash暂存代码

- git stash：将当前未commit的代码保存起来，包括add和未add的
- git stash pop ：恢复存储的最近一次代码，这个指令会将缓存堆栈中的第一条删除
- git stash apply：这个功能同上，区别在于他不会删除代码
- git stash list ：展示现有的stash
- git stash drop：移除某个stash，一般使用git stash drop stash@{0} 格式
- git stash clear：删除全部stash
- 还有一些复杂的，目前没用到，用到再说

## 未完待续