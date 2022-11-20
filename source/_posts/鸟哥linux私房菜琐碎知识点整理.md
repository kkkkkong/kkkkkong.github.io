---
date: 2021-10-08 12:00:00
title: "鸟哥linux私房菜琐碎知识点"
author: "kong"
tags: linux
---

# 鸟哥linux私房菜琐碎知识点

> 看懂了在整理，这样子整理的才有意义；
>
> 切记不要为了整理而整理！！！

## 0. 计算机基础知识

### 固态硬盘（solid state disk，ssd）

​	优点：马达不需要转动，所以速度快；

​	缺点：写入次数限制，所以寿命短；

### 数据表示方式

#### 文字编码系统
1. 每个符号（英文数字或符号）都占用1bytes，所以有2^8^=256种变化；
2. 每个汉字占用2bytes，所以用2~16~=65536种变化，即可表示6w多个中文字；
3. big5码的中文字编码仅仅定义了一万三千多个中文字，所以有些中文使用big5无法实现；
4. big5中某些字码像是【许、盖、功】等字，由于这几个字的内部编码会误判为单双引号，所以常常出现乱码。（不仅中文字，其他非英语系国家也会有这样的问题出现）。
5. 为解决上面的问题，国际组织ISO/IEC制定了所谓的Unicode编码系统，我们常称为utf-8或者万国码。该编码打破了所有国家的不同编码，因此大多用户选择这个编码系统。

### 软件程序运作

#### 机器程序与编译程序

机器语言：全部由0和1组成，人类识别起来相当难！

高级语言：计算机科学家大牛们为了推动人类计算机事业的发展，设计了一种人类能看得懂的语言，然后创造一种【编译程序】来将这些人类写的语言转译成机器能够看懂的机器码。

#### 操作系统

本质：也是一组程序，程序的终点在于管理计算机的所有活动以及驱动系统中的所有硬件。

## 1.linux是什么？、如何学习？

### 是什么

- 简单定义：操作系统。
- 历史：主要原因是一些大牛为了完成自己的兴趣主键开发形成的一款操作系统，非常重要的一点是open  source。

### 知识点

- GNU=GNU‘s Not Unix，:smile:大佬的脑子搞不懂。
- GCC=GNU Compiler Collection，是linux下的编译器，目前支持C、C++、Java、Objective-C、Fortran、Ada。
- GPL=GNU General Public License，自由软件的版权。 

![是](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/鸟哥.png)

- open source 协议说明

![版权控制说明](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200205220035465.png)

### linux发展

- **重要人物**：Linus Torvalds（托瓦兹），早期的Unix系统只提供运算功能，terminal仅负责IO，他想自己搞一个Unix，首先找到了minix。

- **386硬件的多任务测试**：理论上一个CPU在一个时间段内只能处理一个任务，具有多任务能力的CPU可以在不同程序之间切换，*eg：*一个CPU频率为1GHz，表示他一秒钟可进行10^9^次运算，假设每个程序以1000次作为运作周期，则CPU一秒钟就能切换10~6~次，如此快的运算速度，人为感觉两个程序是同时运行的了。
- **linux0.02：**托瓦兹参考minux的设计理念，写出的操作系统，早期的linux。

![image-20200206094811396](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206094811396.png)

- **linux虚拟团队的发展：**
  - **单人维护：**最开始托瓦兹将linux核心放置在FTP上，用户下载使用发现问题主动汇给他；
  - **广大黑客加入：**托瓦兹总是有解决不了的问题，像是硬件驱动程序的撰写，这是就有人提出可以帮忙写相关程序。托瓦兹的务实态度是linux发展迅速的重要原因。
  - **核心功能逐渐完善：**托瓦兹一个人精力有限，所以有一些朋友跳出来帮忙做这些工作，1994年终于完成了linux的核心正式版1.0，94年完成2.0，而这些人其实都没见过面。

![image-20200206100231360](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206100231360.png)

- **linux的核心版本：**

  ![image-20200206101541956](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206101541956.png)

  - **奇偶版本分类：**

    - 2.6版本以前两股分类：
      - 主次版本为奇数：发展中版本（development）*eg：*2.5.xx
      - 主次版本为偶数：稳定版本（stable）*eg：*2.6.xx

  - **主线版本、长期维护版本：**

    3.0后开始使用

  - **linux核心版本与linux发布商版本**

    linux核心版本与distribution版本不同

    linux核心最新版本4.0.0（2015/04）、centos的distribution版本7.x。

- **linux distributions**

  出现了诸多版本像是：Red Hat,Ubuntu,Debian等等，但它们使用的核心（kernel）都是官方提供的，各种标准都相同，基本上除了开发商自家开发出的软件外，不同版本的差异并不大。

  **鸟哥的分类：**

  1. 使用RPM方式安装软件的系统：Red HAT、Fedora、SUSE等；
  2. 使用dpkg方式安装软件的系统：Debian、Ubuntu、B2D等；

  **鸟哥的选择建议：**

  ![image-20200206104202391](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206104202391.png)

