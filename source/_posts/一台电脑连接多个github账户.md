---
title: 一台电脑连接多个github账户如何配置秘钥
tags:
  - git
  - github
  - ssh
category: git
abbrlink: 37835
date: 2023-03-04 22:05:22
---

## 背景

实验室多个人使用同一台服务器，使用git时配置秘钥分别连接自己的github账户，此时会出现总是匹配一个固定的秘钥的情况



## 解决方案



### 1. 生成秘钥

此处具体细节和网上的一样，假设生成两个秘钥，名字分别为id_rsa和id_rsa_bak，对应的公钥为后缀多了.pub

### 2. 编辑配置文件

编辑`.ssh/config`文件，内容为

```text
# 第一个
Host github_one
Hostname github.com
IdentityFile ~/.ssh/id_rsa

# 第二个
Host github_two
Hostname github.com
IdentityFile ~/.ssh/id_rsa_bak
```

> 网上的大部分教程都是避其锋芒，配置里大多是不同的网站，比如github和gitee，明显不符合我们的需求

把公钥放在对应的github账户上，然后执行下面的命令即可

```console
ssh -T git@github_one
ssh -T git@github_two
```

### 3. 关联仓库

在以后关联仓库的时候，把@后面的内容要修改为对应的host

```text
git remote add origin git@github_one:xxx/example.git # public user
git remote add origin git@github_two:xxx/example.git # priavate user
```

## 参考链接

[一台电脑双GitHub账户配置 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/107341502)