---
layout: post
title: Leetcode Set 5 - General Frameworks
excerpt: "A general framework for standard problems"
categories: articles
tags: [algorithms, leetcode, data_structures]
author: riken_shah
comments: true
share: true
modified: 2017-12-25T14:18:57-04:00
published: false
---

### 1. Reverse Polish Notations

Find problem details here : [https://leetcode.com/problems/evaluate-reverse-polish-notation/description/](https://leetcode.com/problems/evaluate-reverse-polish-notation/description/)

 Evaluate the value of an arithmetic expression in Reverse Polish Notation.

Valid operators are `+, -, *, /`. Each operand may be an integer or another expression.
Some examples:
```
  ["2", "1", "+", "3", "*"] -> ((2 + 1) * 3) -> 9
  ["4", "13", "5", "/", "+"] -> (4 + (13 / 5)) -> 6
```

#### My TLE Solution :/

I tried to mimic real life approach of solving it one expression by one. However, stack is the right way to go.

```java
class Solution {
    public static boolean isNumeric(String str)  
    {  
      try  
      {  
        double d = Double.parseDouble(str);  
      }  
      catch(NumberFormatException nfe)  
      {  
        return false;  
      }  
      return true;  
    }
    
    public int evalRPN(String[] tokens) {
        // iterate till first operator 
        // process the previous two
        // repeat
        LinkedList<String> ll = new LinkedList<String>(Arrays.asList(tokens));
        int index = 0;
        if(tokens.length == 1){
            return Integer.parseInt(tokens[0]);
        }
        int lengthT = tokens.length;
        while(index<lengthT){
            String curr = ll.get(index);
            if(!isNumeric(curr) && lengthT>1){
                int num1 = Integer.parseInt(ll.get(index-2));
                int num2  =  Integer.parseInt(ll.get(index-1));
                // System.out.println(index+" "+num1+" "+num2);
                ll.remove(index-2);
                ll.remove(index-2);
                ll.remove(index-2);
                String ans = "";
                switch(curr.charAt(0)){
                    case '+':
                        ans = Integer.toString(num1+num2);
                        break;
                    case '-':
                        ans = Integer.toString(num1-num2);
                        break;
                    case '/':
                        ans = Integer.toString(num1/num2);
                        break;
                    case '*':
                        ans = Integer.toString(num1*num2);
                        break;
                    default:
                        return 0;
                }
                ll.add(index-2, ans);
                index-=2;
                lengthT-=2;
                // System.out.println(ll);
            }
            index++;
        }
        // System.out.println("Final ans is "+ll.get(0));
        return Integer.parseInt(ll.get(0));
    }
}
```

#### Other Solutions

```java
import java.util.Stack;

public class Solution {
    public int evalRPN(String[] tokens) {
        int a,b;
    Stack<Integer> S = new Stack<Integer>();
    for (String s : tokens) {
      if(s.equals("+")) {
        S.add(S.pop()+S.pop());
      }
      else if(s.equals("/")) {
        b = S.pop();
        a = S.pop();
        S.add(a / b);
      }
      else if(s.equals("*")) {
        S.add(S.pop() * S.pop());
      }
      else if(s.equals("-")) {
        b = S.pop();
        a = S.pop();
        S.add(a - b);
      }
      else {
        S.add(Integer.parseInt(s));
      }
    } 
    return S.pop();
  }
}
```
___

# Remove Element 

Find problem details here : [https://leetcode.com/problems/remove-element](https://leetcode.com/problems/remove-element)



#### My Accepted Solution :

```c++
class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        nums.erase( remove( nums.begin(), nums.end(), val ), nums.end() );
        return nums.size();
    }
};
```

#### Some other solution

```c++
int removeElement(int A[], int n, int elem) {
    int begin=0;
    for(int i=0;i<n;i++) if(A[i]!=elem) A[begin++]=A[i];
    return begin;
}
```
See whole article here - https://leetcode.com/articles/remove-element/
