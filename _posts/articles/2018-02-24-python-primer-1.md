---
layout: post
title: Python Primer 1
excerpt: "Basics of Python"
categories: articles
tags: [python]
author: riken_shah
comments: true
share: true
modified: 2018-2-24T14:18:57-04:00
published: true
---

### Preamble

This post contains some factual information about Python programming languages. This is not a complete reference but rather a collection of various interesting functionalities and facts in Python, written from interview-preparation point-of-view. Feel free to suggest any edits in the comments section.

#####  Historical Facts

- Python was created in 1991 by Guido van Rossum

##### Python 2 vs 3

- Unicode support, all text strings being unicode by default
- Print is a function now
- `dict.keys()` and `.values()` gives views instead of list , you can further convert it to lists

##### Key Features

- High level language
- Dynamically Typed
- Interpreted
- Object Oriented (also supports other programming paradigms)
- Functions are first class objects
- Modular
- Built in data structure
- Open source

- Most of the code checking is postponed until runtime
- Code is compiled into bytecode (`.pyc` file)
- Timestamps are matched to see if the files have changed
- Each file is a module, a package is collection of module

- [Inheritance](http://www.jesshamrick.com/2011/05/18/an-introduction-to-classes-and-inheritance-in-python/)

##### Monkey Patching

- Changing behaviour of a function or an object after it has been already defined
- Generally used in testing along with mocks
- `*args` and `*kwargs` are used when the number of input arguments is not fixed
- `dir()` function is used to see all available functions for a particular object

- [Python collections](https://howchoo.com/g/mtbhy2qzota/python-collections)
- [Itertools](https://www.blog.pythonlibrary.org/2016/04/20/python-201-an-intro-to-itertools/)

### Random Facts
- Python ternary operator like this, `a if condition else b`
- Check if file exists using `os.path.exists(file_path)`
    + How to open file
    ```python
        with open(filename,'r') as f:
            all_lines = f.readlines()
    ```
-  The meaning of [`__main__`](https://stackoverflow.com/questions/419163/what-does-if-name-main-do)
- What if we want to run the block only if the program was used by itself and not when it was imported from another module?
-  This can be achieved using the `__name__`  attribute of the module.
- How to run external command in python?
- Many ways like `os.system()`, `os.popen()`, `subprocess.call()`, etc
    - `os.system('ls')`
    -  [Calling an external command](https://stackoverflow.com/questions/89228/calling-an-external-command-in-python)

- Dict can not be sorted by values, by using sorted and itemgetter(1), we can have a list of tuples that are sorted by values
  - listdir() for listing all files/directories in that path
  - List empty? If not arr:
  - Append vs extend in list methods
    - Append will just append the item, while extend will extend the list by appending the elements from the iterable
  - Pipes in python , output of one process is input to other
    -  [https://www.python-course.eu/pipes.php](https://www.python-course.eu/pipes.php)
  - Mastermind and bulls and cows are standard games
  - Duck typing - If it walks like a duck and it quacks like a duck, then it must be a duck
    - Type checking to be deferred to run time
    - Duck typing is about trying something and handling exceptions if they occur. As long it quacks, treat it like a duck, otherwise, treat it differently.
  - Metaclasses
    - Classes that create a class
    - Class itself are the instances created by metaclasses, type() is one such metaclass
    -  [https://stackoverflow.com/questions/100003/what-are-metaclasses-in-python](https://stackoverflow.com/questions/100003/what-are-metaclasses-in-python)
  - Python SQL functionalities
    -  [https://www.python-course.eu/sql\_python.php](https://www.python-course.eu/sql_python.php)
    - Sqlalchemy provides a nice ORM
    - Else sqlite3 can also be used for normal queries in the sql database
    -  [https://www.python-course.eu/sql\_python.php](https://www.python-course.eu/sql_python.php)
    -  [https://www.pythoncentral.io/introductory-tutorial-python-sqlalchemy/](https://www.pythoncentral.io/introductory-tutorial-python-sqlalchemy/)
  - Command line arguments
    - Import sys and use the list of sys.argv
  - Python slice functionality also takes a third argument, which is a step to be taken between start and end
    - A[start:end:step]
  - Python to find a value in list use .index() function

-
  - Docstrings and doctests, get method of dictionaries, closures, with, properties, coroutines along with generators,
  - [https://www.python.org/dev/peps/pep-0008/](https://www.python.org/dev/peps/pep-0008/) Style guide
  - Variable names are not containers for values, they are pointers (name-tags) to the values that lives elsewhere. Python is easy to read since there is generally only one right way to do things. Maintainability is very important while writing code, everything is an object. Multiple inheritance is allowed in Python. Object customization, overriding default behaviours of your custom class.
  - Some of the inbuilt libraries
    - import itertools #stuff like Cartesian product and permutation
    - import functools #lots of decorators, for example a decorator that stores the last output in a cage and uses it again if possible
    - import sys, os #do system level stuff
    - import subprocess, multithreading, multiprocessing #various multithreading strategies
    - import curses #mess with the terminal
    - import tkinter #make fancy GUIs
    - import pickle #serialize objects
    - import urllib, ftplib, httplib, poplib #communicate with the internet
    - import md5, zlib, gzip, csv, xml, json #common file formats
  - Sys module important functions
    -  [https://docs.python.org/2/library/sys.html#module-sys](https://docs.python.org/2/library/sys.html#module-sys)
    - argv
    - builtin\_module\_names
    - dont\_write\_bytecode
    - exit([arg])
    - getdefaultencoding()
    - getsizeof(object)
    - path
    - platform
    - stdin, stdout, stderr
  - Math module important functions
    -  [https://docs.python.org/2/library/math.html#module-math](https://docs.python.org/2/library/math.html#module-math)
    - Ceil - returns ceiling
    - Copysign(x,y) - returns x with sign of y
    - Fabs - absolute value of x
    - Factorial - factorial of x
    - Floor - floor of x
    - Fmod(x,y) - can be different from x%y
    - frexp(x) : returns mantissa and exponent of x as a pair (m,e)
    - fsum(iterable) : accurate floating point sum of values in the iterable
    - isinf(x) : check if the float x is positive or negative infinity
    - isnan(x) if float x is NaN (not a number)
      - NaN is stored as float dtype rather than object type of None
      - nan allows for vectorized operations while None by default forces object types, throttling numpy&#39;s efficiency
    - exp(x) -&gt; return e\*\*x
    - log(x,base) -&gt; default base = e
    - log10
    - sqrt()
    - Lots of trigonometric functions as well
  - id() is used to get memory address of objects
    - any() and all() are methods
    - help() can be used for any unknown concepts
  - Array bisection algorithm
    -  [https://docs.python.org/2/library/bisect.html#module-bisect](https://docs.python.org/2/library/bisect.html#module-bisect)
  - Lots of random functions
    -  [https://docs.python.org/2/library/random.html#module-random](https://docs.python.org/2/library/random.html#module-random)
  - All about regular expression
    -  [https://docs.python.org/2/library/re.html#module-re](https://docs.python.org/2/library/re.html#module-re)
  - Profiling tools, how many function calls etc.
    -  [https://docs.python.org/2/library/profile.html#the-python-profilers](https://docs.python.org/2/library/profile.html#the-python-profilers)
  - Future module
    -  [https://docs.python.org/2/reference/simple\_stmts.html#future](https://docs.python.org/2/reference/simple_stmts.html#future)
  - Fraction arithmetic
    -  [https://docs.python.org/2/library/fractions.html#module-fractions](https://docs.python.org/2/library/fractions.html#module-fractions)
  - Functools
    -  [https://docs.python.org/2/library/functools.html#module-functools](https://docs.python.org/2/library/functools.html#module-functools)
    - cmp\_to\_key
    - Total\_ordering
    - Partials
  - Decimal Arithmetic [https://docs.python.org/2/library/decimal.html#module-decimal](https://docs.python.org/2/library/decimal.html#module-decimal)
  - Heapq algorithm
    -  [https://docs.python.org/2/library/heapq.html#module-heapq](https://docs.python.org/2/library/heapq.html#module-heapq)
    - heappush(heap,item)
    - heappop(heap)
    - heappushpop(heap,item)
      - Push an item and return the smallest item from heap (works faster then combination of push and pop written explicitly)
    - heapify()
      - Transforms a list x into a heap in place in linear time
    - heapreplace(heap,item)
    - nlargest(n,iterable)
      - Returns a list with the n largest elements from the data set defined by iterable
    - Custom comparator in python heapq
      - Use magic \_\_cmp\_\_ method in python2 and \_\_lt\_\_ method in python3
    - PriorityQueue is a thread-safe class while heapq module makes no thread-safety guarantees
      - [https://stackoverflow.com/questions/36991716/whats-the-difference-between-heapq-and-priorityqueue-in-python](https://stackoverflow.com/questions/36991716/whats-the-difference-between-heapq-and-priorityqueue-in-python)
      - Heapq is a base and hence faster
  - Operator
    -  [https://docs.python.org/2/library/operator.html#module-operator](https://docs.python.org/2/library/operator.html#module-operator)
    - Understand itemgetter())
      -
        - [https://stackoverflow.com/questions/18595686/how-does-operator-itemgetter-and-sort-work-in-python](https://stackoverflow.com/questions/18595686/how-does-operator-itemgetter-and-sort-work-in-python)
  - Dictionary keys should be hashable
    -  [https://docs.python.org/3/library/stdtypes.html#mapping-types-dict](https://docs.python.org/3/library/stdtypes.html#mapping-types-dict)
    -  [https://stackoverflow.com/questions/4901815/object-of-custom-type-as-dictionary-key](https://stackoverflow.com/questions/4901815/object-of-custom-type-as-dictionary-key)
  - Some random tricks
    - Reverse a string
      - A[::-1]
    - Transpose a matrix
      - zip(\*mat)
    - Repeating the string print
      - &quot;code&quot;\*4
    - Check if two words are angrams
      - From collections import Counter

def is\_anagram(str1,str2):

        return Counter(str1) == Counter(str2)

-
  - Some nice to know python libraries
    - 
  - [https://stackoverflow.com/questions/2573135/python-progression-path-from-apprentice-to-guru?lq=1](https://stackoverflow.com/questions/2573135/python-progression-path-from-apprentice-to-guru?lq=1)

- How python manages memory?
  - Internal heap that takes care of it. Garbage collection like various other languages. If you want to free up the space, just remove any references that point to the particular variable/object.
  - This heap is maintained by internal python memory manager, which communicates with OS memory manager.
  - `del` does not delete the object, it just differences, then run `gc.collect()` to collect it.
  - The most important one is a malloc implementation called pymalloc, designed specifically to handle large numbers of small allocations. Any object that is smaller than 256 bytes uses this allocator, while anything larger uses the system&#39;s malloc.
  - Generally CPython is used, but there are other python implementations as well like Iron python and Jython. Packages are written in Python with some performance critical sections written in C
  - PyPy - Python JIT compiler
    - A JIT has access to dynamic runtime information whereas a standard compiler doesn&#39;t and can make better optimizations like inlining functions that are used frequently.
    - JIT will also use hardware specific optimizations that are available at runtime which is not possible in case of pre-compiled code.
  - Pypy has inbuilt support for stackless mode, provides micro-threads for massive parallelism
    - Stackless mode is primarily for concurrency, supports microthreads (tasklets), channels, scheduling and serialization
    - Speed and memory usage are some features
    - Won&#39;t be much useful in case of short running processes (since pypy needs some time to warm up) and lots of run-time libraries.
    - Sandboxing is one feature, idea for running untrusted prototypes
      - Replace external calls with stubs
  - [http://foobarnbaz.com/2012/07/08/understanding-python-variables/](http://foobarnbaz.com/2012/07/08/understanding-python-variables/) Same values variables are stored only once

- Python OOP things
  - Class variables are _shadowed_ by instance attribute. This means that when looking up an attribute, Python first looks in the instance, then in the class. Furthermore, setting a variable on an object (e.g. self) always creates an instance variable - it never changes the class variable.
  - [https://stackoverflow.com/questions/19753897/difference-between-class-variables-and-instance-variables](https://stackoverflow.com/questions/19753897/difference-between-class-variables-and-instance-variables)
  - Instance variables are self.var\_name while class variables are just names.
  - variable access -- the search happens in this order:
    - locals
    - nonlocals
    - globals
    - built-ins
  - for attribute access, the order is:
    - instance
    - class
    - base classes as determined by the MRO (method resolution order)
  - To use global variable, use global keyword (only to write/update value, to read by default the above order will be followed)

- Python mutables and imputables
  - String objects are immutable, the reference of string objects are mutable.
  - Numbers, strings and tuples -&gt; these are immutables
  - Dict, set and lists are mutables
  - Tuples can be used for keys of dictionaries, they are allowed to be hashed
  - [https://stackoverflow.com/questions/9097994/arent-python-strings-immutable-then-why-does-a-b-work](https://stackoverflow.com/questions/9097994/arent-python-strings-immutable-then-why-does-a-b-work)
  - Should not pass mutables are default arguments since they could have been updated before the function call
  - Mutable is something that the value can be changed without changing their identity
  - How passing variours mutables and immutables work - [https://stackoverflow.com/questions/986006/how-do-i-pass-a-variable-by-reference](https://stackoverflow.com/questions/986006/how-do-i-pass-a-variable-by-reference)



- List of python keywords
  - [https://www.programiz.com/python-programming/keyword-list](https://www.programiz.com/python-programming/keyword-list)
  - Also, yield and all is mentioned in detail here in that link.
    - False     class     finally     is     return
    - None     continue     for     lambda     try
    - True     def     from     nonlocal     while
    - and     del     global     not     with
    - as     elif     if     or     yield
    - assert     else     import     pass
    - break     except     in     raise
  - &gt;&gt;&gt; import keyword
&gt;&gt;&gt; print(keyword.kwlist)

- Phone screen was just a bunch of questions about OOP (encapsulation, inheritance, composition, etc.)
  - Self is an argument name not a python keyword, it can be replaced by some other name, but it is there by convention.

- What is a named tuple?
  - Provides sequencial access as well as normal hashed key access
  - [https://www.geeksforgeeks.org/namedtuple-in-python/](https://www.geeksforgeeks.org/namedtuple-in-python/)

- What is a defaultdict?
  - Usually, a Python dictionary throws a KeyError if you try to get an item with a key that is not currently in the dictionary. The defaultdict in contrast will simply create any items that you try to access (provided of course they do not exist yet). To create such a &quot;default&quot; item, it calls the function object that you pass in the constructor (more precisely, it&#39;s an arbitrary &quot;callable&quot; object, which includes function and type objects). For the first example, default items are created using int(), which will return the integer object 0. For the second example, default items are created using list(), which returns a new empty list object.

- How would you make an object instance callable?
  - To make a class instance callable, all you need to do is implement a \_\_call\_\_ method. Then, to call the \_\_call\_\_ method, you just do: instance(arg1,arg2,...) -- in other words, you call the instance the same way you would call a function.
  - [https://stackoverflow.com/questions/14585987/making-a-class-callable-in-same-instance](https://stackoverflow.com/questions/14585987/making-a-class-callable-in-same-instance)

-  What do the property, classmethod, and staticmethod decorators do?
  - [https://stackoverflow.com/questions/136097/what-is-the-difference-between-staticmethod-and-classmethod-in-python](https://stackoverflow.com/questions/136097/what-is-the-difference-between-staticmethod-and-classmethod-in-python)
  - ClassMethods take class of the object as the first argument, while static takes no argument
  - In Python, functions are [**first-class**](http://python-history.blogspot.com/2009/02/first-class-everything.html) **objects**. This means that functions can be passed around, and used as arguments, just like any other value (e.g, string, int, float).
  - Decorators call the function with the extended syntax
  - [https://realpython.com/blog/python/primer-on-python-decorators/](https://realpython.com/blog/python/primer-on-python-decorators/)
  - Classmethod is a function decorator which does nothing but makes the called function take &#39;cls&#39; which is the Class, (not hardcoded way) as the first argument.

- PEP Guidelines
  - Python enhancement proposals

- Why is python slow
  - Dynamically types
  - Lots of run-time lookups and checks
  - Unboxed values (No memory space needs to be allocated)
  - Interpreted and not compiled. A smart compiler makes lots of optimizations by looking at use patterns in the data.
  - Speed in conventional terms means to optimize the most costly resource. Conventionally computers were the costliest resource. Now the programmers are the costliest resource. Also, your CEO measures time as how fast do we innovate, and ship features to customers.
  - Lots of abstractions, lets you focus on the logic. So, if we do not measure speed as a measure of productivity, then python is slow.

- Python name mangling
  -
  - [https://stackoverflow.com/questions/1301346/what-is-the-meaning-of-a-single-and-a-double-underscore-before-an-object-name](https://stackoverflow.com/questions/1301346/what-is-the-meaning-of-a-single-and-a-double-underscore-before-an-object-name)

- Python - magic methods, Big o of python data structures, GIL.
  - Magic methods are those which are overriden to make object behave like inbuilt data types. For example \_\_len\_\_()
  - [https://stackoverflow.com/questions/2657627/why-does-python-use-magic-methods](https://stackoverflow.com/questions/2657627/why-does-python-use-magic-methods)
  - In CPython, the global interpreter lock, or GIL, is a mutex that protects access to Python objects, preventing multiple threads from executing Python bytecodes at once. This lock is necessary mainly because CPython&#39;s memory management is not thread-safe.
  - To use some of the C libraries that are not safe
  - The GIL is controversial because it prevents multithreaded CPython programs from taking full advantage of multiprocessor systems in certain situations. Note that potentially blocking or long-running operations, such as I/O, image processing, and [NumPy](https://wiki.python.org/moin/NumPy) number crunching, happen _outside_ the GIL. Therefore it is only in multithreaded programs that spend a lot of time inside the GIL, interpreting CPython bytecode, that the GIL becomes a bottleneck.
  - Can not take advantage of multicore processor, and sometimes because of GIL, the multithreaded program can be slower than a single thread program.
  - Data Structures - [https://www.datacamp.com/community/tutorials/data-structures-python](https://www.datacamp.com/community/tutorials/data-structures-python)
  - Array vs List. List are heterogenous but takes up lots of space. Array is a thin wrapper around  C arrays, and hence are much space efficient. Because in list, python will have to remember datatype of each element too. [https://stackoverflow.com/questions/176011/python-list-vs-array-when-to-use](https://stackoverflow.com/questions/176011/python-list-vs-array-when-to-use)
  - [https://wiki.python.org/moin/TimeComplexity](https://wiki.python.org/moin/TimeComplexity)

- Python programming. Stack and queue
  - List can be used as stack
  - Queue class is there, even PriorityQueue class is there
  - Underlying heap structure is used

- Python collections and itertools module (Do in detail)
  - [https://docs.python.org/2/library/collections.html#module-collections](https://docs.python.org/2/library/collections.html#module-collections)
  - [https://docs.python.org/2/library/itertools.html#module-itertools](https://docs.python.org/2/library/itertools.html#module-itertools)
  - All Collections
    - namedtuple()
    - Deque
    - Counter
    - OrderedDict
    - defaultdict
  - Map - Applies a function to iterable
  - Zip - zips the two iterables
  - Lambda - Creates a new function (lambda functions cannot be pickled)
  - Filter - Also takes a lambda function and a list, but the lambda function here returns a boolean instead of some value
  - [https://medium.com/@happymishra66/lambda-map-and-filter-in-python-4935f248593](https://medium.com/@happymishra66/lambda-map-and-filter-in-python-4935f248593)
  - In python2, zip returned a list, but in python3 it returns a zip iterator
  - List comprehensions are those normal [list generation] methods
  - Python generators are functions that returns an iterators
  - A _shallow copy_ constructs a new compound object and then (to the extent possible) inserts _references_ into it to the objects found in the original.
    - Can be done using copy() module or using slicing operator [:]
  - A _deep copy_ constructs a new compound object and then, recursively, inserts _copies_ into it of the objects found in the original.
  - [https://hackernoon.com/list-comprehension-in-python-8895a785550b](https://hackernoon.com/list-comprehension-in-python-8895a785550b)

- Generator in python
  - It gives an iterator
  - To do lazy evaluation of the function
- Python memory management
- Python Garbage collection
- If there is an object with non-zero reference, should I GC
  - Depends on the system
- Why it is a bad idea to use list as default parameter when you define a function
  - Since its mutable and it will persist
- Difference between generator iterator
  - A Generator is an Iterator
  - Iterator are objects which uses next() method to get next value of sequence.
  - A generator is a function that produces or yields a sequence of values using yield method.
- Application of first class object in python (function is an object)
  - In short, it means there are no restrictions on the object&#39;s use. It&#39;s the same as any other object.
  - A first class object is an entity that can be dynamically created, destroyed, passed to a function, returned as a value, and have all the rights as other variables in the programming language have.
- map reduce in python ??
- In the not to use multiplication operator how to multiply
- You employ someone to work for you for seven days. You have one gold bar to pay your employee. Your employee needs to be paid for their days work at the end of each day. How do you pay your employee if you can only cut the gold bar twice?
  - Make three parts 1/7,2/7,4/7 and then give one each day then take back something other day etc.
  - Mathematically, it should be possible to consider that an integer sequence of 1..N (N = 7 in this case) can be completely covered by a combination sum of at least a few numbers
- delete duplicate in a list, not hard
- list comprehension, easy
- use class to build a data structure to perform in real time data that can: insert, return max, return mean, return major element.

Brainteaser:
1. how many integers are there in 1 to 10,000 that doesn&#39;t have a 5 in its digit
2. given 50 black ball and 50 white balls and 2 baskets, how can you distribute them so that you can have a maximum chance of getting black ball.

find an example or corr(X,Y)=0 but X and Y are not independent.
X??Y iid standard normal Find the conditional distribution of X given X+Y&gt;0.
n\*n matrix with 1 on the diagonal and n on the aux diag. Find eigen values and eigen vectors.

- Pandas
  - Fast and efficient data frame object for data manipulations
  - Easy read and write from various formats
  - Data alignment, reshaping, slicing, indexing, etc.
  - Optimized for performance
  - [https://pandas.pydata.org/](https://pandas.pydata.org/)
  - Some of the useful functions are as follows:
    - Reshaping
      - Pivot
      - Pivot table
      - stack/unstack
      - Melt
    - Iterations
      - Iteritems
      - Iterrows
    - Indexing (unique key thing)
      - Set/reset/rename
      - Reindex
        - Forward filling
        - Backward filling
    - Duplicates
      - Unique
      - Duplicated
      - Drop\_duplicated
    - Missing Data
      - Dropna
      - Fillna
      - Replace
    - Indexing (slicing)
      - Loc
      - Iloc
      - Select
      - Filter
      - Where (any, all)
    - Groupby
      - mean
      - Sum
    - Combining
      - Merge
        - Left
        - Right
        - Inner
        - Outer
      - Join
      - Append
      - Concat
    - Datetime
      - To\_datetime
      - Date\_range
    - Visualization
      - plot()
      - show()
  - Numpy vs Pandas : A short answer- a dataframe columns will be stored as numpy arrays and pandas operations are thin wrappers around numpy operations. For single-typed columns, you should get the same performance. The benefit is fancy indexing.
  - Pandas better than Numpy ? : Lots of things. Off the top of my head, you get a whole bunch of time series functionalities, group operations (this is huge for me), can be used with spark, different data types in the same object, windowing functions, plotting directly with matplotlib from the dataframe, etc…
  - Indeed, pandas provides high level data manipulation tools built on top of NumPy. NumPy by itself is a fairly low-level tool, and will be very much similar to using MATLAB. pandas on the other hand provides rich time series functionality, data alignment, NA-friendly statistics, groupby, merge and join methods, and lots of other conveniences. It has become very popular in recent years in financial applications.
  - Data wrangling, sometimes referred to as data munging, is the process of transforming and mapping data from one &quot;raw&quot; data form into another format with the intent of making it more appropriate and valuable for a variety of downstream purposes such as analytics.
  - Describe() function in pandas dataframe is very useful
    - Count, mean, std, percentiles, min, max, etc
  - Loc and iloc are slicing methods
  - Can be used with sqlalchemy to work on database data
  - Pandas cheatsheet - [http://datacamp-community.s3.amazonaws.com/9f0f2ae1-8bd8-4302-a67b-e17f3059d9e8](http://datacamp-community.s3.amazonaws.com/9f0f2ae1-8bd8-4302-a67b-e17f3059d9e8)
  - Visualizing data -&gt; [http://wavedatalab.github.io/datawithpython/visualize.html](http://wavedatalab.github.io/datawithpython/visualize.html)

- Numpy - Numerical Python
  - [http://cs231n.github.io/python-numpy-tutorial/](http://cs231n.github.io/python-numpy-tutorial/) (Basics of numpy, scipy and matplotlib)
  - Arrays (np.array)
    - Grid of values
    - Same type
    - Indexed by tuple of non negative integers
    - Shape -&gt; tuple
  - Array inspect methods
    - shape
    - len(a)
    - size
    - ndim
    - dtype
    - dtype.name
    - astype()
  - Slicing operations
    - Same array is referenced in memory (no new allocation)
  - a[np.arange(4),b] -&gt; access one-one element in each row (arange is like a range, but returns a numpy array). A is 2d, b is 1d
  - Linspace, number of observations can be defined
  - Boolean indexing possible, array a&gt;2, returns a boolean array of same shape and can be used for indexing
  - Functions to create arrays
    - Zeros
    - Ones
    - Full (fill with constant)
    - Eye
    - random()
    - Empty
  - Broadcasting (in all math operators)
    - 3\*3 + 3 = 3\*3 + 3\*3
  - reshape (n\*m should be same)
  - Data types (dtypes)
    - Int32 (32bit integer) - depends on the system
    - Int64, float64, complex128
    - Bool, python object type(object)
    - String and unicode
  - Serialization
    - save(filename,a)
    - savez
    - load
    - loadtxt
    - genfromtxt
    - savetxt
  - Math methods
    - add ,subtract, multiply, divide =&gt; everything is element wise
    - Also operators will work in the same way
    - \* is element wise
    - .dot is used for dot product, np.dot(a,b) or a.dot(b)
      - Dot of 2 d matrices is a matrix multiplication
    - Sin
    - Cos
    - Exp
    - Log
  - Comparison
    - == element wise
    - &gt;2 element wise
    - array\_equal(b) - whole array
  - Copying
    - H = a.view()
    - copy(a) copy
    - H = a.copy() deepcopy
  - Aggregate functions
    - sum(a,axis=0)
    - Mean
    - Min
    - Max
    - Median
    - Corrcoef
    - std(a)
    - sort(axis)
  - .T - Transpose
  - Cheatsheet - [http://datacamp-community.s3.amazonaws.com/e9f83f72-a81b-42c7-af44-4e35b48b20b7](http://datacamp-community.s3.amazonaws.com/e9f83f72-a81b-42c7-af44-4e35b48b20b7)



- Scipy
  - High performance functions to operate on numpy arrays for scientific and engineering applications
  - Comparison
    - _NumPy_&#39;s array type augments the Python language with an efficient data structure useful for numerical work, e.g., manipulating matrices. _NumPy_ also provides basic numerical routines, such as tools for finding eigenvectors.
    - _SciPy_ contains additional routines needed in scientific work: for example, routines for computing integrals numerically, solving differential equations, optimization, and sparse matrices.
    - The [matplotlib](http://matplotlib.org/) module produces high quality plots. With it you can turn your data or your models into figures for presentations or articles. No need to do the numerical work in one program, save the data, and plot it with another program.
    - Using [IPython](http://ipython.org/) makes interactive work easy. Data processing, exploration of numerical models, trying out operations on-the-fly allows to go quickly from an idea to a result. See the [IPython site](http://ipython.org/) for many examples.
  - Image, imread(path), imsave(),
  - Can calculate spatial distance (euclidean,etc.)
  - .vectorize(function name), can help vectorize a method
  - Derivative and integration modules
  - Interpolation, statistics, linear algebra, signal processing
  - Amazing cheatsheets [https://www.datacamp.com/community/data-science-cheatsheets?posts\_selected\_tab=must\_read](https://www.datacamp.com/community/data-science-cheatsheets?posts_selected_tab=must_read)

- Scikit learn
  - For machine learning algos like learning, models, etc
  - SVC() and similar methods for various learning models
  - Iris, digits and boston house pricing are inbuilt datasets in scikit learn
  - [https://machinelearningmastery.com/a-gentle-introduction-to-scikit-learn-a-python-machine-learning-library/](https://machinelearningmastery.com/a-gentle-introduction-to-scikit-learn-a-python-machine-learning-library/)
  - Cheatsheet   [http://datacamp-community.s3.amazonaws.com/5433fa18-9f43-44cc-b228-74672efcd116](http://datacamp-community.s3.amazonaws.com/5433fa18-9f43-44cc-b228-74672efcd116)

- Anaconda
  - It is a python distribution with everything out-of-the box
  - With over 6 million users, the open source **Anaconda Distribution** is the easiest way to do Python data science and machine learning. It includes 250+ popular data science packages and the conda package and virtual environment manager for Windows, Linux, and MacOS. Conda makes it quick and easy to install, run, and upgrade complex data science and machine learning environments like Scikit-learn, TensorFlow, and SciPy. Anaconda Distribution is the foundation of millions of data science projects as well as Amazon Web Services&#39; Machine Learning AMIs and Anaconda for Microsoft on Azure and Windows.
  - Conda package manager
  - Navigator
  - Pip installs from source, conda installs from bin (Pip started supporting binary wheels)
  - Pip is supported by the community, conda is python agnostic (language agnostic, so to speak, since it is available for many other languages as well) [https://stackoverflow.com/questions/20994716/what-is-the-difference-between-pip-and-conda](https://stackoverflow.com/questions/20994716/what-is-the-difference-between-pip-and-conda)



OS

- Basic Concepts
  - [https://www.geeksforgeeks.org/operating-systems/](https://www.geeksforgeeks.org/operating-systems/)
  - When the computer starts
    - BIOS loads the bootloader and then it starts the real OS
    - POST (Power on self test) happens each time a computer is booted, this is to initialize various hardware components
    - The last step of kernel boot is known as init, which defines various run-levels like 0-&gt;System halt.
    - X-server daemon is started, then we see the GUI
  - Process Management
    - Process is a program in execution
    - One programs can have multiple processes
    - Process has stack, heap, text, and data in the memory
    - There are various states of the process like ready, running, blocked, suspended, etc.
    - Context Switching might occur if a high priority process comes in the system
    - CPU bound vs IO bound processes
  - CPU Scheduling in process management
    - DOS is an example of UNI-programming, where IO-bound process will waste CPU time and so on
    - Some process attributes are burst time, turnaround time, completion time, arrival time and waiting time
    - Process scheduling has a goal of maximizing the CPU usage of the system ad reducing the turnaround and waiting time of the processes.
    - Some scheduling algorithms are FCFS, SJF, SRJF, RR, Priority based, Multilevel queue, etc.
  - Process Scheduler
    - Long term (job scheduler)
      - Brings a new process in ready state (Controls the degree of multiprogramming)
    - Short term (CPU scheduler)
      - Selects a process that will go from ready to running state
      - Dispatcher takes care of actually loading it in  the memory
    - Medium term scheduler
      - Suspends and resumes the process. Mainly used for swapping
  - FCFS
    - Non preemtive
    - Non optimal
    - Convoy effect (Too many IO bound process,...)
      - When truck is blocking a way for small vehicles
      - When too many IO bound processes, a CPU bound will not get IO and CPU will sit idle
      - Vice Versa
  - SJF
    - Can cause starvation for big process, if smaller tasks keeps on coming in
  - Priority Scheduling
    - Can cause starvation of lower priority processes
    - Priority Inversion can happen in this case (when preemption is allowed)
      - Solution is priority inheritance
  - Round Robin
    - One variation is selfish round robin (more time to old processes)
  - Process Synchronization
    - Two types of process :
      - Independent
      - Cooperative
    - Four stages of process
      - Entry
      - Critical
      - Exit
      - Remainder
    - No two processes must execute in their critical sections together
      - Operations that are atomic,eg. Print something
      - Race condition is when two threads tries to modify the same of piece of data at the same time
    - Semaphores - to ensure mutual exclusion (wait and signal)
      - Bianary - Mutex Locks
        - There is a difference although, mutex is a locking mechanism while semaphore is a signalling mechanism
      - Counting semaphores - Resorces that can have multiple bounded access
        - In case of producer-consumer problems
      - Peterson&#39;s algorithm - only two processes
    - Monitors are programming constructs to maintain mutual exclusion
  - Some synchronization problems and algo
    - Readers Writers problems
    - Bankers Algorithms
  - Inter-process Communication
    - Shared Memory
    - Message Passing
      - Asynchronous and Synchronous message passing (blocking read, write, etc)
  - Deadlock
    - Four Conditions required for deadlock to occur
      - Mutual Exclusion
      - Hold and Wait
      - No Premption
      - Circular  Wait
    - Three Ways to solve this problem
      - Deadlock prevention and avoidance
        - Allocate all resources at the start - to eliminate hold and wait
        - Number resources - to eliminate circular wait
        - Avoidance can be done using banker&#39;s algo
      - Deadlock detection and recovery
        - Detection can be done using resource allocation graph (find cycle)
        - Recovery can be done by killing a process, or preempting the process
      - Ignore and reboot
  - Thread
    - Path of execution within a process. Process can have multiple threads.
    - They can have same memory space, while the process generally have different memory spaces
    - There can be user-level threads and kernel level threads.
  - Memory Management
    - Single contiguous allocation
    - Partitioned Allocation
      - First Fit
      - Best Fit
      - Worst Fit
      - Next Fit
    - Paged allocation
      - Page replacement algorithms
        - FIFO
          - Belady&#39;s anomaly - more page frames more page faults
        - Optimal Page Replacement
          - Remove that will be not used in near future
        - LRU
    - Segmented Allocation
  - Virtual Memory
    - Storage allocation scheme where secondary memory can be addressed as though it were part of the main memory
    - Process references only logicall addresses, which are than translated to physical addresses
    - Thrashing is a big problem
    - TLB is a page table cache
  - Misc
    - Zombie process when the child process has an entry in process table even after its terminated since parent didn&#39;t wait for its termination
    - Spool - Simultaneous peripheral operations on-line
    - Multiprogramming - more than one task at a time
    - Multiprocessing - more than one CPU at a time
    - Multitasking vs Multiprogramming - Multiprogramming is based on context switching, while multitasking is like time sharing basis (threads)
      - If one thread is taking too much time then too, the program will not become completely unresponsive in case of multithrading/tasking
      - There can be process based multitasking and thread based multitasking
    - Buddy systems are used to allocate memory (binary, fibonnaci)
    - File allocations can be
      - Contiguous
      - Linked
      - Indexed

- Why might multiple threads calling a simple function involving array access/possible modification be much slower than a single thread calling a function?
  - cache coherence (Since data in a function can be stored in multiple local caches)
- What is system call?
  - It is a programmatic way for computers to request service from the kernel of the operating system that it is executed on.
  - The service is provided using API (Application Program Interface)
- concurrency programming
  - Thread and all, parallelism is when using more than one core
- Questions
  - structure packing, signal, gdb, soft/hard link, inode and so on..
  - Explain how mmap works. (I thought OS mapped the region in heap, instead, it mapped between heap and stack.)
    - Memory maped IO
  - How to compute the size of L1/L2 cache of CPU without read /proc/cpuinfo.
    - Dmidecode -t cache

Algo

- Postfix to Infix (Reverse polish notations)
  -
- How to remove duplicated items in a list? What&#39;s the  complexity of your algorithm?
  - Iterating over a list is O(n) and adding each element to the hash set is O(1), so the total operation is O(n).
- Given a binary string , determine if it is power of five, if not break the string down into strings that represent powers of 5.
- Implement longest common subsequence algorithm.
- Insert a node into a binary search tree in a thread-safe manner without requiring locking
  - [http://user.it.uu.se/~siev3547/ps2/bst/](http://user.it.uu.se/~siev3547/ps2/bst/)
- Unusual sort: sort an array A such that: (Wiggle sort)

A[0]&lt;A[1]&gt;A[2]&lt;A[3]&gt;A[4]&lt;A[5].............

- Two sum
- Find largest products of two numbers from an array
- find number of bit 1 in an number
- Domino tile pattern
- All these are linked list. How to use linked list to make a stack..
  - The stack is a very common data structure used in programs. By data structure, we mean something that is meant to hold data and provides certain operations on that data. Generally has push and pop functions to control the order of the stack. A linked list is also a common struct that has a pointer to the next element in the array. So a stack is simply and ordered link list.
- Implement an API about socket.
- finding local minima in a 2-D array
- Giving the root of a binary tree and a value, find the two nodes of the tree, which the sum of them equals to the value. (I wrote the codes which the complexity is O(nlogn) ).

- Leetcode easy medium, system design, data structures
- Design system for processing incoming stock purchase orders
- I was asked to solve a design question based on finance concept of marking position/short selling. The task was to find the marking position according to various JSON events like sell, buy etc
- OOP (encapsulation, inheritance, composition, etc.)
- Develop buy/sell API for a trading company.
- Some maze question about having the shortest path to reach a destination. Some Tom and Jerry story about cheeses.
- Design a class that will process burst stock prices and on a basis of 5 sec report the upgraded price to customers
- Read a binary file containing a set of trade orders and process and output order stat
- Read word strings from stdin, output words and their count, and the frequency of letters a-z
- Test a trading algorithm they made given some sample input.
- I was asked to implement a lock-free queue after some discussion of my experiences
- Implement two functions in strategy class according to the requirements.
- Give a matrix, find some numbers according to the requirements.
- Write a Battleship AI
- given couple sets of data(buy in price, sell price, latency) and a color tag that describe the action, use new data to get the new color tag
- Basic pointers, loops, searching, and baby algorithms. Waiting to hear back for subsequent round
- then there was a coding problem about sockets
- Implement a thread safe circular buffer
  - They give you a class and function declarations: pop, push, front, empty, constructors and destructors and you write the functions using a buffer and some integer variables as private members of the class and you are given 30-45 minutes for it.
- Write a program to interpret exchange messages.
- Implement power of 10 template without runtime overhead.
- How to check if a class has a member function. (Failed to answer)
- Write the syntax to specialise the template function of a template class. (Failed to answer)
- Explain the implementation of virtual function.
- Equilibrium of market share, given initial share and a matrix describing customer transfer rate.
- 2-3 requires DP, FSM, DP, data structures, et
- Given ribbon length =10 and three rock coordinates.If the perimeter of the triangle formed by rocks is less than 10 than only 2 rocks will be wrapped by ribbon.This was to be solved using a python code.
- What is overfit?
- K-means
- Dice game
- give you a bunch of Tetris to fit in a square box(DFS approach?)
- Implement Round Robin algorithm
- Circular buffer
- Get the median of a sorted list.
- Simple Tree Question.
- Implement STL Vector.
- he test had the following questions (easy to difficult)
  - 1) Enter a dimension(number) and verify if it can be a 3 dimensional figure (minimum dimension is 2)
  - if you enter 8 -&gt; (2 x 2 x 2) -&gt; Yes
  - 10 -&gt; (5x2) -&gt; No
  - 12 -&gt; (2x2x3) -&gt; Yes
-
- Rotate a matrix anti-clockwise (matrix can be rectangle too)
- Given a sorted array, find the median of the subarray with values greater than or equal to k
- Given lines, count all words and alpha characters
- Design an orderbook
- Moderate difficulty. Questions were like matrix rotation, recursion etc.
- How to search and construct a certain type of data out of database?
- input: (array, k), find median of the subarray which includes numbers smaller than or equal to k . 2. matrix rotation 3. orderbook 4. parsing words.
- Given array find median of elements that are less than given number k. k exist in the array
- Find number of palindrome dates (MMDDYYYY) in century (ex 1000-9999).
- You are given an array of numbers (old trades) with label (good, bad). Predict label for the new array. I spent a lot of time thinking about it, but it seems very simple question. Solved with simple approach got 4/5 test cases.
- Given a grid with 0s -1s and 1. You can walk on 0s only and try to reach 1s. Print if you can reach or not. I think related to path finding algorithm.
- longest possible sequence to pack
- What is your experience with numerical programming?
- What are the names and algorithms of some sorting techniques?
- What is the probability of an integer from 1 to 60,000 not having the digit 6?
  - My guess, number of integers not having the digit 6=6\*9\*9\*9\*9-1=39365
  - So the probability is about 0.6561.
- How would you implement streaming median?
- What is the complexity of a heap insert?
- was given 150 lines and asked to write an Ai behavior algorithm
- Ai flocking algorithm



Math

- 5-6 Math, probability, pair questions
- Linear interpolation among certain values or set of values. Easy but alot of conditions on when to do the linear interpolation. Story time this time was about a marriage wedding planner who had to buy stuff for events and people.
- Hirewire questions were few quant questions based on Perm and combination and algebra.
- est with Zetamac (Math software)
- (linear algebra/calculus..etc)
- Find the limit distributions of a markov chain
- Also there is some test on knowledge of probability and statistic, as well as computer architectures
- Given any random unknown population, you draw one billion samples from it. How would you find the 99th percentile of it?
-

C++

- Do you know about smart pointer in C++? What does it do?
- C++ 11, 14 etc
- Difference between virtual and abstract class
- Describe a smart pointer. What is the size of a smart pointer.
- Other technical questions are about CS fundamentals and C++14 features
- Linux System questions, virtual functions in C++, memory management, etc
-

HR

- Why do you want to join Akuna?
- Describe a hard bug you had and how you solved it

- Simple Order Book
- Verify if two triangles are similar through 1) translation and 2) Rotation
- Standard dynamic programming
- Judge stock performance (up or down) according to given data. Basically discriminant analysis
- The other one is ask about memory and one technical questions, implement memory pool
- Common OOP concepts and Python things, Python garbage collection, decorators, OOP, &quot;with&quot; keyword, Dynamic programming similar to LIS
- find all valid parentheses, flatten BST to linked list
- Given a rectangle and a list of tetris (denoted by coordinates), return if these tetris blocks can cover the rectangle 2. Given a transition matrix and a initial probability distribution vector, compute the stable probability distribution vector 3. Given lines of strings, aggregate valid words and then count the frequency of each word and frequency of letters
- Matching parentheses, Prime factorization, fair dice expected value when rolled n times.
- 142857, 285714, 428571, 571428,\_\_\_\_\_\_?
- The task was to find the marking position according to various JSON events like sell, buy etc
- code Q1: Cut-the-Sticks problem.
- code Q2: (S Expression) Binary tree problem.
- Several APIs are given. You&#39;re asked to write two functions to compute round-trip time between two clients in a network.
- If you want to keep a running average, and values are updated every second, how would you store the information?
- Then a coding challenge which was just to implement a strategy for the battleship board game- and an interview to go over your implementation.
- The phone interview is about RR schedule.
- Probability \*theory\* questions
- keep throw a coin if two head A will win if first is head second is tail B will win, keep throwing until have a winner. who has better chance to win?
- 1 question was based on wiggle sort, other was some dice problem.
- Q: integer list mapping and alternations   , Q: find the maximum perimeter of the polygons could form given a list of points with their vectors.   , Q: brackets eliminations. ex {{}} -&gt; true; {)}( -&gt; false; {}[] -&gt; true
- There are N satellites that can deliver messages. Each satellite can only deliver messages to some subset of satellites. For each satellite that can send a message, each message has a delay in time. Given a starting satellite, that sends a message return the minimum time required for all the satellites to receive the message. If the message cannot be broadcasted to all satellites then return -1.
- (in particular random processes and random walks)
-         1. Given a list of numbers with some repeated elements , return a new list that every element appears only once. For example, input list: [1,2,2,3,4,4], output: [1,2,3,4]. 2. Return the powers of 2 in the inclusive range [low, high] (&#39;low&#39;, &#39;high&#39; are positive integers). 3. De ne a class with the method functions: (1) insert(value): insert some value to its internal attribute, (2) get max(): get the maximal value, (3) get mode(): get the mode, (4) get mean(): get the mean
- Solve probability brain teaser with simple coding.
- graph algorithm
- sorting algorithm
- math calculation, conditional probability
- C++ concepts such as virtual function, template, atomicity
- Probabilities question of throwing dices ...



- --Sequence
- --Codepair
- --Square inside circle
- --Powers of 2
- --DS python
- --Two sum, no space
- --Pm, combin
- --Class design, insert O(1), retrive O(1)



- Random links
  - Aaron Hall - SO Moderator amazing tips overall
    -  [https://aaronchall.github.io/#sec-1](https://aaronchall.github.io/#sec-1)
  -