---
layout: post
title: Leetcode Set 1
excerpt: "A set of 5 leetcode problems with solutions and explanations"
categories: articles
tags: [algorithms, leetcode]
author: riken_shah
comments: true
share: true
modified: 2017-11-30T14:18:57-04:00
published: true
---
# Set 1

### 1. Two Sum II - Input array is sorted

Find problem details here : [https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/)

Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based. You may assume that each input would have exactly one solution and you may not use the same element twice.
Input: numbers={2, 7, 11, 15}, target=9
Output: index1=1, index2=2 

#### My Accepted Solution :

Using a single pass two pointers approach, one from front and second from end, moved appropriately.

```java
class Solution {
    public int[] twoSum(int[] numbers, int target) {
        int i = 0, current;
        int j = numbers.length - 1;
        while(i<j){
            current = numbers[i] + numbers[j];
            if(current > target){
                j--;
            }
            if(current < target){
                i++;
            }
            if(current == target){
                return new int[] {i+1,j+1}; // Nice way to return an array
            }
        }
        return new int[0];
    }
}
```

#### Other Solution

```java
public int[] twoSum(int[] numbers, int target) {
    int l = 0, r = numbers.length - 1;
    // This will go in infinite loop if not present
    while (numbers[l] + numbers[r] != target) {
        if (numbers[l] + numbers[r] > target) r--;
        else l++;
    }
    return new int[]{l + 1, r + 1};
}
```

---

### 2. Binary Tree Inorder Traversal

Given a binary tree, return the inorder traversal of its nodes' values.

Find problem details here : [https://leetcode.com/problems/binary-tree-inorder-traversal/description/](https://leetcode.com/problems/binary-tree-inorder-traversal/description/)

#### My Accepted Solution :

Normal recursive solution. Pretty straight forward.

```python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def inorderTraversal(self, root):
        """
        :type root: TreeNode
        :rtype: List[int]
        """
        traversal = []
        return self.myfun(root,traversal)
        
    
    def myfun(self,root,traversal):
        if not root:
            return []
        if root.left:
            traversal = self.myfun(root.left, traversal)
        traversal.append(root.val)
        if root.right:
            traversal = self.myfun(root.right,traversal)
            
        print traversal
        return traversal
```

#### Accepted Java solution

Similar solution as above just in java.

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public List<Integer> inorderTraversal(TreeNode root) {
        List<Integer> list = new ArrayList<Integer>();
        myfun(list,root);
        return list;
    }
    public void myfun(List<Integer> list,TreeNode root){
        if(root!=null){
            myfun(list,root.left);
            list.add(root.val);
            myfun(list,root.right);
        }
    }
}
```

#### Java iterative solution

Using iterative solutions for tree problems is advisable due to the larger memery requirements of the recursive calls. Using a stack to solve the above problem.

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public List<Integer> inorderTraversal(TreeNode root) {
        List<Integer> list = new ArrayList<Integer>();
        Stack<TreeNode> stack = new Stack<TreeNode>();
        while(root!=null || !stack.empty()){
            if(root != null){
                stack.add(root);
                root = root.left;
            }
            else{
                root = stack.pop();
                list.add(root.val);
                root = root.right;
            }
        }
        return list;
    }
}
```

---

### 3. Base 7