### linux当前的应用角色

主要分为企业应用于个人应用，这几年非常流行的云端运算机制中，linux似乎更有着力点。

### 企业应用

1. **网络服务器：**继承了Unix高稳定性的良好传统，linux上面的网络功能非常稳定，又有GNU计划于GPL授权模式，很多优秀的软件都在linux上发展。--15年为止，广泛流传的distribution仍旧是Red Hat和SUSE两个大厂。
2. **关键人物的应用：**金融数据库、大型企业网管环境，像是金融业将存储数据的任务交给了linux。
3. **学术机构的高效能运算任务：**服务器的CPU可以增加许多，而且linux的创造者本身就是一个性能癖，所以拥有强大的运算能力，加上linux具有支持范围广泛的GCC编译器，因此在这方面的优势相当明显。

### 个人环境的使用

平时接触的电子产品中，好多东西都有linux的存在，没看之前我还真不知道是linux提供的支持。

1. **桌面计算机：**在个人使用的计算机下，大多是办公学习之类的，desktop环境最需要的就是窗口，但最开始linux的设计者是一大堆工程师大牛，大牛们对于窗口并不是很需要，所以早期的linux并受众面并不是特别广泛；后来为了强化桌面计算机的使用率，linux与X Window System结合了

   > X Windows System相当于在linux上运行的软件，就算他挂了，对linux也可能不会有直接的影响呢！

2. **手持系统：**手机、pda；Google推出的Android手机专用操作系统，其实就是linux核心的一支，专门针对手机、平板这类的ARM机器所设计的。

   > 观察了我的手机，Android系统9.0，linux kernel4.9.148

3. **嵌入式系统：**

   > 理解：直接嵌入到产品当中的操作系统，理论上用户不会更动这个操作系统，所以叫嵌入式系统。

   产品例子：路由器、防火墙、手机、机器人控制芯片、家电用品的微电脑控制器等，都有linux的身影。

   > 不过嵌入式开发需要很熟悉linux kernel与驱动程序的结合才行，我准备在接下来尝试一些学习。

### 云端使用

> 分久必合，合久必分：早期贼贵的大型主机分配终端的集中运算，到2010年前个人计算机运算能力增强，大部分运算在桌机或者笔电上进行，到现在人类活动的发达，产生庞大的数据需要集中处理，从而产生云端系统的需求，将信息集中管理。

数据集中在云端，企业员工无时无地都可以办公，不知对于员工来说是喜是忧:smile:

1. **云程序：**公司内部私有云、大型因特网供货商等等

   ![image-20200206151658688](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206151658688.png)

2. **端设备：**连接上面的云程序，很多时候使用智能手机、平板，连接到某云就可以使用了；还有像是更迷你的端点设备树莓派、香蕉派，网上售价百十块钱的样子。

### linux该如何学习

- 拒绝X Window的环境，因为它只算是一个linux的一个应用，对于某些深入级别的知识学习没有帮助。

- 站在要让linux成为自己的好用的工具为出发点学习。

- 从头学起。vi文本编辑器、shell scripts 、软件管理员（安装方式）

  ![image-20200206182729268](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206182729268.png)

  ![image-20200206182754327](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206182754327.png)

- 讨论地址

  http://phorum.study-area.org/

  https://phorum.vbird.org/

- 好习惯

  ![image-20200206184135286](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206184135286.png)

- 兴趣、成就感

  ![image-20200206184306861](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206184306861.png)

- **不同的环境下，解决问题的办法有很多种，只要行得通，就是好办法！**

## 2.主机规划与磁盘划分

### linux与硬件搭配

#### 1.计算机硬件配备

- **游戏or工作：**一般的三位计算机游戏所需要的3D光影运算很多，显示适配器与CPU资源被耗用的就回很多，所以需要比较高的配置。而工作大多需要的是办公软件，所以多数入门级的极端及都能拍的非常流畅了。
- **效能与与价格：**个人用户似乎不太考虑这个，但是对于一些企业，就不得不考虑用电带来的经济账。
- **支援度：**有些极端及的硬件设计可能不支持某些操作系统，及时自己可以会搞编译程序，也要弄清楚硬件是否支持呐！

#### 2.linux搭配主机

日常个人使用做个小服务器不需要太高的性能，CPU i3的够用，但是做一些重要的功能，还是需要高档一些的计算机配备了。

