---
title: github 首页个人信息展示
tags:
  - github
  - git
category:
  - git
abbrlink: 18448
date: 2023-03-06 20:35:20
---

## github首页配置

### 背景

美化github首页，成果如下，欢迎访问

[kkkkkong (kong) (github.com)](https://github.com/kkkkkong)

### 主要步骤

1. 创建github同名仓库
2. 填写README.md
3. 配置README.md

### 遇到问题

问题描述

> Error: Pushing to https://github.com/kkkkkong/kkkkkong remote: Permission to kkkkkong/kkkkkong.git denied to github-actions[bot]. fatal: unable to access 'https://github.com/kkkkkong/kkkkkong/': The requested URL returned error: 403

这个错误意味着你尝试将代码推送到GitHub上的一个仓库，但是你没有足够的权限来进行这个操作。具体地说，这个错误信息显示了github-actions[bot]被拒绝了权限，因此无法推送代码到这个仓库。

我尝试了以下操作

1. 首先可能是因为github action没有权限，因此创建访问令牌或者使用ssh秘钥，然后配置文件被我修改成这样
   1. 首先，在你的GitHub账户中生成一个新的访问令牌。你可以按照以下步骤来生成一个GitHub访问令牌：
      1. 首先，登录到你的GitHub帐户中。
      2. 点击右上角的你的头像，然后选择"Settings"。
      3. 在左侧菜单中，选择"Developer settings"，然后选择"Personal access tokens"。
      4. 点击"Generate new token"按钮。
      5. 在"Note"字段中，为你的访问令牌添加一个描述性的名称。
      6. 选择所需的权限。根据你的需求，你可以选择只授予必要的权限，以便最大程度地减少安全风险。如果你不确定要选择哪些权限，请参考[GitHub官方文档](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)。
      7. 点击"Generate token"按钮。
      8. 复制生成的访问令牌。请注意，此令牌仅在此时显示，你必须复制它以后才能使用。
      9. 将该访问令牌安全地保存在一个安全的位置，以便以后使用。
   2. 将生成的访问令牌添加到你的GitHub存储库的`Secrets`中。在你的存储库中，点击`Settings`，然后点击`Secrets`，再点击`New repository secret`按钮来添加一个新的秘密。你需要将秘密的名称设置为`ACCESS_TOKEN`，并将生成的访问令牌作为值输入。
   3. 在你的workflow文件中，使用`${{ secrets.ACCESS_TOKEN }}`来引用你的访问令牌。

```
# GitHub Action for generating a contribution graph with a snake eating your contributions.

name: Generate Snake

on:
  schedule:
    - cron: "0 0 * * *"
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v2.3.4
      
      - name: Generate Snake
        uses: Platane/snk@master
        id: snake-gif
        with:
          github_user_name: ${{ github.repository_owner }}
          gif_out_path: ./assets/github-contribution-grid-snake.gif
          svg_out_path: ./assets/github-contribution-grid-snake.svg
          github_token: ${{ secrets.ACCESS_TOKEN }}

      - name: Push to GitHub
        uses: EndBug/add-and-commit@v7.2.1
        with:
          branch: main
          message: 'Generate Contribution Snake'
          author_name: Your Name
          author_email: yourname@example.com
          force: true

```

2. 我的仍然不起作用，后来发现仓库默认情况下，新存储库没有适当的工作流权限。修改后可以运行了
   1. 转到存储库**Setting**
   2. 选择**Actions**>>>**General**
   3. 在"工作流权限(Workflow permissions)"中，选择`Read and write permissions`

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/9513280ff5fd4ac8867c6ba44346a290.png)

### 参考链接

[Github 首页美化教程（一）：打造个性化的GitHub首页 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/454597068)

[【Git】workflows 部署 vuepress 错误“The process ‘/usr/bin/git‘ failed with exit code 128“_the process '/usr/bin/git' failed with exit code 1_菜鸟点滴的博客-CSDN博客](https://blog.csdn.net/weixin_42282187/article/details/124766382?spm=1001.2014.3001.5501)





