---
title: 自动部署hexo博客
date: 2022-11-26 21:30:25
tags: [hexo博客]
---

## 懒人脚本

每次写完博客，都要输入一串机械化的命令，很无聊，索性写个bat脚本，具体内容如下：

```cmd
@echo off
hexo clean&&hexo g&&hexo d&&git add .&&git commit -m "update"&&git push origin source&&pause
```

然后以bat的格式保存在博客目录下，点击执行即可（比如这篇博客就是这么发布的）

#### 指令解释：

1. `@echo off` ：关闭cmd指令的回显
2. `hexo clean&&hexo g&&hexo d` ：hexo的指令，分别是：
   1. `hexo clean`：清除缓存文件 `db.json` 和已生成的静态文件 `public`
   2. `hexo g`：生成网站静态文件到默认设置的 `public` 文件夹
   3. `hexo d`：自动生成网站静态文件，并部署到设定的仓库
3. `git add .&&git commit -m "update"&&git push origin source`，是git指令
4. `pause`：暂停执行的语句



> 其中的远程仓库分支source是github的项目分支之一，hexo里设置在`hexo d`后将代码部署到master分支中，我设置了source分支用来保存其他代码（当然不包括一些静态代码和node的代码），防止换了设备之后会丢失内容
>
> 方便好用，强烈推荐