- **个人服务器的基本要求：**
  - CPU：Intel i3的CPU不算太久，够用。
  - RAM：主存越大越好，因为如果主存不够用，就会用到硬盘的内存置换空间，而硬盘的速度要比内存速度慢得多，所以主存太小会影响整体系统的性能，如果再加上有X Window的话，主存太小会炸掉；一般的小型服务器，至少也要512MB以上的主存储器。
  - Hard Disk：硬盘容量取决于个人用途，小型服务器20G基本够用。
  - VGA：如果你不使用X Window，显示适配器可有可无，如果使用，显示器最好拥有32MB以上的内存。
  - NetWork InterFace Card：服务器上最重要的组件之一，但没看懂，后面会讲吧。
  - 光盘，软盘、键盘and鼠标：能用就行，做服务器可能多数情况下不怎么用，通过网络管控，类似云服务器。

#### 3.各硬件装置在linux文件夹中的命名

> 在linux中，每个装置都被当成一个文件夹来对待

![image-20200206203309823](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206203309823.png)

![image-20200206203333441](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206203333441.png)

#### 使用虚拟机学习

- Windows：VMware、VirtualBox
- linux：KVM

### 磁盘分区

#### 磁盘连接方式与装置文件名的关系

正常实体机大概使用的都是/dev/sd[a-]磁盘文件名，但是在虚拟环境下，为了加速可能就会有/dev/vd[a-p]这种装置文件名。

![image-20200206210514548](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206210514548.png)

![image-20200206210531763](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206210531763.png)

> 我的阿里云服务器，centos7.4，对应的文件名称为/dec/vda、/dev/vda1

#### MSDOS（MBR）与GPT磁盘分区表

- MSDOS：早期的linux系统为了兼容Windows的磁盘，使用的是Windows支持的MBR（Master Boot Record，主要开机记录区）的方式处理开机管理程序与分区表。

  > 吧啦吧啦，脑子不够用，看不懂了，总之这里出现了文件名称后面的对应数字。/dev/sda2

  ![image-20200206211749441](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200206211749441.png)

- GUID partition table，GPT磁盘分区表

  > 也看不懂，容我歇歇，叫脑子起床

#### 开机流程中的BIOS与UEFI开机检测

##### BIOS搭配MBR/GPT的开机流程

![image-20200207113232733](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200207113232733.png)

> BIOS不懂GPT

##### UEFI BIOS搭配GPT

- **知识点：**过去有一些cracker经常有BIOS的开机阶段来破坏系统，取得系统控制权，所以UEFI加入了一个所谓的安全启动（secure boot）机制，代表着即将开机的操作系统必须要被UEFI所验证，否则无法顺利开机，有些时候需要将此功能关闭，才可以进入linux系统。

#### linux安装的磁盘分区

- 目录树结构

  所有文件都是由根目录衍生来的

  ![image-20200207114016865](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/127.png)

- 文件系统与目录树的关系：挂载

  定义：所谓的挂载就是利用一个目录当成进入点，将磁盘分区槽的数据放置在该目录下，即进入高目录就可以读取该分区槽。

  ![image-20200207114547832](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/126.png)

> 当数据在/home下的次目录时，对应的数据就是放在partition2的，如果不是在/home下的数据，则被放置在partition1。

### 安装前的规划

#### 选择合适的distribution

- 考虑网络环境的安全性，尽量选择最新的版本。
- 若linux定位在服务器上，Red Het Enterprise Linux orSUSE Enterprise Linux比较不错，因为版本更动幅度比较小，并且更新支持的期限比较长。

#### 主机的服务规划与硬件的关系

打造Windows、Linux双系统

- NAT：达成IP分享器的功能

  通常像学校单位大多会有一条对外的联机，然后全校的计算机透过这个设备连接到互联网上，此时就得要使用IP分享器让这一条对外联机分享给所有的成员是用；在linux下要想达成此功能，需要透过NAT服务达成。

  此时由于网络流量会比较大，网络卡就需要比较好的配备，而CPU、RAM硬盘等的影响力就小很多。

  其实，仅利用linux作为NAT主机来分享IP是很不值的，因为PC的耗电能力要比IP分享器大很多。但由于NAT还可以加装更多的分析软件，实现控制带宽、流量等功能。

- SAMBA：加入Windows 网上的邻居
  Windows系统之间传输数据是用过网络邻居来循环数，但Windows 7的芳邻只能同时分享10步客户端联机，超过的话就要等待。

  在linux上使用SAMBA软件达成加入Windows网邻的功能，无客户端限制，适合学校的文件服务器角色。

  同样，由于分享的数据量较大，网卡与硬盘大小及速度就比较重要。此时可以考虑将/home 目录独立出来，并且加大容量。

  > Windows传输文件通过网络邻居？？？我不太懂哇，大家似乎传输的方式很多呐，不过还真没用过网络邻居。:smile:

