---
layout: post
title: Clean Code
excerpt: "A guide to a clean code"
categories: articles
tags: [programming]
author: riken_shah
comments: true
share: true
modified: 2017-05-3T14:18:57-04:00
published: true
---

## Introduction

When I started coding, I never realised the importance of writing clean code. I felt that as long as it works, its all good. The only problem was, when I looked at the same code after couple of months, I failed to understand many things which I did back when I first wrote it. It started taking me hours to figure out what was actually going on. Over the time, with improved coding habits I realized how this problem can be eliminated. I came across the book named '*Clean Code*' by '*Robert C. Martin*' and found out some amazing lessons about improving the code quality as well as readability. Here I present the gist of the same.

- Messy code can considerably slow us down. It's hard to maintain, and modify the code if it can not be easily understood.
- Voice your opinion if you feel, the code needs be improved. It is your manager's duty be passionate about the deadline, but it is your duty to defend your code.
- Only way to go fast is to have a clean code. Although, it may take more time initially, it would benefit a lot in long term.
- Bjarne Stroustrup thinks 
  > I like my code to be elegant and efficient. The logic should be straightforward to make it hard for bugs to hide, the dependencies minimal to ease maintenance, error handling complete according to an articulated strategy, and performance close to optimal so as not to tempt people to make the code messy with unprincipled optimizations. Clean code does one thing well.
- Clean code is focused, it does *one thing* well.
- Reading to Writing ratio while programming is about 10:1, i.e., when we write a piece of code, we read 10 times more (mainly old code) then what we write. so we need to make sure that reading should be very easy. 
- A clean code is like a well written prose.
- Leave the background cleaner then you found it. The continuous improvement is an intrinsic property of professionalism.
- The aim is to develop a '*code-sense*' which will take you long.

### Meaningful Names
- Names should be intent revealing. If it requires a comment, then its a bad name.
- Ambiguity should be avoided. Dont use `xyzControllerForStorage` with `xyzControllerForAPI`, since they are frightfully similar. Also shortforms should be avoided since they might represent something else. Using smaller case L would be confused with 1, etc.
- Noise words, must be avoided. For instance using `klass` since `class` can not be used. Or `productInfo` and `productData`, are used together, while essentially they both mean the same.
- Don't use non-informative words like `a1`, `n` etc.
- No redundancies, word `variable` should never appear in the variable name. 

```java
  getActiveAccount();
  getActiveAccounts();
  getActiveAccountInfo();
```

- Use variable names that can be pronounced, like `generatedTimestamp` and not like `gendmh`.
- Use searchable names. Single letter words or constants like 7 and all must be avoided. Instead use some constant identifier like `MAX_SIZE` etc. *The length of the name should correspond to the size of its scope*. Bigger the scope in which the variable is valid, longer the name and vice versa.
- Prefixes and Suffixed are just clutter. Hence, must be avoided whenever possible.
- Class names should be a Noun or Noun Phrase like `Customer` and not a verb like `Processor`.
- Method names should be verbs and `get` and `set` must be used appropriately.
- Don't be humorous, other people may not share the same feeling. *Say what you mean, mean what you say*.
- One word per concept is very important, Using `driver` , `controller` and `manager` in the same code base, can be quite confusing.
- Same function names should work in the same way, two `add()` methods should have same semantics. There should be no surprises.
- Use technical names, since a person who reads your code also will be a programmer.
- The code that has more relation with problem domain must have problem-domain names, and same goes for the code that is for solution domain.
- Use appropriate amount of context, no more no less. Use `userAddress` only when necessary, else only `address` would be a better choice.

### Functions

- They should be small. Never bigger than 20 lines. Ideally 5-10 lines.
- Blocks within `if`, `for`, etc should be a function call. This helps to reduce size.
- Functions should do one thing, they should do it well, they should only do that.
- A way to know that a function is doing more than *one thing* is if you can extract another function from it with a name that is not merely a restatement of its implementation.
- There should be one level of abstraction per function. `append("\n")` cannot be in the same function as `getHtml()` is in. Each function should have same level of abstraction inside of it.
- Must read code in Top-down fashion, like a story.
- Be consistent with function names. `includeSetupPages()` should work in similar way as `includeTeardownPages()`.
- Use least number of arguments, arguments make code less readable. Best is no arguments, next best thing is one argument. Then the things starts to boil up.
- Never pass on flags to a function, since it clearly states, that the function is doing more than one thing.
- `assertEquals(expected, actual)` this is the order of arguments followed by convention.

```c
Circle makeCircle(double x, double y, double radius);
Circle makeCircle(Point center, double radius); //A better one
```  

