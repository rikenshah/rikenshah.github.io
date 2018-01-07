---
layout: post
title: Leetcode Set 2
excerpt: "A set of 5 leetcode problems with solutions and explanations"
categories: articles
tags: [algorithms, leetcode]
author: riken_shah
comments: true
share: true
modified: 2017-11-24T14:18:57-04:00
published: true
---

### 1. Implement StrStr

Find problem details here : [https://leetcode.com/problems/implement-strstr/description/](https://leetcode.com/problems/implement-strstr/description/)

Find needle in haystack.

#### My Accepted Solution :

Many edge cases has to be taken care of. However, check other solution which smartly handles all test cases.

```java
class Solution {
    public int strStr(String haystack, String needle) {
        int m = needle.length();
        int n = haystack.length();
        if(m>n) return -1;
        if(m==0 && n!=0) return 0;
        if(m == 0 && n == 0) return 0;
        if(m == 0 || n == 0) return -1;
        for(int i=0;i<=n-m;i++){
            boolean flag = true;
            for(int j=0; j<m;j++){
                if(needle.charAt(j) != haystack.charAt(i+j)){
                    flag = false;
                    break;
                }
            }
            if (flag){
                return i;
            }
        }
        return -1;
    }
}
```

#### Other Solutions

Very elegant solution. All edge cases are taken care of.

```java
public int strStr(String haystack, String needle) {
  for (int i = 0; ; i++) {
    for (int j = 0; ; j++) {
      if (j == needle.length()) return i;
      if (i + j == haystack.length()) return -1;
      if (needle.charAt(j) != haystack.charAt(i + j)) break;
    }
  }
}
```

---

### 2.  K Pairs with smallest sums

Find problem details here : [https://leetcode.com/problems/find-k-pairs-with-smallest-sums/description/](https://leetcode.com/problems/find-k-pairs-with-smallest-sums/description/)

 You are given two integer arrays nums1 and nums2 sorted in ascending order and an integer k. Define a pair (u,v) which consists of one element from the first array and one element from the second array. Find the k pairs (u1,v1),(u2,v2) ...(uk,vk) with the smallest sums.

Example 1:
Given nums1 = [1,7,11], nums2 = [2,4,6],  k = 3

Return: [1,2],[1,4],[1,6]

The first 3 pairs are returned from the sequence:
[1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]

#### My Accepted Solution :

Limiting till k allows to reduce computations. But can be further improved.

```python
class Solution(object):
    def kSmallestPairs(self, nums1, nums2, k):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :type k: int
        :rtype: List[List[int]]
        """
        if k<=0:
            return []
        
        tupleList = []
        for i in nums1[:k]:
            for j in nums2[:k]:
                tupleList.append((i,j))
                
        tupleList.sort(key = sum)
        return tupleList[:k]
```

#### Other Solutions

Most efficient -  We maintain a min heap of first k pairs and 
keep taking one one entry off.

[See this link](https://leetcode.com/problems/find-k-pairs-with-smallest-sums/discuss/84551) for more detailed explanation.

```java
public class Solution {
    public List<int[]> kSmallestPairs(int[] nums1, int[] nums2, int k) {
        PriorityQueue<int[]> que = new PriorityQueue<>((a,b)->a[0]+a[1]-b[0]-b[1]);
        List<int[]> res = new ArrayList<>();
        if(nums1.length==0 || nums2.length==0 || k==0) return res;
        for(int i=0; i<nums1.length && i<k; i++) que.offer(new int[]{nums1[i], nums2[0], 0});
        while(k-- > 0 && !que.isEmpty()){
            int[] cur = que.poll();
            res.add(new int[]{cur[0], cur[1]});
            if(cur[2] == nums2.length-1) continue;
            que.offer(new int[]{cur[0],nums2[cur[2]+1], cur[2]+1});
        }
        return res;
    }
}
```

More elaborate solution

```java
public class Solution {
    class Pair{
        int[] pair;
        int idx; // current index to nums2
        long sum;
        Pair(int idx, int n1, int n2){
            this.idx = idx;
            pair = new int[]{n1, n2};
            sum = (long) n1 + (long) n2;
        }
    }
    class CompPair implements Comparator<Pair> {
        public int compare(Pair p1, Pair p2){
            return Long.compare(p1.sum, p2.sum);
        }
    }
    public List<int[]> kSmallestPairs(int[] nums1, int[] nums2, int k) {
        List<int[]> ret = new ArrayList<>();
        if (nums1==null || nums2==null || nums1.length ==0 || nums2.length ==0) return ret;
        int len1 = nums1.length, len2=nums2.length;  

        PriorityQueue<Pair> q = new PriorityQueue(k, new CompPair()); 
        for (int i=0; i<nums1.length && i<k ; i++) { // only need first k number in nums1 to start  
            q.offer( new Pair(0, nums1[i],nums2[0]) );
        }
        for (int i=1; i<=k && !q.isEmpty(); i++) { // get the first k sums
            Pair p = q.poll(); 
            ret.add( p.pair );
            if (p.idx < len2 -1 ) { // get to next value in nums2
                int next = p.idx+1;
                q.offer( new Pair(next, p.pair[0], nums2[next]) );
            }
        }
        return ret;
    }
}  
```

Other Solution

```python
def kSmallestPairs(self, nums1, nums2, k):
    streams = map(lambda u: ([u+v, u, v] for v in nums2), nums1)
    stream = heapq.merge(*streams)
    return [suv[1:] for suv in itertools.islice(stream, k)]
```

---

### 3. Longest Substring Without Repeating Characters 

Find problem details here : [https://leetcode.com/problems/longest-substring-without-repeating-characters/description/](https://leetcode.com/problems/longest-substring-without-repeating-characters/description/)

Given a string, find the length of the longest substring without repeating characters.

Examples:

Given "abcabcbb", the answer is "abc", which the length is 3.

Given "bbbbb", the answer is "b", with the length of 1.

Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

#### My Accepted Solution :

Start with an empty current string. Keep on adding characters till a repeated character is found. Update count whenever a repeated character is found.

```java
class Solution {
    public int lengthOfLongestSubstring(String s) {
        String current = "";
        int count = 0;
        for(int i=0;i<s.length();i++){
            int found_index = current.indexOf(s.charAt(i));
            if(found_index != -1){
                count = Math.max(count,current.length());
                current = current.substring(found_index+1);
            }
            current += s.charAt(i);
        }
        count = Math.max(count,current.length());
        return count;
    }
}
```

#### Other Solutions

```java
public class Solution {
    public int lengthOfLongestSubstring(String s) {
        int result = 0;
        int[] cache = new int[256];
        for (int i = 0, j = 0; i < s.length(); i++) {
            j = (cache[s.charAt(i)] > 0) ? Math.max(j, cache[s.charAt(i)]) : j;
            cache[s.charAt(i)] = i + 1;
            result = Math.max(result, i - j + 1);
        }
        return result;
    }
}
```

---

### 4. Same Tree

Find problem details here : [https://leetcode.com/problems/same-tree/description/](https://leetcode.com/problems/same-tree/description/)

 Given two binary trees, write a function to check if they are the same or not. Two binary trees are considered the same if they are structurally identical and the nodes have the same value. 

#### My Accepted Solution :

```python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def isSameTree(self, p, q):
        """
        :type p: TreeNode
        :type q: TreeNode
        :rtype: bool
        """
        if p == None and q == None:
            return True
    
        while p!=None:
            if q == None:
                return False
            if p.val == q.val:
                return self.isSameTree(p.left,q.left) & self.isSameTree(p.right,q.right)
            else:
                return False
            
        return False
```

#### Other Solutions

```java
public boolean isSameTree(TreeNode p, TreeNode q) {
    if(p == null && q == null) return true;
    if(p == null || q == null) return false;
    if(p.val == q.val)
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right);
    return false;
}
```

---

### 5. Binary Tree Paths

Find problem details here : [https://leetcode.com/problems/binary-tree-paths/description/](https://leetcode.com/problems/binary-tree-paths/description/)

#### My Accepted Solution :

```python
# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution(object):
    def binaryTreePaths(self, root):
        """
        :type root: TreeNode
        :rtype: List[str]
        """
        if not root:
            return []
        
        current_path = ""
        visited = {}
        path_list = []
        return self.dfs_travel(root,current_path,path_list)
        
    def dfs_travel(self,root,current_path, path_list):
        if root.left:
            self.dfs_travel(root.left,current_path+ str(root.val) + "->",path_list)
        if root.right:
            self.dfs_travel(root.right,current_path+ str(root.val) + "->",path_list)
        if not root.left and not root.right:
            # print root.val
            current_path += str(root.val)
            path_list.append(current_path)

        return path_list
```

#### Other Solutions

Smart recursive solution. With each call, we append the appropriate values. 

```java
public List<String> binaryTreePaths(TreeNode root) {
    List<String> answer = new ArrayList<String>();
    if (root != null) searchBT(root, "", answer);
    return answer;
}
private void searchBT(TreeNode root, String path, List<String> answer) {
    if (root.left == null && root.right == null) answer.add(path + root.val);
    if (root.left != null) searchBT(root.left, path + root.val + "->", answer);
    if (root.right != null) searchBT(root.right, path + root.val + "->", answer);
}
```