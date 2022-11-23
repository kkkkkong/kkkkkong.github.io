---
date: 2022-05-22 12:00:00
title: "5.22leetcode周赛"
author: "kong"
tags: [leetcode ,浮点数精度]
---

## 5.22leetcode周赛

> 第一次参加这个周赛，很菜，过了两个题，稍微复盘一下

### 题目一：[6074. 字母在字符串中的百分比](https://leetcode.cn/problems/percentage-of-letter-in-string/)

难度简单0收藏分享切换为英文接收动态反馈

给你一个字符串 `s` 和一个字符 `letter` ，返回在 `s` 中等于 `letter` 字符所占的 **百分比** ，向下取整到最接近的百分比。

 

**示例 1：**

```
输入：s = "foobar", letter = "o"
输出：33
解释：
等于字母 'o' 的字符在 s 中占到的百分比是 2 / 6 * 100% = 33% ，向下取整，所以返回 33 。
```

**示例 2：**

```
输入：s = "jjjj", letter = "k"
输出：0
解释：
等于字母 'k' 的字符在 s 中占到的百分比是 0% ，所以返回 0 。
```

**提示：**

- `1 <= s.length <= 100`
- `s` 由小写英文字母组成
- `letter` 是一个小写英文字母

**解答**

这道题是签到题，但是因为有关浮点数精度相关信息忘了，最开始使用float存储的，导致有测试用例不通过，浪费了十多分钟，还被罚时了10分钟

**代码**

```java
class Solution {
    public int percentageLetter(String s, char letter) {
        int count=0;
        //计算字符出现的次数
        for(int i=0;i<s.length();i++){
            if(s.charAt(i)==letter){
                count++;
            }
        }
        //题目给出s的length最大100，所以使用double不会损失精度，但float不可以，测试用例(float)59/100=58
        double res=(double)count/s.length();
        return (int)(res*100);

    }
}
```



### 题目二：6075. 装满石头的背包的最大数量



现有编号从 `0` 到 `n - 1` 的 `n` 个背包。给你两个下标从 **0** 开始的整数数组 `capacity` 和 `rocks` 。第 `i` 个背包最大可以装 `capacity[i]` 块石头，当前已经装了 `rocks[i]` 块石头。另给你一个整数 `additionalRocks` ，表示你可以放置的额外石头数量，石头可以往 **任意** 背包中放置。

请你将额外的石头放入一些背包中，并返回放置后装满石头的背包的 **最大** 数量*。*

 

**示例 1：**

```
输入：capacity = [2,3,4,5], rocks = [1,2,4,4], additionalRocks = 2
输出：3
解释：
1 块石头放入背包 0 ，1 块石头放入背包 1 。
每个背包中的石头总数是 [2,3,4,4] 。
背包 0 、背包 1 和 背包 2 都装满石头。
总计 3 个背包装满石头，所以返回 3 。
可以证明不存在超过 3 个背包装满石头的情况。
注意，可能存在其他放置石头的方案同样能够得到 3 这个结果。
```

**示例 2：**

```
输入：capacity = [10,2,2], rocks = [2,2,0], additionalRocks = 100
输出：3
解释：
8 块石头放入背包 0 ，2 块石头放入背包 2 。
每个背包中的石头总数是 [10,2,2] 。
背包 0 、背包 1 和背包 2 都装满石头。
总计 3 个背包装满石头，所以返回 3 。
可以证明不存在超过 3 个背包装满石头的情况。
注意，不必用完所有的额外石头。
```

 

**提示：**

- `n == capacity.length == rocks.length`
- `1 <= n <= 5 * 104`
- `1 <= capacity[i] <= 109`
- `0 <= rocks[i] <= capacity[i]`
- `1 <= additionalRocks <= 109`

**代码** 

时空O(n)O(n)

```java
class Solution {
    public int maximumBags(int[] capacity, int[] rocks, int additionalRocks) {
        int len=capacity.length;
        int []tmp=new int [len];
        //计算每个背包的剩余空间
        for(int i=0;i<len;i++){
            tmp[i]=capacity[i]-rocks[i];
        }
        //按照剩余空间大小排序
        Arrays.sort(tmp);
        int res=0;
        for(int i=0;i<len;i++){
            //如果空间为0，则满，直接增加
            if(tmp[i]==0){
                res++;
                continue;
            }
            //剩余空间小于额外的石子数
            if(tmp[i]<=additionalRocks){
                additionalRocks-=tmp[i];
                res++;
            }
            //剩余空间大于额外石子数，不满条件，直接结束循环
            else{
                break;
            }
        }
        return res;
    }
}
```



### 题目三：6076. 表示一个折线图的最少线段数