- Do not worry about long variable names, it will go a long way as long as they are descriptive enough.
- Functions should either do something or answer something, but not both.
- Do Not Repeat Yourself. It bloats up the code.
- > When I write functions, they come out long and complicated. They have lots of
  > indenting and nested loops. They have long argument lists. The names are arbitrary, and
  > there is duplicated code. But I also have a suite of unit tests that cover every one of those
  > clumsy lines of code.
  > So then I massage and refine that code, splitting out functions, changing names, eliminating > duplication. I shrink the methods and reorder them. Sometimes I break out whole
  > classes, all the while keeping the tests passing.
  > In the end, I wind up with functions that follow the rules I’ve laid down in this chapter.
  > I don’t write them that way to start. I don’t think anyone could.


### Comments
- When code fails to explain things, we need to use comments. It's nothing to be proud of.
- Use minimal comments, only when absolutely necessary. Since many a times, code evolves, and comments become outdated, and they **lie**. Also they become separated from the code and hence just becomes a mess.
- Inaccurate comments mislead, truth can be found only at one place, the code.
- Comments do not make up for the bad code, cleaning code is far more important than commenting code.

```java
// Check to see if the employee is eligible for full benefits
if ((employee.flags & HOURLY_FLAG) && (employee.age > 65))

MUCH BETTER VERSION
if (employee.isEligibleForFullBenefits())
```

- Where comments are necessary?
  - Legal comments, licences etc. However, here also , referring to external document is much better than putting all the conditions in one place.
  - Informative comments, explaining what a return value of an abstract method would be, or what string would be matched by a REGEX.
  - Explanation of Intent, to be clear about why such a decision was made. 
  - Clarification of some abstract terms.
  - Warning of Consequences.
  - TODO comments, things that you want to look at, later. However, keep them in check.
  - Amplification of a small thing that is actually very important.

- What are bad comments?
  - Mumbling that only you can understand.
  - Redundant Comments, only increases time to comprehend.
  - Misleading Comments.
  - Mandatory Comments, just for a sake of having comments, would lead to disorganized code and mess.
  - Journal Comments - SVN or Git does exactly that, so no need.
  - Just Noise and Venting out your frustration.
  - Golden Rule - *Do not use a comment when you can use a function or a variable*.
  - Position Markers like `///// Actions /////` and so on. Use only if absolutely necessary.
  - Closing Brace Comments like `endfor` etc. It indicates that your function is too  complex, hence you require such comments, instead shorten your functions.
  - Attributions - again SVN and Git is there to take care of it.
  - Commented out code - A drag at the bottom of bad bottle of wine
  - HTML comments.
  - Nonlocal information, describe only the current code in context.
  - Too much information.
  - Function Header.
  - Inobvious information.

### Formatting
Consistency with a set of formatting rules that you have decided upon (with your team maybe) helps in creation of clean code.

#### Vertical Formatting
- Small files are easier to understand than large files. Hence 200 lines are an ideal vertical length of the files. However, it should not cross 500 lines.
- Keep a source file like a newspaper articles, first para intro, and detailed as you go on. Level of abstraction decreases as you go down.
- Use blank lines to separate concepts from one another, this has a profound effect on the readability of the code.
 
 ```java
  public class ReporterConfig {
    /**
    * The class name of the reporter listener
    */
    private String m_className;
    /**
    * The properties of the reporter listener
    */
    private List<Property> m_properties = new ArrayList<Property>();
    public void addProperty(Property property) {
    m_properties.add(property);
  }

  THE BETTER VERSION

  public class ReporterConfig {
    private String m_className;
    private List<Property> m_properties = new ArrayList<Property>();
    
    public void addProperty(Property property) {
    m_properties.add(property);
   }
  ```

- Vertical distance is a great factor. Concepts that are related to each other should be kept together in vertical proximity.
- Variables should be declared in the proximity of where they are used. Remember, our functions are very small always.
- Instance variables should be declared at the top.
- Dependent functions should be vertically close. Caller should be immediately followed by the calle. This gives a natural flow.
- The vertical ordering should be from more abstract to detailed concepts (from top to bottom), just like a newspaper article.

#### Horizontal Formatting
- 120 characters are a limit, no horizontal scrolling must be required.
- Horizontal density must be used.

```java
private void measureLine(String line) {
  lineCount++;
  int lineSize = line.length(); //Space around '=' but not between'()' and 'length'
  totalChars += lineSize;
  lineWidthHistogram.addLine(lineSize, lineCount); //Arguments must be space separated
  recordWidestLine(lineSize);
}
```

#### Indentation
- Each level of indentation is a scope of that particular block of information.
- Do not break indentation rules for short functions or `if` or `for` statements.

### Objects and Data Structures
- Objects expose behavior and hide data. This makes it easy to add new kinds of objects without changing existing behaviors. It also makes it hard to add new behaviors to existing objects. 
- Data structures expose data and have no significant behavior. This makes it easy to add new behaviors to existing data structures but makes it hard to add new data structures to existing functions.
- In any given system we will sometimes want the flexibility to add new data types, and so we prefer objects for that part of the system. Other times we will want the flexibility to add new behaviors, and so in that part of the system we prefer data types and procedures. 
- Good software developers understand these issues without prejudice and choose the approach that is best for the job at hand.
- Do not ever return NULL values, so that you do not need to check for them every time.

