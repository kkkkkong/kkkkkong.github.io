---
date: 12:00:00
title: "Java 二维数组排序"
author: "kong"
tags: [java ,排序]
---

### Java 二维数组排序

按照第一个元素升序排序，如果第一个元素相同，则按照第二个元素升序排序

```java
int [][]people=new int[4][2];
Arrays.sort(people, new Comparator<int[]>() {
    @Override
    public int compare(int[] o1, int[] o2) {
        if (o1[0]==o2[0]) return o1[1]-o2[1];
            return o1[0]-o2[0];
        }
});
```

如果需要降序排序，将返回值加负号
