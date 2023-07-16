---
title: 记录一次git stash drop误删恢复
tags: git
category: git
abbrlink: 22396
date: 2023-05-26 20:16:01
---

## 记录一次stash误删恢复

### 过程

今天写代码切换分支的时候，把一些暂时不想commit的代码stash了，然后到其他分支做别的事情，然后想着清理一下stash list（因为之前的太乱了，有很多不用了的），结果不小心drop了一段有用的代码（400多行）



### 恢复



网上找了大佬们的解决方案各种尝试，有的说使用git reflog，但我的没有效果（查不到stash的记录，里面都是HEAD的内容），找到了一个有一种成功，分享一下

适用于我这种，**删除了stash一段记录，并且不知道版本号，但是记得删除的内容**的情况

1. 将查找的内容存入文件

```shell
git fsck --lost-found >> 1.txt
```

内容是这样的，这记录了这段时间的内容，但是看不懂

![image-20230526202831064](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20230526202831064.png)

2. 筛选结果，创建脚本快速查找（直接使用现成的脚本）

```shell
#!/bin/sh
READFILENAME="1.txt"      #上步文件名【1.txt dangling commit，2.txt对应unreachable commit】
RETFILENAME="./ret.txt"   #筛选结果文件名
while read -r line       
do 	
    VAR=`echo $line | awk '/dangling commit/ {print $3}'`
    if [ $VAR ]; then
        git show $VAR >> $RETFILENAME    
        echo "-------------------------------------\n" >>$RETFILENAME #每条记录用---分割开
    fi
done < $READFILENAME

```

3. 得到筛选结果，筛选结果里是有代码的对应修改记录，可凭借这个找到对应的记录，然后找到相应的commitID

![image-20230526203100585](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20230526203100585.png)

4. 恢复，直接stash apply即可

```shell
git stash apply commitID
```

ad3a5391759ee979610b9a2a0d16f89e2d8af35c

### 参考链接

[(17条消息) git stash drop 误用恢复_缘客_ql的博客-CSDN博客](https://blog.csdn.net/u014213012/article/details/104640094)

