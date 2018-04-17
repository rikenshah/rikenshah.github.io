---
layout: post
title: Leetcode Set 4
excerpt: "A set of 5 leetcode problems with solutions and explanations"
categories: articles
tags: [algorithms, leetcode, data_structures]
author: riken_shah
comments: true
share: true
modified: 2017-12-21T14:18:57-04:00
published: false
---

### 1.  Non-Overalapping Intervals

Find problem details here : [https://leetcode.com/problems/non-overlapping-intervals/description/](https://leetcode.com/problems/non-overlapping-intervals/description/)

Given intervals, remove minimum overlapping intervals to make the remaining intervals non overlapping.

#### My Accepted Solution :

Sort the intervals in the order of their finish times and then check in linear fashion.

```python
# Definition for an interval.
# class Interval(object):
#     def __init__(self, s=0, e=0):
#         self.start = s
#         self.end = e

class Solution(object):
    def eraseOverlapIntervals(self, intervals):
        """
        :type intervals: List[Interval]
        :rtype: int
        """
        if not intervals:
            return 0
        intervals = sorted(intervals, key = lambda x:x.end)
        i = 0
        n = len(intervals)
        count = 0
        while i<n-1:
            first = intervals[i]
            second = intervals[i+1]
            if second.start < first.end:
                intervals.remove(second)
                i-=1
                n-=1
                count+=1
            i+=1
        return count
```

#### Other Solutions

```python
def eraseOverlapIntervals(self, intervals):
    end = float('-inf')
    erased = 0
    for i in sorted(intervals, key=lambda i: i.end):
        if i.start >= end:
            end = i.end
        else:
            erased += 1
    return erased
```

Custom comparator function in java

```java
public int eraseOverlapIntervals(Interval[] intervals) {
    if (intervals.length == 0)  return 0;

    Arrays.sort(intervals, new myComparator());
    int end = intervals[0].end;
    int count = 1;        

    for (int i = 1; i < intervals.length; i++) {
        if (intervals[i].start >= end) {
            end = intervals[i].end;
            count++;
        }
    }
    return intervals.length - count;
}

class myComparator implements Comparator<Interval> {
    public int compare(Interval a, Interval b) {
        return a.end - b.end;
    }
}
```

---

### 2. Number Complement 

Find problem details here : [https://leetcode.com/problems/number-complement/#/description](https://leetcode.com/problems/number-complement/#/description)

Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.

Note:

The given integer is guaranteed to fit within the range of a 32-bit signed integer.
You could assume no leading zero bit in the integer’s binary representation.


#### My Accepted Solution :

Both cpp solutions.

```c++
class Solution {
public:
    int findComplement(int num) {
        int temp = num;
        int count = 1;
        while(temp!=1){
            temp /= 2;
            count ++;
        }
        int xor_term = pow(2,count)-1;
        return num ^ xor_term;
    }
};
```

#### Other Solutions

```c++
class Solution {
public:
    int findComplement(int num) {
        unsigned mask = ~0;
        while (num & mask) mask <<= 1;
        return ~mask & ~num;
    }
};
```

---

### 3.  Permutations

Find problem details here : [https://leetcode.com/problems/permutations/description/](https://leetcode.com/problems/permutations/description/)

#### My Accepted Solution :

```python
class Solution(object):
    def permute(self, nums):
        """
        :type nums: List[int]
        :rtype: List[List[int]]
        """
        if not nums:
            return []
        
        if len(nums) == 1:
            return [nums]
        
        all_poss = [[nums[0]]]
        
        for ele in nums[1:]:
            #print all_poss
            tempList = []
            for j,ap in enumerate(all_poss):
                #print ap
                for k in range(len(ap)+1):
                    temp = ap[:]
                    temp.insert(k,ele)
                    tempList.append(temp)
                    #print tempList
            all_poss = tempList[:]
                
        return all_poss
```

#### Other Solutions

```python
def permute(self, nums):
    return [[n] + p
            for i, n in enumerate(nums)
            for p in self.permute(nums[:i] + nums[i+1:])] or [[]]
```

Libraries

```python
def permute(self, nums):
    return list(itertools.permutations(nums))
```

See [this post](https://rikenshah.github.io/articles/leetcode-set-5/) for more details.

---

### 4. Pow(x,n)

Find problem details here : [https://leetcode.com/problems/powx-n/#/description](https://leetcode.com/problems/powx-n/#/description)

Implement pow(x, n). 

#### My Accepted Solution :

Here to reduce time required we use recursive solution, however it is not the most efficient one, sicne many overlapping sub problems are there.

```c++
class Solution {
public:
    double myPow(double x, int n) {
        if(x==0){
            return 0;
        }
        if(n==1){
            return x;
        }
        else if(n==0){
            return 1.0;
        }
        else if(n==-1){
            return 1.0/x;
        }
        else if(abs(n%2)==1){
            if(n>0)
                return myPow(x,(n/2)+1)*myPow(x,(n/2));
            else
                return myPow(x,(n/2)-1)*myPow(x,(n/2));
        }
        else{
            return myPow(x,n/2)*myPow(x,n/2);
        }
    }
};
```

#### Other Solutions

```c++
public class Solution {
    public double pow(double x, int n) {
        if(n == 0)
            return 1;
        if(n<0){
            n = -n;
            x = 1/x;
        }
        return (n%2 == 0) ? pow(x*x, n/2) : x*pow(x*x, n/2);
    }
}
```

---

### 5. Remove Duplicates

Find problem details here : [https://leetcode.com/problems/remove-duplicates-from-sorted-array/\#/description](https://leetcode.com/problems/remove-duplicates-from-sorted-array/#/description)

 Given a sorted array, remove the duplicates in-place such that each element appear only once and return the new length.

#### My Accepted Solution :

```c++
class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        if(nums.size() < 2)  return nums.size();
        else{
            int ptr = nums[0];
            int length = nums.size();
            for(int i=1;i<length;i++){
                if(ptr == nums[i]){
                    nums.erase(nums.begin()+i);
                    length = nums.size();
                    i--; // Very important
                } 
                else{
                    ptr = nums[i];
                }
            }
            return nums.size();
        }
    }
};
```

#### Two pointers appproach - equally efficient as my solution

Since the array is already sorted, we can keep two pointers iii and jjj, where iii is the slow-runner while jjj is the fast-runner. As long as nums\[i\]=nums\[j\]nums\[i\] = nums\[j\]nums\[i\]=nums\[j\], we increment jjj to skip the duplicate.  
When we encounter nums\[j\]≠nums\[i\]nums\[j\] ≠ nums\[i\]nums\[j\]≠nums\[i\], the duplicate run has ended so we must copy its value to nums\[i+1\]nums\[i + 1\]nums\[i+1\]. iii is then incremented and we repeat the same process again until jjj reaches the end of array.

```c++
public int removeDuplicates(int[] nums) {
    if (nums.length == 0) return 0;
    int i = 0;
    for (int j = 1; j < nums.length; j++) {
        if (nums[j] != nums[i]) {
            i++;
            nums[i] = nums[j];
        }
    }
    return i + 1;
}
```

Nice Java code, different logic

```java
public int removeDuplicates(int[] A) {
    if (A.length==0) return 0;
    int j=0;
    for (int i=0; i<A.length; i++)
        if (A[i]!=A[j]) A[++j]=A[i];
    return ++j;
}
```

Other approach

```java
public int removeDuplicates(int[] nums) {
    int i = nums.length > 0 ? 1 : 0;
    for (int n : nums)
        if (n > nums[i-1])
            nums[i++] = n;
    return i;
}
```