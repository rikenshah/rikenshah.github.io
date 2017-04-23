---
layout: post
title: Data Science with R
excerpt: "Introducing Data Science using R programming"
categories: articles
tags: [data_science, R]
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


## Control Structures
Generally used in R script, and not in interactive sessions

- if condition

```R
if(<condition>){
	
}
else if {
	
} else {
	
}
```

- Also if structure can be used in this way

```R
y <- if(x>3){
	10
} else {
	0
}
```

- `else` is optional
- For loops can be defined as follows:

```R
for(i in 1:10){
	print(i)
}
```

- `seq_along()` function can be used to generate a vector that containes sequence based on the varible passed to it.
- If only single line, you can omit curly braces and write everything in single line
- While loop can be used as follows

```R
count <- 0
while(count < 10 && <condition2>){
	print(count)
	count <- count + 1
}
```

- `repeat` initiates an infinite loop. can be exited using `break`.

```R 
repeat {
	if (){
		break
		# Break on some condition
	}
}
```

- `next` can be used to skip and iterations. [like `continue`]
- `return` signals that a function should exit and return the given value.

## Functions
- Write functions in files and not in interactive shell

```R
add2 <- function(x,y) {
	x + y
}
# can be called with add2(3,5)
```

- Here is how to take a vector as a paramater

```R
above10 <- function(x, n=10){ #default values can be used
	use <- x > n # Returns a logical vector
	x[use] # Automatically last values is returned
}
```

- Have a look at this function

```R
column_mean <- function(y, removeNA = TRUE){
	nc <- ncol(y)
	means <- numeric(nc) # Initilization of vector (default zeros)
	for (i in 1:nc){
		means[i] <- mean(y[,i], na.rm = removeNA) # Mean function takes na.rm arg
	}
	means # this will get returned
}
```

- Functions in R ae "first class objects". They are R objects of class "function"
- Functions can be passed as arguments inside other function, and can be nested also.
- The arguments passed are known as 'formal arguments'. Can be seen with `formals()`
- Arguments can be named `sd(x <- mydata)` and `sd(mydata)` are same.
- `args(lm)` gives arguments taken by function `lm()`
- Mixing named arguments with un-named can be done. Whatever are named, will be removed and rest are matched in the order of their definition.
- order of operationd for arguments
	- Check for exact match
	- Check for partial match
	- Check for positional match
- Null is `NULL`, which means Nothing. Generally used for default value of formal arguments.
- Arguments to functions are evaluated **lazily**.

```R
f <- function(a,b){
	a^2
}
f(2)
# Here argument b is never actually evaluated. Argument a is posinally matched and hence function will work.
```

- Special argument `...`, can be used when extending another function, when you don't want to copy the entire argument list of the original function

```R
myplot <- function(x,y,type = "l", ...){
	plot(x, y, type=type, ...) # All other arguments are passed as it is
}
# Also generic functions use ... so that extra arguments can be passed to methods.
```

- `...` is necessary when the number of arguments passed to the function cannot be known in advance. One example that uses is `args()`
- Note, arguments that appear after `...` must be explicitly named, no partial matching allowed

## Scoping Rules
- You can create a function with name that already exists. For instance `lm <- function(x) { x + 1 }`
- See `search()`. First `.GlobalEnv` is checked for existing functions in there. Then it looks in the other packages.
- Hence the order of the packages on the search list matters. 
- Note that R has separate namespaces for functions and non-functions so it's possible to have an object named c and a function named c.
- R use lexical scoping or static scoping. An alternative has dynamic scoping. 
- Free variables are those used inside a function but not passed
- The values of free variables are searched for in the environment in which the function was defined. AN environment is a collection of (symbol, value) pairs. There is heirarchy of such environments.
- A function + an environment = a closure of function closure
- First the value of a symbol is searched in current environment, if not found, goes to parent env and so on.
- Generally global env is parent of all, for package the namespace is the parent of all.
- In R, functions can be inside other functions. Hence, the env is of other function.

```R
make.power <- function(n){
	pow <- function(x){
		x^n
	}
	pow
}

cube <- make.power(3) # Returns a function that gives a cube
square <- make.power(2)

cube(3) # Gives 27
square(2) $ Gives 4
```

- See this example, value of f(3) will be different with lexical and dynamic scoping

```R
y <- 10
f <- function(x){
	y <- 2
	y^2 + g(x)
}

g <- function(x){
	x*y # this y will be 10 in lexical scoping (since value of y in the env in which g is defined is seen, but in dynamic scoping value of y will be 2 since the value in the 'calling env' is so.
	# Calling env is also known as parent frame
}

# Note this happens only if function is called inside another function. If everything is defined and called globally, then it behaves like dynamic scoping. It looks like so. 
```

- Languages that support lexical scoping.
	- Scheme
	- Perl
	- Python
	- Common Lisp  (all language converges to List)

- Few optmization routins in R are, `optim`, `nlm`, `optimize`, takes a function and tries to find maximum or minimum. 

## Coding Standards

- Use text editors / text files
- Indent code (4 spaces)
- Limit the width of your code (80 columns?)
- Limit the length of functions

## Dates and Times in R

- Dates are represented by the `Date` class.
- Times are represented by POSIXct or the POSIXlt class
- Dates are stored internally as the number of days since 1970-01-01. Time, in seconds from the same date.
- `unclass(x)` is used to remove a class from an object x
- `as.Date("1970-01-01")` can be used.
- POSIX is a family of standards for representing data. 
- Check `?strptime` for details. You can do operations on date time objects.

```R
x <- Sys.time()
print(x)

p <- as.POSIXlt(x)
names(unclass(p))
## Will five sec, min, hour, mday, etc.
p$sec
```

## Loop functions

- `lapply` : loop over a list and evaluate a function on each element
- `sapply` : also simplifies
- Others are, `apply`, `tapply`, `mapply`, also `split`