### Using third party code
- Before integrating, we must first test whether it works fine, since after integration debugging would be a humongous task.
- Write *learning tests* to first conceptualize the working of the third party code, and its not a time waste, since anyways you will need to learn the working of external API etc.
- Our code should not very much depend on the third party's code. It is better to depend on something you control than on something you don't.
- When you don't know much about the external interface, make an adapter of your own.

### Unit Tests
- Test Code is as important as the production code.
- If you have proper tests, you do not fear making changes to the code. Since without tests, there is a chance that you introduce undetected bugs.
- So having an automated suite of unit tests that cover the production code is the key to keeping your design and architecture as clean as possible.
- Five rules for writing test cases. F.I.R.S.T
  - Fast - Else you won't run them frequently
  - Independent - From one another
  - Repeatable - Since failing of the test cases should not be because of environment issues
  - Self-Validating - Boolean output, pass/fail. No log files to be read and stuff.
  - Timely - Make tests before writing production code, since you can design the production code in that way then.

### Classes
- Higher lever of code organization is as important as lower level one.
- Classes should be small
- Classes should have limited responsibilities, and the name must be able to be derived from it. If we can not derive a proper class name, then perhaps its too big and should be broken down. *Don't create God classes*.
- We should also be able to write a brief description of the class in about 25 words, without using the words “if,” “and,” “or,” or “but.”
- Hence follow the single responsibility principle. (SRP)
- We want many small classes, then a large one class. Having a single large class does not simplify the picture, the logic and its complexity remains the same. Hence, it would be much better if its organized into small boxes and labeled appropriately rather then having a big mess in a single box.
- In classes, there must be high cohesion, the maximum methods should use the instance variables of the class which makes whole class looks like a single logical unit.
- All instance variables should be important to maximum number of methods, if a set of instance variables is useful for a set of methods, make that set a new class.

### Emergence
- Four rules given by Kent Beck, for Simple Design must be followed.
  - Runs all the tests
  - Contains no duplication
  - Expresses the intent of the programmer
  - Minimizes the number of classes and methods

### Concurrency
- Concurrency (Threading, in many platforms) is a decoupling strategy to decouple *what* from *when*. This can be useful to improve throughput and the structure of the application.
- Some things to remember
  - Concurrency does not always improve performance
  - Design can dramatically change when the concurrent programs are written
  - Concurrency incurs some overhead
  - Correct concurrency is complex
  - Concurrency bugs aren't usually repeatable, so they are often ignored as one-offs instead of the true defects they are
- You must keep your concurrency related course separate from other code.
- Attempt to partition data into independent subsets than can be operated on by independent threads, possibly in different processors.
- Do not ignore system failures as one-offs.
- Do not try to chase down non-threading bugs and threading bugs at the same time. Make sure your code works outside of threads.
- Make your thread-based code especially pluggable so that you can run it in various configurations.
- Run your threaded code on all target platforms early and often.

### Conclusion
- **To write clean code, you must first write dirty code and then clean it.** Most people stop at the first step once they get the desired results. However, only the professionals know that its a suicide.
- Commented-out code is an *abomination*. Must get rid of it ASAP.
- Functions should not have too many arguments, flag arguments (which itself proves, that the function is doing more than one thing). Also dead functions must be immediately removed.
- Variables and function should be defined close to where they are used. Local variables should be declared just above their first usage and should have a small vertical scope. We don’t want local variables declared hundreds of lines distant from their usages.
- Private functions should be defined just below their first usage. Private functions belong to the scope of the whole class, but we’d still like to limit the vertical distance between the invocations and definitions. Finding a private function should just be a matter of scanning downward from the first usage.
- If you do something a certain way, do all similar things in the same way. This goes back to the principle of least surprise.
- Use explanatory names for the variable and functions.
- Don't use magic numbers, use named constants instead.
- Enforce design decisions by giving higher priority to structure over convention.
- Avoid negative conditionals like `if (!buffer.shouldNotCompact())` . Use `if (buffer.shouldCompact())` instead.
- If you have a constant such as a default or configuration value that is known and expected at a high level of abstraction, do not bury it in a low-level function.
- Choose very precise names. A variable that can contain any other number too, should not be named as `phone_number`.
- The length of a name should be related to the length of the scope. You can use very short variable names for tiny scopes, but for big scopes you should use longer names.
- Each and everything in the code must be tested out. Use various coverage tools for the same.
- Bugs hide in the vicinity of other bugs.
- Tests should be fast.

I hope that was helpful. Comment below describing your own coding style and how it has helped you.