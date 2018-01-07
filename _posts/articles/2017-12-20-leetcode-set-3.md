---
layout: post
title: Leetcode Set 3
excerpt: "A set of 5 leetcode problems with solutions and explanations"
categories: articles
tags: [algorithms, leetcode, data_structures]
author: riken_shah
comments: true
share: true
modified: 2017-12-20T14:18:57-04:00
published: true
---

### 1. Count and Say

Find problem details here : [https://leetcode.com/problems/count-and-say/#/description](https://leetcode.com/problems/count-and-say/#/description)

1 is read off as "one 1" or 11.
11 is read off as "two 1s" or 21.
21 is read off as "one 2, then one 1" or 1211.

Given an integer n, generate the nth term of the count-and-say sequence. 

#### My Accepted Solution :

```python
class Solution(object):
    
    def forOne(self,num):
        nstr = str(num)
        pre = nstr[0]
        count = 1
        s = ''
        if len(nstr) == 1:
            s = str(count) + str(num)
            return s
        else:
            for i in nstr[1:]:
                if i == pre:
                    count = count + 1
                else:
                    s = s + str(count) + pre
                    pre = i
                    count = 1
                    
        s = s + str(count) + nstr[-1]
        return s
    
    def countAndSay(self, n):
        """
        :type n: int
        :rtype: str
        """
        init = "1"
        if n == 1:
            return init
            
        else:
            for i in range(n-1):
                init = self.forOne(init)
                # print init
                
        return init
```

#### Other solution

```java
public class Solution {
    public String countAndSay(int n) {
        String s = "1";
        for (int i = 1; i < n; i++) {
            StringBuilder sb = new StringBuilder();
            for (int j = 1, count = 1; j <= s.length(); j++) {
                if (j == s.length() || s.charAt(j - 1) != s.charAt(j)) {
                    sb.append(count);
                    sb.append(s.charAt(j - 1));
                    count = 1;
                } else {
                    count++;
                }
            }
            s = sb.toString();
        }
        return s;
    }
}
```

#### Some Awesome Solutions

##### Using regex

```python
def countAndSay(self, n):
    s = '1'
    for _ in range(n - 1):
        s = re.sub(r'(.)\1*', lambda m: str(len(m.group(0))) + m.group(1), s)
    return s
```

##### Using Regex

```python
def countAndSay(self, n):
    s = '1'
    for _ in range(n - 1):
        s = ''.join(str(len(group)) + digit
                    for group, digit in re.findall(r'((.)\2*)', s))
    return s
```

##### Using groupby

```python
def countAndSay(self, n):
    s = '1'
    for _ in range(n - 1):
        s = ''.join(str(len(list(group))) + digit
                    for digit, group in itertools.groupby(s))
    return s
```

---

### 2. Delete node in Linked List

Find problem details here : [https://leetcode.com/problems/delete-node-in-a-linked-list/description/](https://leetcode.com/problems/delete-node-in-a-linked-list/description/)

#### My Accepted Solution :

```python
# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def deleteNode(self, node):
        """
        :type node: ListNode
        :rtype: void Do not return anything, modify node in-place instead.
        """
        while node.next:
            node.val = node.next.val
            pre = node
            node = node.next
            
        pre.next = None
```

#### Other Solutions

Can not actually delete the current node, hence deleting the next node and updating the value of current with next and pointer of next to next.next.

```python
def deleteNode(self, node):
    node.val = node.next.val
    node.next = node.next.next
```

---

### 3. Happy Number

Find problem details here : [https://leetcode.com/problems/happy-number/description/](https://leetcode.com/problems/happy-number/description/)

Write an algorithm to determine if a number is "happy".

A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

Example: 19 is a happy number

    12 + 92 = 82
    82 + 22 = 68
    62 + 82 = 100
    12 + 02 + 02 = 1


#### My Accepted Solution :

```python
class Solution(object):
    history = {}
    def isHappy(self, n):
        """
        :type n: int
        :rtype: bool
        """
        history = {}
        return self.isNumHappy(n,history)
     
    def isNumHappy(self,n,history):
        print n
        if n == 0:
            return False
        
        if n == 1:
            return True
        else:
            print history
            temp = 0
            for i in str(n):
                temp += int(i)**2
            if temp in history:
                print str(temp)+ " is in history"
                return False
            history[temp] = 1
            return self.isNumHappy(temp,history)
```

#### Other Solutions

The idea is to use one hash set to record sum of every digit square of every number occurred. Once the current sum cannot be added to set, return false; once the current sum equals 1, return true;

```java
public boolean isHappy(int n) {
    Set<Integer> inLoop = new HashSet<Integer>();
    int squareSum,remain;
    while (inLoop.add(n)) {
        squareSum = 0;
        while (n > 0) {
            remain = n;
            squareSum += remain*remain;
            n /= 10;
        }
        if (squareSum == 1)
            return true;
        else
            n = squareSum;
    }
    return false;
}
```

```python
def isHappy(self, n):
    mem = set()
    while n != 1:
        n = sum([int(i) ** 2 for i in str(n)])
        if n in mem:
            return False
        else:
            mem.add(n)
    else:
        return True
```

---

### 4. Jump Game

Find problem details here : [https://leetcode.com/problems/jump-game/#/description](https://leetcode.com/problems/jump-game/#/description)

Given an array of non-negative integers, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Determine if you are able to reach the last index.

For example:
A = [2,3,1,1,4], return true.

A = [3,2,1,0,4], return false. 

#### My Accepted Solution :

```c++
class Solution {
public:
    bool canJump(vector<int>& nums) {
        int i,j;
        bool answer = false,zero_present = false;
        if(nums.size()==1)
        {
            return true;
        }
        if(nums[0]==0)
        {
            return false;
        }
        for(i=nums.size()-2;i>=0;i--)
        {
            //cout<<nums[i]<<endl;
            if(nums[i]==0)
            {
                zero_present = true;
                for(j=1;(i-j)>=0;j++)
                {
                    if(nums[(i-j)]>j)
                    {
                        answer = true;
                        break;
                    }
                }
                if((i-j)==-1)
                {
                    //cout<<"It should be here"<<endl;
                    answer = false;
                    break;
                }
            }
        }
        if(!zero_present){
            return true;
        }
    
        return answer;
        
    }
};
```

#### Other Solutions

From start keep record of max index that we could reach. If at any point this condition is violated, we break.

```c++
public boolean canJump(int[] A) {
    int max = 0;
    for(int i=0;i<A.length;i++){
        if(i>max) {return false;}
        max = Math.max(A[i]+i,max);
    }
    return true;
}
```

___

### 5. Letter Combinations

Find Problem Details here : [https://leetcode.com/problems/letter-combinations-of-a-phone-number/#/description](https://leetcode.com/problems/letter-combinations-of-a-phone-number/#/description)

#### My Accepted Solution : 

Standard two pass solution. 

```python
class Solution(object):
    
    def makeCombinations(self,a,b):
        answer = []
        if(len(a) == 0 and len(b) > 0):
            return b
        elif(len(a) > 0 and len(b) == 0):
            return a
        else:
            for i in a:
                for j in b:
                    answer.append(i+j)
                    
            return answer
    
    def letterCombinations(self, digits):
        """
        :type digits: str
        :rtype: List[str]
        """
        mapping = [[],[],['a','b','c'],['d','e','f'],['g','h','i'],['j','k','l'],['m','n','o'],['p','q','r','s'],['t','u','v'],['w','x','y','z']]
        
        answer = []
        for d in digits:
            answer = self.makeCombinations(answer, mapping[int(d)])
            
        return answer
```

#### Other solutions

Very smart solution using FIFO queue. The combinations are made on the go.

```java
public List<String> letterCombinations(String digits) {
    LinkedList<String> ans = new LinkedList<String>();
    String[] mapping = new String[] {"0", "1", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};
    ans.add("");
    for(int i =0; i<digits.length();i++){
        int x = Character.getNumericValue(digits.charAt(i));
        while(ans.peek().length()==i){
            String t = ans.remove();
            for(char s : mapping[x].toCharArray())
                ans.add(t+s);
        }
    }
    return ans;
}
```