Find problem details here : [https://leetcode.com/problems/base-7/description/](https://leetcode.com/problems/base-7/description/)

Given an integer, return its base 7 string representation.
Input: 100
Output: "202"

#### My Accepted Solution :

The approach is like how we do on paper.

```java
class Solution {
    public String convertToBase7(int num) {
        StringBuilder ans = new StringBuilder(); // Advanced string manipulation class
        boolean negative = false;
        if(num<0){
            negative = true;
            num*=-1;
        }
        else if(num == 0){
            return "0";
        }
        // Main logic to convert the base and make a string
        while(num>0){
            int remainder = num%7;
            ans.append(remainder); // append method
            num = num/7;
        }
        // ans is in reversed form
        if(negative){
            return ans.reverse().insert(0,"-").toString(); // insert method
        }
        return ans.reverse().toString();
    }
}
```

#### Other Solutions

Very nice recursive solution

```java
public String convertTo7(int num) {
    if (num < 0)
        return '-' + convertTo7(-num);
    if (num < 7)
        return num + ""; // to convert to string
    return convertTo7(num / 7) + num % 7; // appending last since we get answer in reverse form
}
```

One liner

```java
    // method toString takes the radix as an argument
    return Integer.toString(num, 7);
    // method parseInt also takes a second argument as radix
    return Integer.toString(Integer.parseInt(number, base1), base2);
```

---

### 4. BinTreeLevelOrderTraversal

Find problem details here : [
https://leetcode.com/problems/binary-tree-level-order-traversal/#/description](
https://leetcode.com/problems/binary-tree-level-order-traversal/#/description)

Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

For example:
Given binary tree [3,9,20,null,null,15,7],

```
    3
   / \
  9  20
    /  \
   15   7
```

return its level order traversal as:

```
[
  [3],
  [9,20],
  [15,7]
]
```

#### My Accepted Solution :

Making a dictionary of [index,list] where index is the level and the list is the list of all nodes in that level.

```python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):        
    def levelOrder(self, root):
        """
        :type root: TreeNode
        :rtype: List[List[int]]
        """
        tempDict = {}
        if root == None:
            return []
        tempDict = self.BFS(root,0,tempDict)
        resultList = []
        for key,value in tempDict.iteritems():  
            resultList.append(value)
        return resultList
    
    def BFS(self,root,index,tempDict):
        if not tempDict.has_key(index):
            tempDict[index] = []    
        tempDict[index].append(root.val)
        if root.left!=None:
            self.BFS(root.left,index+1,tempDict)
        
        if root.right!=None:
            self.BFS(root.right,index+1,tempDict)
          
        return tempDict
```

#### Other Solutions

Following java solution uses queue in order to avoid recursive implementation.

```java
List<List<Integer>> res = new ArrayList<>();  
if (root == null) return res;  
// Queue is an interface hence we can not declare an object of its type, only reference can be there.
// Another way would be Queue<Integer> q = new ArrayDeque<Integer>();
Queue<TreeNode> queue = new LinkedList<>();  
queue.add(root);  
while (!queue.isEmpty()) {  
    List<Integer> level = new ArrayList<>();  
    int cnt = queue.size();   
    // this loop will run for all nodes in a particular level
    for (int i = 0; i < cnt; i++) {  
        TreeNode node = queue.poll();  
        level.add(node.val);  
        if (node.left != null) {  
            queue.add(node.left);  
        }
        if (node.right != null) {  
            queue.add(node.right);  
        }  
    }  
    res.add(level);   
}  
return res;
```

Following is a normal recursive java solution.

```java
public List<List<Integer>> levelOrder(TreeNode root) {
        List<List<Integer>> res = new ArrayList<List<Integer>>();
        levelHelper(res, root, 0);
        return res;
    }
    
    public void levelHelper(List<List<Integer>> res, TreeNode root, int height) {
        if (root == null) return;
        if (height >= res.size()) {
            res.add(new LinkedList<Integer>());
        }
        res.get(height).add(root.val);
        levelHelper(res, root.left, height+1);
        levelHelper(res, root.right, height+1);
    }
```

---

### 5. Climbing Stairs

Find problem details here : [https://leetcode.com/problems/climbing-stairs/description](https://leetcode.com/problems/climbing-stairs/description)

You are climbing a stair case. It takes n steps to reach to the top. Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
Note: Given n will be a positive integer.

Example:
Input: 2
Output:  2
Explanation:  There are two ways to climb to the top.

1. 1 step + 1 step
2. 2 steps


#### My Accepted Solution :

This is a nice dp solution. At any step (even at last step) either you can take 1 step or 2 steps (hence count(i-1)+count(i-2)). 

```python
class Solution(object):
    def climbStairs(self, n):
        """
        :type n: int
        :rtype: int
        """
        count = {0:0,1:1,2:2}
        for i in range(3,n+1):
            count[i] = count[i-1]+count[i-2]
            
        return count[n]
```


#### Top Down

```python
class Solution(object):
    def climbStairs(self, n):
        """
        :type n: int
        :rtype: int
        """
        count = {0:0,1:1,2:2}
        return self.countSteps(n,count)
    
    def countSteps(self,n,count):
        
        if n in count:
            return count[n]
        else:
            return self.countSteps(n-1,count) + self.countSteps(n-2,count)
```