- Mail：邮件服务器

  现在免费的邮箱已经很多了，个人使用的邮箱应该不需要建设mail server 了，但是如果你是一家私人企业，一些邮件是有商业机密或隐私性的，就需要mail server 了，重要的硬件需求也是硬盘容量与网卡。此时可以将/var 目录独立出来，并且加大容量。

- Web：WWW服务器
  WWW服务器几乎所有网络主机都会安装的一个功能，除了提供Internet的WWW联机，很多在网络主机上面的软件功能，也都使用WWW作为接口；若要提升WWW副武器的性能，通常提升RAM是一个不错的选择。

- DHCP：提供客户端自动取得IP的功能

  若你是一个局域网络管理员，区域内部有数十个计算机被使用，这些计算机联网时当然是自动分配比较省力，这就是DHCP的功能；这个功能对硬件的需求不是很高了。

- FTP

  FTP软件进行资源分享还是比较普遍的，硬盘容量与网卡质量相当重要。

#### 主机硬盘的主要规划

> 要考虑到计算机硬件出现问题时，文件数据能否安全保存

> 鸟哥说：没有装过十次以上的linux，是学不会linux与磁盘分区的:smile:
>
> 我有幸装过两三次了

![image-20200208162047374](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/125.png)

## 3.安装CentOS7.x

> 由于我之前安装过Ubuntu1604，加上租的阿里云的Centos7.4的云服务器，这章就不跟着整理了。

![image-20200208205809610](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/124.png)

## 4.登入系统

#### 登入

一般使用非管理员用户登录，因为系统管理员权限太高，避免出现一些手滑操作。

#### 基础操作介绍

- Ctrl+Alt+F1-F6切换终端

- 简单文本在线文本编辑器：nano

- 关机指令：shutdown、poweroff、reboot、halt

- 复杂关机指令：systemctl 【指令】，上面的几个指令都是调用这个指令。

  ![](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/123.jpg)

## 5.Linux的文件权限与目录配置

#### 使用者与群组

- 文件拥有者（owner）：Linux是多人多任务的系统，因此可能会有多人同时使用一部主机的情况，此时文件拥有者这个角色就相当重要，不想让别人看到的文件，就可以设置成只有文件拥有者才可以看到文件的内容。

- 群组（group）：比如在团队协作的时候，某些文件是具有一定的保密性的，只能让团队里面的成员使用，组内成员之间可以互相修改对方的数据，但是其他组的成员不能看到本组的文件内容。帐号支持多群组设定。

- 其他人（others）：与文件拥有没有任何关系，只有上述两种使用者给予权限才可访问。

  ![](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/sendpix1.jpg)

  > 上图中例子：以王三毛为例，王三毛这个文件的拥有者为王三毛，王三毛属于王大毛这个群组，而张小猪相对于王三毛，只是个其他人而已。
  >
  > 图中有一个特殊的人物，就是天神（root），拥有无限的权利，所以他可以访问任何一个地方。

- 用户身份与群组记录文件

  root相关的信息记录在/etc/passwd

  个人的密码信息记录在/etc/shadow

  Linux所有的组名记录在/etc/group

  > 打开这三个文件后，发现并不能看懂:smile:

#### Linux文件权限概念

##### Linux文件属性

![](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/sendpix3.jpg)

- 第一栏表示这个文件的类型与权限

  共有10个字符

  - 第一个字符代表文件类型

    - d：目录
    - -：文件
    - l：链接文档（link file）
    - b：装置文件里面可供存储的接口设备
    - c：装置文件里面的串行端口设备，例如鼠标键盘

  - 接下来的字符中三个为一组，均为”rwx“三个参数的组合

    > r：可读；w：可写；x：可执行（execute），三个参数的位置不会变，如果没有权限，会用-代替。
    - 第一组为**文件拥有者可具备的权限**，上图中对应的权限为*rw*，表示拥有者可读写，但不可执行。
    - 第二组为**加入群组的用户的权限**，途中对应权限为*r*，表示群组内用户可写。
    - 第三组为**其他用户的权限**，途中对用权限为*r*，表示其他用户可写。

- 第二栏表示有多少档名链接到此节点

  每个文档都会将他的权限与属性记录到文件系统的i-node中，不过，我们使用的目录树却是使用温金明来记录，因此每个档名会连接到一个i-node。从.目录和.. 目录就可以看出个数。

- 第三栏表示这个文件的拥有者名称

  图中文件为root用户有。

- 第四栏表示这个文件的所属群组

  图中文件的所属群组为root，在root群组内的用户拥有r权限。

- 第五栏表示文件的容量大小

  > 默认单位为bytes，图中文件容量为148bytes。

