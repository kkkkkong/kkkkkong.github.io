---
title: leetcode 20
tags: 刷题
category: leetcode
abbrlink: 39266
date: 2023-01-02 20:29:57
---

## 题目描述



给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

有效字符串需满足：

左括号必须用相同类型的右括号闭合。
左括号必须以正确的顺序闭合。
每个右括号都有一个对应的相同类型的左括号。

[20. 有效的括号 - 力扣（LeetCode）](https://leetcode.cn/problems/valid-parentheses/)

## 解题思路

使用栈辅助存储左括号，来进行匹配

```java
class Solution {
    public boolean isValid(String s) {
        if(s.length()%2!=0)return false;
        Stack<Character> stack=new Stack();
        for(int i=0;i<s.length();i++){
            char a=s.charAt(i);
            if(a=='{'||a=='['||a=='('){
                stack.push(a);
            }
            else{
                if(stack.isEmpty()){
                    return false;
                }
                if(a=='}'){
                    if(stack.pop()!='{'){
                        return false;
                    }
                }
                else if(a==']'){
                    if(stack.pop()!='['){
                        return false;
                    }
                }
                else if(a==')'){
                    if(stack.pop()!='('){
                        return false;
                    }
                }
            }
        }
        if(!stack.isEmpty()){
            return false;
        }
        return true;

    }
}
```

写完通过后，看了别人的解法，可以说是相当简洁

```java
class Solution {
    public boolean isValid(String s) {
        Stack<Character>stack = new Stack<Character>();
        for(char c: s.toCharArray()){
            if(c=='(')stack.push(')');
            else if(c=='[')stack.push(']');
            else if(c=='{')stack.push('}');
            else if(stack.isEmpty()||c!=stack.pop())return false;
        }
        return stack.isEmpty();
    }
}
```