给你一个二维整数数组 `stockPrices` ，其中 `stockPrices[i] = [dayi, pricei]` 表示股票在 `dayi` 的价格为 `pricei` 。**折线图** 是一个二维平面上的若干个点组成的图，横坐标表示日期，纵坐标表示价格，折线图由相邻的点连接而成。比方说下图是一个例子：

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/1920px-pushkin_population_historysvg.png)

请你返回要表示一个折线图所需要的 **最少线段数** 。

 

**示例 1：**

![img](https://cdn.jsdelivr.net/gh/Kong-PR/Typora-picture@latest/img/ex0.png)

```
输入：stockPrices = [[1,7],[2,6],[3,5],[4,4],[5,4],[6,3],[7,2],[8,1]]
输出：3
解释：
上图为输入对应的图，横坐标表示日期，纵坐标表示价格。
以下 3 个线段可以表示折线图：
- 线段 1 （红色）从 (1,7) 到 (4,4) ，经过 (1,7) ，(2,6) ，(3,5) 和 (4,4) 。
- 线段 2 （蓝色）从 (4,4) 到 (5,4) 。
- 线段 3 （绿色）从 (5,4) 到 (8,1) ，经过 (5,4) ，(6,3) ，(7,2) 和 (8,1) 。
可以证明，无法用少于 3 条线段表示这个折线图。
```

**示例 2：**

![img](https://assets.leetcode.com/uploads/2022/03/30/ex1.png)

```
输入：stockPrices = [[3,4],[1,2],[7,8],[2,3]]
输出：1
解释：
如上图所示，折线图可以用一条线段表示。
```

 

**提示：**

- `1 <= stockPrices.length <= 105`
- `stockPrices[i].length == 2`
- `1 <= dayi, pricei <= 109`
- 所有 `dayi` **互不相同** 。

#### 解答

这道题是没有AC的，卡在了一个隐藏测试用例上，没想到还是因为精度问题，这次我虽然用的是double类型，但是测试用例给到了10的10次方，导致精度丢失，WA

这里判断三个点在不在同一条直线上不能使用斜率判断，需要使用直线方程的一般式判断

在这里我们只需要用到直线方程的部分性质
直线方程的一般式为：**ax+by+c=0**
在平面直角坐标系中，我们知道任意两个点的坐标就可求出经过这两个点的直线方程
可得：

```
a=y2-y1
b=x1-x2//注意别写反了
c=-(ax1+by1)

```

显然只需要代入其他点判断是否满足一般式即可

**代码**

```java
class Solution {
    public int minimumLines(int[][] stockPrices) {
        if(stockPrices.length==1)return 0;
        if(stockPrices.length==2)return 1;
        int len=stockPrices.length;
        HashMap<Integer,Integer> hashmap=new HashMap();
        int []tmpStock=new int[len];
        for(int i=0;i<len;i++){
            hashmap.put(stockPrices[i][0],stockPrices[i][1]);
            tmpStock[i]=stockPrices[i][0];
        }
        Arrays.sort(tmpStock);
//         排序后的二维数组
        int[][] stockPricesSort=stockPrices;
        for(int i=0;i<len;i++){
            stockPricesSort[i][0]=tmpStock[i];
            stockPricesSort[i][1]=hashmap.get(tmpStock[i]);
        }
        
        int res=1;
        int a=stockPricesSort[1][1]-stockPricesSort[0][1];//y2-y1
        int b=stockPricesSort[0][0]-stockPricesSort[1][0];//x1-x2
        int c=-(a*stockPricesSort[0][0]+b*stockPricesSort[0][1]);//-(ax1+by1)
        for(int i=2;i<len;i++){
            if(a*stockPricesSort[i][0]+b*stockPricesSort[i][1]+c!=0){
                res++;
                a=stockPricesSort[i][1]-stockPricesSort[i-1][1];
                b=stockPricesSort[i-1][0]-stockPricesSort[i][0];
                c=-(a*stockPricesSort[i-1][0]+b*stockPricesSort[i-1][1]);
            }
        }
//         使用浮点数精度会丢失
//         double k=(double)(stockPricesSort[1][1]-stockPricesSort[0][1])/(stockPricesSort[1][0]-stockPricesSort[0][0]);
//         for(int i=2;i<len;i++){
//             double tmp=(double)(stockPricesSort[i][1]-stockPricesSort[i-1][1])/(stockPricesSort[i][0]-stockPricesSort[i-1][0]);
//             if(tmp!=k){
//                 res++;
//                 k=tmp;
//             }
//         }
        return res;

    }
}
```



### 第四题：尝试解答，直接超时

### 参考链接

[(5条消息) 判断几个点是否在同一条直线上（计算几何）_bbbblzy的博客-CSDN博客_判断两点在一条直线上](https://blog.csdn.net/bbbblzy/article/details/79380815)