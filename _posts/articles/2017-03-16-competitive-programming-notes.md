---
layout: post
title: Competitive Programming Notes
excerpt: "Notes about Competitive Programming"
categories: articles
tags: [cpp, python, algorithms]
author: riken_shah
comments: true
share: true
modified: 2017-03-17T14:18:57-04:00
published: false
---

## C++ 

- Use `long long` when very long numbers like 10^16
- `getline(cin, input_string);` can be used to readline from cin and store in input_string
-  Both of the following gives same o/p.

```
cout << fixed << setprecision(2) << pi << endl;
printf("%.2f", pi);
```

- A clean way to find count of character occurences in a string

```
#include <algorithm>
std::string s = "a_b_c";
size_t n = std::count(s.begin(), s.end(), '_');
```

- Using hashmaps in C++

```
#include <map>
#include <iostream>
#include <cassert>

int main(int argc, char **argv)
{
  std::map<std::string, int> m;
  m["hello"] = 23;22
  // check if key is present
  if (m.find("world") != m.end())
    std::cout << "map contains key world!\n";
  // retrieve
  std::cout << m["hello"] << '\n';
  std::map<std::string, int>::iterator i = m.find("hello");
  assert(i != m.end());
  std::cout << "Key: " << i->first << " Value: " << i->second << '\n';
  return 0;
}
```

- Remove all occurences of a character in a string / or an element from a vector

```
str.erase(std::remove(str.begin(), str.end(), 'a'), str.end());

// for an element of an array
nums.erase( remove( nums.begin(), nums.end(), val ), nums.end() );
// nums.end() is updated here after all removed elements are moved to end of the vector

// Or using boost libraries
#include <boost/algorithm/string.hpp>
boost::erase_all(str, "a");
```

- Finding an item present in the vector

```
#include <algorithm>
std::find(vector.begin(), vector.end(), item) != vector.end()
```


## Mathematical

- `(a + b) % n = (a % n + b % n ) % n`
- Sum of first n natural numbers is n(n+1)/2
- Sum of squares of first n natural numbers (1^2 + 2^2 + ... + n^2) = n(n+1)(2n+1)/6

## Random tips and tricks

- Think of edge cases like 0 and NULL values and also very large values as per the constraints given.
- This is quite useful for visualizing trees -> https://lautgesetz.com/latreex/


### References
- http://www.cs.wustl.edu/~schmidt/C++/
- http://stackoverflow.com/