- 第六栏表示文件的建档日期或者是最近的修改日期

  > 这一栏的内容分别为日期（月/日）及时间，如果修改的时间局不是在现在的时间年份，会显示年份。
  >
  > 如果想看完整的时间格式，使用：ls -l --full-time 就能显示出完整的时间格式了。     

- 第七栏为这个文档的名称

  > 如果文档名前面有一个[.]，则代表这个文件为隐藏文件。

> 对于目录的权限：
>
> r：读包含目录中的文件名称；
>
> w：写信息到目录中去（增加和删除索引点的链接）；
>
> x：搜索目录（能用改目录名称作为路径名去访问它所包含的文件个子目录）；拥有此权限相当于拥有了目录下文件名称及内容的权限。
>
> 即：
>
> - 有只读权限的用户不能用cd进入该目录，还必须有执行权限才能进入。
> - 有执行权限的用户只有在知道文件名，并拥有文件的读权利的情况下才可以访问目录下的文件。
> - 必须有读和执行权限才可以ls列出目录清单，或者使用cd进入该目录。
> - ~~有目录的写权限，可以创建、删除或修改该目录下的任何文件或子目录，即使该文件或子目录属于其他用户。~~

- Linux文件权限重要性
  - 系统保护的功能：像是/etc/shadow 这种文件，用来保存系统中所有账号的数据，不能被任何人读取，所以对应权限为---------，只有root可读。
  - 团队开发数据共享：希望某些文件只有你团队的人可以实用，其他人都不能看到的时候。
  - 未将权限合理化的危害：比如给了用户开关机权限，使用者不小心关了机，系统就会慕名的挂掉；或者密码被其他人士获得了，他使用root登录就会轻而易举的做root的一些工作。

##### 改变文件属性与权限

- 更改所属群组：chgrp

  被改变的组名必须要在/etc/group 文件内存在才行。

- 更改文件拥有者：chown

  被更改的用户名必须要在/etc/passwd 文件内才行。

- 更改文件权限：chmod

  - 数字类型更改权限：

    r:4;w:2;x:1；暴力授权的时候经常用的：chmod 777  filename。

  - 符号类型更改权限：

    使用user（u）、group（g）、others（o）表示三种身份的权限，a则代表全部的身份。

    ![image-20200211202434460](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200211202434460.png)

##### 目录与文件之权限意义

- 权限对文件的重要性

  Windows下的可执行文件室友拓展名来判断的，像是.exe、.bat、.com等，但是在Linux下，是否能够执行，完全是由x这个权限确定的，跟文档名没有绝对的关系。

  w权限，表示可以写入、编辑、新增、修改文件内容的权限，但并不具有删除文件本身的权限。对于文件的rwx，都是针对文件的内容而言的，与文档的存在与否没有关系。

- 权限对目录的重要性

  r：具有读取目录结构列表的权限，可以查询该目录下的文件名数据，所以你可以使用ls指令将目录的内容显示出来。

  w：这个权限对于目录来说比较重要，表示用户拥有变更目录结构的权限，即：

  - 建立新的文件与目录；

  - 删除已经存在的文件与目录（无论该文件的权限如何）；

  - 将已存在的文件或目录进行更名；

  - 移动该目录内的文件与目录的位置；

    总之，w权限与该目录下的文件名变更有关。

  x：代表用户能否进入该目录成为工作目录的用途。

  ![image-20200211212933823](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200211212933823.png)

  > 上图例子中，r都不是必须的，因为我知道要找的文件file1的名字，缺少r只是缺少了tab补全。

##### Linux文件种类与拓展名

- 文件种类

  - 正规文件（regular file）

    在查看文件属性时，第一个字符为-的文件；

    按照文件内容，大致分为：

    - 纯文本文档（ASCII）：Linux系统中最多的一种文件类型，几乎用来作为设定的文件都是这个文件类型。
    - 二进制文件（binary）：Linux当中的可执行文件就是这种格式，比如指令cat。
    - 数据格式文件（date）：有些文件在运行的过程当中会读取某些特定格式的文件，这些文件可被称作数据文件，数据文件了可以使用last读出来，但使用cat就会出现乱码。

  - 目录（directory）

    第一个属性为d。

  - 连接文档（link file）

    类似Windows下的快捷方式，第一个属性为l。

  - 设备与装置文件（device）

    与系统周边及储存相关的一些文件，通常都集中在/dev这个目录下，通常分为两种：

    - 区块（block）设备文档：一些存储数据，以提供系统随机存取的接口设备，比如硬盘与软盘，第一个属性为b。
    - 字符（character）设备文件：即一些串行端口的接口设备，例如键盘鼠标，特征为一次性读取，不能够截断输出。例如不能让鼠标跳到另一个画面，而是连续滑动，第一个属性为c。

  - 资料接口文档（sockets）
  
    这种文件通常被用在网络上的数据承接，当启动一个程序来监听客户端的要求，客户端就可以通过这个socket进行数据的沟通了。第一个属性为s。
  
  - 数据传送文件（FIFO，pipe）
  
    FIFO也是一种特殊的文件类型，主要目的在解决多个程序同时存取一个文件所造成的错误问题。第一个属性为p。

