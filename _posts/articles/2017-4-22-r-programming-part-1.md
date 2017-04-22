---
layout: post
title: R Programming - Part 1
excerpt: "R programming tutorials"
categories: articles
tags: [R]
author: riken_shah
comments: true
share: true
modified: 2017-04-22T14:18:57-04:00
published: true
---

### Basic Building Blocks

```R
> 5 + 7
[1] 12

# Assignment can be done with <-
x <- 5 + 7
> x
[1] 12

# Creating a simple vector in R
> z <- c(1.1, 9, 3.14)
> z
[1] 1.10 9.00 3.14

# See the function docs with ? , note do not add paranthesis
> ?c # Not ?c()

# Vectors can be concatenated in following way
> c(z, 555, z)
> c(z, 555, z)
[1]   1.10   9.00   3.14 555.00   1.10   9.00   3.14

# Can do arithmatic operations on vectors
> z*2 + 100
[1]  102.20  118.00  106.28 1210.00  102.20  118.00  106.28

# Can be squared using ^2, also sqrt() and abs() are some of the functions

# When given two vectors of the same length, R simply performs the specified arithmetic operation (`+`, `-`, `*`, etc.) element-by-element. If the vectors are of different lengths, R 'recycles' the shorter vector until it is the same length as the longer vector.

> c(1, 2, 3, 4) + c(0, 10)
[1]  1 12  3 14

> c(1,2,3,4) + c(0,10,100)
[1]   1  12 103   4

Warning message:
In c(1, 2, 3, 4) + c(0, 10, 100) :
  longer object length is not a multiple of shorter object length
```


### Workspaces in R

```R
# Get current directory
> getwd()
[1] "/home/<your-complete-path>"

# List all objects of your current workspace
> ls()
character(0)

# Listing all files in current directory
> list.files() # Even dir() can be used
[1] "Rswirl.md"

# To see what arguments does a function take
> args(list.files)
function (path = ".", pattern = NULL, all.files = FALSE, full.names = FALSE, 
    recursive = FALSE, ignore.case = FALSE, include.dirs = FALSE, 
    no.. = FALSE)
  
# To create directory
> dir.create('testdir')
  
# To change the directory
> setwd('testdir')

# Create a file using
> file.create('mytest.R')
[1] TRUE

# Check whether file exists using
> file.exists("mytest.R")
[1] TRUE

# Check some information about the file using file.info(file)
# Rename file using file.rename(old, new)
# Delete using file.remove(file)
# Copy using file.copy(file, copy) 

# Can use file.path()
> file.path('folder1','folder2')
[1] "folder1/folder2"

# For creating nested directories, use recursive flag
> dir.create(file.path('testdir2','testdir3'), recursive = TRUE)
```

### Sequences of Numbers

```R
> 1:20
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

# Increments by 1, includes limits, doesn't exceed them
> pi:10
[1] 3.141593 4.141593 5.141593 6.141593 7.141593 8.141593 9.141593

> 15:1
 [1] 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1

> ?`:` # Gives documentation of operator :

> seq(1, 20) # Same as 1:20

> seq(0,10,by=0.5)
 [1]  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5  7.0
[16]  7.5  8.0  8.5  9.0  9.5 10.0

# If we don't care about the increment, but the length of numbers created
> seq(5, 10, length = 30)

# Get length using length(vector)

> seq(along.with = my_seq) # Same as 1:length(my_seq)
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
[26] 26 27 28 29 30

# Shorter version of above
> seq_along(my_seq)
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
[26] 26 27 28 29 30

# Use built-in functions whenever possible

> rep(0, times = 40)
 [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[39] 0 0

> rep(c(0,1,2), times = 10)
 [1] 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2

> rep(c(0,1,2), each= 10)
 [1] 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2
```
