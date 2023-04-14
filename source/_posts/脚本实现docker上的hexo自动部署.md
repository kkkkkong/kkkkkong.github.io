---
title: 脚本实现docker上的hexo自动部署
tags:
  - docker
  - shell
category: 服务器
abbrlink: 61507
date: 2023-04-14 10:31:15
---

# 脚本实现docker上的hexo自动部署

> 这篇文章就是这么上传的hh

## 背景描述

### 需求

之前把博客部署在了githubpages上，很方便，但是其他人访问的时候一般需要访问外网，而且有些网站在做SEO的时候不会统计githubpages，因此萌生了自己部署的想法。

所以有了在云服务器上部署hexo博客，并实现了正常访问，看似一切正常，但写博客太痛苦了，我一般习惯在本地typora上写，因为图床什么的都配置好了，但在部署的时候就变麻烦了，要同时同步到github和服务器上，这样才能保证通过https://kkkkkong.github.io/和http://www.kkkkkong.top/都可以及时更新访问。因此需要一个快速部署的解决方案。

### 现有环境

GitHubPages上运行一个博客，地址是 https://kkkkkong.github.io/

云服务器的docker容器中运行一个博客，地址是 http://www.kkkkkong.top/

两个地址的内容完全一样

## 部署

### 脚本配置

#### 自动代码更新和部署

- 本地

  - 这个之前博客里写过了，在Windows环境下写一个bat脚本省去了重复的步骤

  - ```bat
    @echo off
    hexo clean&&hexo g&&hexo d&&git add .&&git commit -m "update"&&git push origin source&&pause
    ```

    - 分别是hexo的清空、生成、部署，实际git提交到远程仓库的操作

- 服务器端

  - 在本地写完文档并提交之后，此时https://kkkkkong.github.io/是可以访问的，但是http://www.kkkkkong.top/无法访问，因为没更新哈，就需要将远程仓库的代码pull下来更新

  - 在我们使用docker部署hexo时，设置了宿主机目录映射容器目录，因此只需要在/mnt/blog.kong.site操作即可[centos上使用docker部署hexo - 虫兑变的博客 (kkkkkong.top)](http://www.kkkkkong.top/posts/19452.html)

  - 主要内容如下，目的就是更新远程的文档到当前目录，然后执行容器命令，将命令输出打印到日志，方便查错误

    ```shell
    cd /mnt/blog.kong.site/
    # 将执行结果追加到日志文件
    git pull origin source >> /tmp/git_pull_hexo.log
    docker exec -it hexo hexo clean >> /tmp/git_pull_hexo.log
    docker exec -it hexo hexo g >> /tmp/git_pull_hexo.log
    docker exec -it hexo hexo d >> /tmp/git_pull_hexo.log
    ```

  - 这样子每次提交前执行以下脚本就OK了，但这是不是我们想要的效果呢，显然不是，这还是很麻烦，每次更新都要连接服务器进行操作，不是我想要的效果。

#### 定时任务设置

想要实现自动任务，让脚本定时自动执行，那么就要用到了crond制作定时任务了

进入crontab来编辑定时任务

```shell
crontab -e
```

设置脚本内容，根据实际情况自行修改

```shell
# 这里表示每2分钟执行一次pullcoding.sh脚本，并将执行结果输出到git.log文件中
*/2 * * * * /root/hexo_pull_from_github/pull_code.sh >> /tmp/git_pull_hexo.log


#每3个月28号23点59分清除日志文件（防止系统爆炸! ememem, 这点日志怎么可能？但这是>好习惯.）
59 23 28 */3 * > /tmp/git_pull_hexo.log
```

这样子看起来很完美了，我在本地提交了新博客之后，不到两分钟他就会自动更新部署了，但是对于服务器来说，做了很多无用功。存在这样的情况：

> 明明没有任何博客新增或修改，但服务器仍然每两分钟执行 hexo clean hexo g hexo d，要知道我这服务器一共也就1核2G，都用来跑这个了我还用不用了。

#### 目录监测

为了解决上面的问题，我搞个检测函数看我博客目录下是不是有文件修改了不就行了，直接问chatgpt，他也很痛快，直接给我写了个函数

```shell
# 函数：check_dir_update
# 参数：$1——需要检测的目录路径
# 返回值：0——目录最近1分钟内没有文件被修改，1——目录最近1分钟内有文件被修改
check_dir_update() {
    # 获取当前时间和1分钟前的时间
    current_time=$(date +%s)
    one_minute_ago=$(date -d '1 minute ago' +%s)

    # 检测目录$1下的文件是否在1分钟内被修改
    find $1 -type f -newermt @$one_minute_ago ! -newermt @$current_time | grep -q .
    if [ $? -eq 0 ]; then
        return 1
    else
        return 0
    fi
}
```

完美解决，这篇文章就是这么上传的

### 完整代码

#### 脚本文件

```shell
# pull_code.sh
#!/bin/bash
# 函数：check_dir_update
# 参数：$1——需要检测的目录路径
# 返回值：0——目录最近1分钟内没有文件被修改，1——目录最近1分钟内有文件被修改
check_dir_update() {
    # 获取当前时间和1分钟前的时间
    current_time=$(date +%s)
    one_minute_ago=$(date -d '1 minute ago' +%s)

    # 检测目录$1下的文件是否在1分钟内被修改
    find $1 -type f -newermt @$one_minute_ago ! -newermt @$current_time | grep -q .
    if [ $? -eq 0 ]; then
        return 1
    else
        return 0
    fi
}


cd /mnt/blog.kong.site/
# 将执行结果追加到日志文件
git pull origin source >> /tmp/git_pull_hexo.log &&{
  sleep 5
  # 为方便查看，追加一行日期
  date >> /tmp/git_pull_hexo.log

  # 调用函数check_dir_update检测目录是否最近1分钟内有文件被修改
  if check_dir_update "/mnt/blog.kong.site/source/_posts/"; then
      echo "目录最近1分钟内没有文件被修改" >> /tmp/git_pull_hexo.log
  else
      echo "目录最近1分钟内有文件被修改" >> /tmp/git_pull_hexo.log
      docker exec -it hexo hexo clean >> /tmp/git_pull_hexo.log
      docker exec -it hexo hexo g >> /tmp/git_pull_hexo.log
      docker exec -it hexo hexo d >> /tmp/git_pull_hexo.log
  fi
}
```

#### 定时任务

```shell
# 这里表示每2分钟执行一次pullcoding.sh脚本，并将执行结果输出到git.log文件中
*/2 * * * * /root/hexo_pull_from_github/pull_code.sh >> /tmp/git_pull_hexo.log

#每2个月28号23点59分清除日志文件
59 23 28 */2 * > /tmp/git_pull_hexo.log

```







## 参考链接

[备忘 Linux CentOS git每分钟pull代码,git定时更新代码_SDL大华的博客-CSDN博客](https://blog.csdn.net/qq_15941409/article/details/109855152)

[Linux_git定时更新代码脚本（crontab）_csdn_yasin的博客-CSDN博客](https://blog.csdn.net/csdn_yasin/article/details/70332796)