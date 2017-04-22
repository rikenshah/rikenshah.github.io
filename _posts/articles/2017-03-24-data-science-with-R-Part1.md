---
layout: post
title: Data Science with R - Part 1
excerpt: "Introducing Data Science using R programming"
categories: articles
tags: [datascience, R]
author: riken_shah
comments: true
share: true
modified: 2017-3-24T14:18:57-04:00
published: true
---


## Setting up the workspace

- `getwd()` for getting present directory
- Syntax for defining function

```R
foo <- function() {
	x <- rnorm(100)	#rnorm generates a set of numbers from random normal distribution
	mean(x)
}
```

- To pass a variable, simply define so in the paranthesis of `function()`
- To load R scripts in console, use `source("script_name.R")`
- To view loaded functions use, `ls()`
- Call function for a range of values like this  `foo(4:10)`. This will call `foo` for all values from 4 to 10.
- Print something with, `print(x)`
- `x <- 1:20` makes a vector

## Data Types

- Atomic classes
	- Character
	- Numeric (double precision real numbers)
	- Integer
	- Complex
	- Logical

- Most basic object is a **vector**, which containes objects of same class, except `list`
- Vectors can be initialized with `vector()`
- By default numbers are numeric. Can be explicitly declared as Integer by `1L`
- Two specials, `Inf` and `NaN`
- Each objects have `attributes()`. Like names, dimensions, length, class, etc.
- `c()` can  be used to create vectors, its a way of concatenating. Similarly `vector()` can also be used.

```R
x <- c(0.5,1)
x <- vector("numeric",length=10)
```

- Different objects can be mixed. Coersion will occur, so that eveything is of same class.
- Getting class of object using `class(x)`. Convert to numeric using, `as.numeric(x)`. Same for character, etc.
- Converting character to numeric gives 'NA'
- `x <- list(1,"a", TRUE)` creates a list.
- Matrices are special types of vectors with attribute dimension. `m <- matrix(nrow=2, ncol=2)`
- `dim(m)` returns num of [rows , columns]
- Matrix are cconstructed column wise 'm <- (1:6, nrow = 2, ncol = 3)'
- Creating matrices from vectors.

```R
m <- 1:10
dim(m) <- c(2,5)
```

- `cbind(a,b)` will bind vectors a and b column wise. Similarly `rbind()`
- Factors can be used to represent categorical data, can be ordered or unordered. Treated specially using modelling functions like `glm()` or `lm()`
- Factors can be thought of as integer vector with levels.
- A NaN value is also an NA, but converse not true.
- `is.na()` and `is.nan()` can be used. Note that NaN is mathematically not defined and NA is pretty much everything else.
- Data Frames, used to store tabular data.
	- Each element is a column of same length, but can be different type of objects
	- `row.names` is an attribute
	- `read.table()` or `read.csv()` function creates a dataframe
	- can be converted to `data.matrix()`. Coersion may occur
	- `ncol()` and `nrow()` can be used for data frames

- R Objects can also have `names()` attribute.

```R
x <- 1:3
names(x) <- c("foo","bar","nor")

# Also list elements can have names
x <- list(a=1,b=2,c=3)

# Matrix elements can also have names, called dimnames()
```

- http://swirlstats.com  <- Learn R in R :p
(Debug tip - `sudo apt-get install  libcurl4-openssl-dev libssl-dev` before installing `swirl`)
	- Download the learning code in swirl and get going.

## Reading and Writing data into R

- `read.table` and `read.csv` gives a datafrom from a file.(opp is `write.table`)
- `readLines` gives text as a character vector (`write.lines`)
- `source` will read R code. (Opposite of `dump`)
- Some other functions are `dget`, `dput`, `load`, `save`,  `unserialize`.

```R
data <- read.table("foo.txt")
# Each line with # will be skipped
```

- Dataset must be smaller than the RAM Size, else we need to optimize it. Also set `nrows`. See help page for hints. (Generally `colClasses` fasterns the process. See `sapply()` function)
- Calulate the size of your database. Rough estimate (8bytes/numeric value)
- `dput` saves the metadata. It writes R code which regenerates the data.

## Interface to Outside world

- file, gzfile, bzfile, url
- Generally connections are handled implicitly.
- For reading url.

```R
con <- url("http://eunotech.com")
x <- readLines(con)
head(x) #For printing few lines
```

## Some more basics

- Two types, numeric indexed and logical indexed
- '[' returns objects of same class. Can select more than one elements (one exception -> matrix, which behaviour can be turned off by `x[1,2,drop = False]`)
- '[[' returns an element may not be of same class
- '$' used to extract elements by name (from list or dataframe)
- R is '1' indexed (not zero)
- logical subnetting can be done `x[x > "a"]`. Or `u <- x > "a"` returns a boolean vector.
- `x$foo` returns a value of an element that contains `foo` from list x
- `x[c(1,3)]` returns 1st and 3rd valued from x
- Partial matching can be allowed using `x[["a", exact = False]]`. Works with $ also.
- `x[[name]]`, here name can be the index existing, or a varible pointing to an index of x. While `x$name` will work only is x containes a key 'name'.
- `x[c(1,3)]` and `x[[1]][[3]]` means same thing -> Nested access.
- In matrix subnetting, `x[1:]` is valid, which means 1st row.
- To remove missing values

```R
bad <- is.na(x)
x[!bad] # Returns a vector with only elements that has values

good <- complete.cases(x,y) # returns a boolean vector which is true when both x and y element are present (not NA) --- Also can be used in dataframes
```

- `x+y` arithmatically adds vectors element-wise. Similarly, `x > 2` can be used to get a boolean vector and so on.
- For matrix multipication `x %*% y` must be used. Since `x * y` gives element-wise multiplication.
- Use vectorized operations whenever possible to make the code simpler and optimized.
