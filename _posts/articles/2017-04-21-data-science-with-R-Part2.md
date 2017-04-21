---
layout: post
title: Data Science with R - Part 2
excerpt: "Introducing Data Science using R programming"
categories: articles
tags: [datascience, R]
author: riken_shah
comments: true
share: true
modified: 2017-4-21T14:18:57-04:00
published: true
---

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

- Functionss in R ae "first class objects". They are R objects of class "function"
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