- 文件拓展名

  基本上Linux没有所谓的拓展名，一个文件能不能执行，取决于第一栏的十个属性。不过文件能不能执行成功还要取决于文件是否具备可执行的程序代码。

  虽然如此，我们仍希望可以通过文件名来了解某文件是什么东西，所以我们通常还是会以适当的拓展名来区分文件种类的：

  - .sh：脚本或批处理文件，因为批处理文件用shell写成，所以缩写为sh。
  - Z，.tar，.tar.gz，.zip，tgz：经过打包的压缩文件。因为压缩软件分别为gunzip，tar等，所以取名。
  - .html，.php：网页相关文件，分别代表HTML语法与PHP语法的网页文件。

- 文件名长度限制

  最大容许文件名255bytes，即约英文字符255个，中文字约128个。

- 文件名限制

  文字接口下的一些指令的操作关系，在设定名称时，最好避免一些特殊字符：*?<>;[]{}()&`'"-|

#### Linux目录配置

##### Linux的目录配置依据---FHS

> 由于使用Linux开发产品或者distributions的开发者太多了，如果每个人都按照自己的想法来配置文件防止的目录，那可能会造成管理上的困扰，这就有了后来的FHS（Filesystem Hierarchy Standard）标准出炉了。

FHS根据文件系统使用的频繁与否与是否允许使用者随意更改，而将目录定义成为四种交互作用的形态，类似下图：

![image-20200212183430045](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200212183430045.png)

这是一些代表性的目录，关于这四种类型：

- 可分享的：可以分享给其他系统挂在使用的目录，像是执行文件、用户的邮件等数据。
- 不可分享的：自己机器上面运作的装置文件或者与程序有关的socket文件等，由于仅仅与自身及其有关，所以当然不适合分享给其他主机了。
- 不变的：有些数据是不会经常变动的，跟随着distribution而不变动，例如函数库、文件说明文件、系统管理员所管理的主机服务配置文件等等。
- 可变的：经常改变的数据，例如登录文件、一般用户可自行收受的新闻组等。

事实上，FHS针对目录树架构仅定义出三层目录下应该放什么数据而已，分别为：

- /（root，根目录）：与开机系统有关；
- /usr（unix software resource）：与软件安装、执行有关；
- /var（variable）：与系统运作过程有关。

> 下面是FHS系统规定的必须要存在的目录以及建议存在的目录

![image-20200212204726879](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200212204726879.png)

![image-20200212204749591](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200212204749591.png)

![image-20200212204814579](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200212204814579.png)

![image-20200212204833246](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200212204833246.png)

![image-20200212204854755](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200212204854755.png)

![image-20200212204912143](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200212204912143.png)

> 在CentOS 7 中，目录编排与过去版本不同，将一部分原本在根目录下的目录，内部数据全部挪到/usr 中，然后进行连接设定，具体如下：
>
> ![image-20200212205251812](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200212205251812.png)

##### 目录树

![image-20200212205640418](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200212205640418.png)

> 如图，/var 目录最好能够独立出来，这样对于系统的数据还有一些安全性的保护，至少/var 死掉时，根目录还活着，还能够进入救援模式。
>
> 个人理解因为/var 存放的是常态性变动文件，所以容易被搞出事情，所以这里强调将其单独放出来。

##### 绝对路径与相对路径

绝对路径：一定是从根目录写起；

相对路径：从相对于当前工作目录的路径写起；

- . ：代表当前的目录，可使用./代替；
- .. ：代表上一层目录，可使用../代替；

> 之前编译过后进行的文件运行时使用./run.sh，就表示的是本目录下的run.sh 文件。

## 6.Linux文件与目录管理

### 目录与路径

#### 绝对路径与相对路径用途

- 绝对路径：比如在使用shell编写管理系统的程序时，写绝对路径虽然比较麻烦但是保险。

- 相对路径：在同目录下多个文件操作，或者文件树比较深的时候，相对路径简洁的优势就显现出来了。

#### 目录的相关操作

常用指令：cd、pwd、mkdir、rmdir。

> 根目录下也是存在.. 目录的，不过与. 目录所指的是同一个目录。

- cd（change directory，变换目录）

  cd、cd ~ ：指的都是返回家目录；

  cd - ：指的是返回上次的目录，类似电视机遥控器的返回键。

- pwd（print working directory，显示目前所在的工作目录）

  pwd -P 表示显示实际路径，而非使用链接路径。

- mkdir（make directory，建立新目录）

  默认情况下，需要的目录需要一层一层建立。

  mkdir -p pathname/pathname2/filename ：指的是递归建立目录。

  -m 参数表示预设权限：我的CentOS7.7默认的权限是755。

  > 同时-p -m 创建的目录，只有最底层目录的权限是预设参数，其他的均为默认值。
  >
  > 默认属性跟umask有关。

- rmdir（remove directory，删除目录）

  -p ：递归删除空目录，像是rmdir -p test/kong/；

  rm -r ：可删除非空目录。

#### 关于执行文件路径的变量：$PATH

像是Windows中的环境变量一样，Linux中的环境变量为用户可以在任何地方使用某些指令提供了帮助。

以ls为例，当你输入ls，系统会按照PATH的设定去每个PATH目录下搜寻文件名为ls的可执行文件，若遇到多个名为ls的文件，那么先搜索到的同名文件先执行。

> echo $PATH 指令可以查看当前的环境变量。echo有打印的意思，$后面接的是变量，所以会显示出目前的PATH。
>
> 将/usr/bin/ 目录下的ls文件移动到/root/中，会发现ls无法使用，但是使用绝对路径/root/ls或者/root目录下./ls可以执行，说明这个目录不在PATH中。
>
> 添加PATH：PATH="${PATH}:/root"。
>
> 安全起见，不建议将. 加入PATH中，避免写某些文件过度使用权限。

### 文件与目录管理

#### 文件目录查看：ls

![image-20200213204432458](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213204432458.png)

> bash shell 实现了将ll 代表ls -l 的指令。

#### 复制、删除与移动：cp，rm，mv

- cp（copy）

  ![image-20200213205052303](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213205052303.png)

  > 常用-a 或-p 来完整复制文件的权限，否则都会按照默认的权限复制的！

  ![image-20200213205345601](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213205345601.png)

  ![image-20200213210154434](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213210154434.png)

  ![image-20200213210211747](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213210211747.png)

  ![image-20200213210305522](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213210305522.png)

  > 总之，由于cp有种种的文件属性与权限的特性，所以在复制时必须要考虑到：

  > - 是否需要完整的保留来源文件的信息？
  >
  > - 来源文件是否为链接文档？
  >
  > - 来源文件是否为特殊文件，如FIFO，socket 等？
  >
  > - 来源文件是否为目录？

- rm（remove）

  ![image-20200213211042388](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213211042388.png)

  ![image-20200213211052093](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213211052093.png)

  > rm -r 递归删除一些废弃文件夹很好用，慎用。
  >
  > 当然还有毁天灭地的rm -rf /* 指令，千万别用！！！:smile:

- mv(move)

  ![image-20200213212307438](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213212307438.png)

#### 获取路径的文件名与目录名称

![image-20200213212512116](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213212512116.png)

### 文件内容查阅

1. cat：从第一行开始显示文件内容；

2. tac：从最后一行开始显示，其实是cat倒着拼写；

3. nl：显示的时候，输出行号；

4. more：一页一页显示文件的内容；

5. less：与more相似，不过他可以向前翻页；

6. head：只看前几行；

7. tail：只看尾巴几行；

8. od：以二进制的方式读取文件内容。

> 前三个都是一口气阿静数据显示在屏幕上面，more和less都可以一页一页的观察。

- cat(concatenate)

  ![image-20200213213722126](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213213722126.png)

  ![image-20200213213750140](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213213750140.png)

- tac

  ![image-20200213214349626](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213214349626.png)

  有点意思，tac就是将cat输出的内容按照行数倒序连续输出。

- nl(添加行号打印)

  ![image-20200213215313331](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213215313331.png)

  ![image-20200213215335744](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213215335744.png)

  > nl的预设和cat -n有点不太一样，nl可以将行号做比较多的显示设计，包括位数与是否自动补齐0等等。

- more()

  ![image-20200213215713217](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213215713217.png)

  > - 空格键：代表向下翻一页；
  > - 回车键：代表向下翻一行；
  > - /字符串：代表在这个显示的内容当中，向下搜索【字符串】这个关键词；
  > - :f ：立即显示文件名以及目前的行数；
  > - q ：代表立即离开more，不在显示文件内容；
  > - b 或【Ctrl】-b：代表往回翻页，支队文件有效，对管线无效；
  >
  > 尝试使用/ 搜索，不知为何失败了。

- less(一页一页翻动)

  ![image-20200213220719850](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213220719850.png)

  ![image-20200213220831228](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213220831228.png)

  > man page 就是使用less来显示说明文件的内容的。

- head(取出前面几行)

  ![image-20200213220956469](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213220956469.png)

  > 如果n 为负数，代表不显示后面-n行。

- tail()

  ![image-20200213221120485](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213221120485.png)

  > 类似tail ，相反方向。

  ![image-20200213221443604](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213221443604.png)

  ![image-20200213221507687](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213221507687.png)

- od(非纯文本文档)

  ![image-20200213221550546](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213221550546.png)

  ![image-20200213221607454](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200213221607454.png)

- 修改文件时间或新建文档：touch

  Linux下记录许多的时间参数，其实是三个主要的变动时间：

  - modification time（mtime）

    当文件的内容数据变更时，就会更新这个时间，内容数据指的是文件的内容。

  - status time（ctime）

    当文件的状态改变时，就会更新这个时间，像是权限与属性被更改了，就回更细这个时间。

  - access time（atime）

    当文件的内容被取用时，就会更新这个时间，比如使用cat读取文件内容，就会更新这个时间。

  ![image-20200214103905832](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200214103905832.png)

  ![image-20200214103921169](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200214103921169.png)

  ![image-20200214103948331](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200214103948331.png)

  > touch改变的是mtime和atime，因此常被用来更改文件日期为某时间。
  >
  > 另一个常用是创建一个空文件。

### 文件与目录的默认权限与隐藏权限

#### 文件预设权限：umask

默认权限的属性上，目录与文件是不一样的，一般情况下，x权限对于目录来说十分重要，而文件则主要是用于数据记录，不需要执行权限。所以：

> 当使用者建立文件则预设没有可执行权限，即只有rw两个权限，最大的数字表示为666，即-rw-rw-rw-；
>
> 当使用者建立目录则预设默认所有权限均开放，最大数字为777，即drwxrwxrwx。

umask的数字代表被减掉的权限，以umask为022为例，相当于：

![image-20200214170455218](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200214170455218.png)

#### 文件隐藏属性

- chattr（配置文件隐藏属性）

  ![image-20200214184446932](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200214184446932.png)

  ![image-20200214184502739](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200214184502739.png)

- lsattr（显示文件隐藏属性）

  ![image-20200214184555202](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200214184555202.png)

#### 文件特殊权限：SUID，SGID，SBIT

- Set UID

  当s出现在文件拥有者的x权限上时，即称为SUID。

  SUID针对文件设定。

  ![image-20200214191238116](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200214191238116.png)

  > 例子：Linux的所有账号密码都在/etc/shadow 这个文件里，这个文件权限为---------- 1 root root ,即为只有root可用。但是作为普通用户可以通过passwd修改自己的密码，更改该文件，这就是SUID的功能。
  >
  > ![image-20200214191548099](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200214191548099.png)
  >
  > 但是像用户dmtsai并不能使用cat查看/etc/shadow ，因为cat不具有SUID权限。
  >
  > ![image-20200214191838591](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200214191838591.png)

- Set GID

  当s出现在文件群组的x权限上时，即称为SGID。

  SGID针对目录和文件设定。

  当对一个文件设定了SGID权限时：

  ![image-20200214192112500](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200214192112500.png)

  与SUID类似，在执行一些有SGID权限的文件时会获得对应群组的权限支持。

  当对一个目录设定了SGID权限时：

  ![image-20200214192301506](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200214192301506.png)

- Sticky Bit

  SBIT仅作用在目录上。对于目录的作用为：

  - 当用户对目录具有rwx权限时；
  - 用户在该目录下创建文件或者目录，仅有自己与root才有权利删除该文件。

  > t的作用就是不能删除别人的文件。

  留白，root用户创建的777权限的目录下，普通用户能否进行更改权限，删除文件等操作。

  ```java
  正常情况下，更改权限只能是文件拥有者或是root用户进行。该目录下用户可以删除文件和空目录，非空目录能否删除取决于目录及目录内文件的权限设置。
  ```

  

- 权限设定

  - 数字指令

    SUID：4

    SGID：２

    SGIT：１

    在原先的７７７权限之前加上一个数字，因为这三个数字分别在三个用户组下，所以不会有冲突。像是chmod 4755 filename ，当出现Ｓ，Ｔ时，表示对应位置没有ｘ权限。

  - 字母指令

    ![](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/sendpix0-1581686048358.jpg)

- 观察文件类型：file

  ![](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/sendpix1-1581686146762.jpg)

### 指令与权限的搜寻

#### 脚本文件名的搜寻

- which

  ![image-20200215193803899](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200215193803899.png)

- type

#### 文档名的搜索

- whereis

  ![image-20200215193841400](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200215193841400.png)

- locate / updatedb

  ![image-20200215193910644](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200215193910644.png)

- find

  ![image-20200215193923828](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/image-20200215193923828.png)

  > find 有很多的用途，懒惰至极的我没整理。

> 这一章后面的习题很精彩，在Pages 276

## 认识Linux的文件系统

