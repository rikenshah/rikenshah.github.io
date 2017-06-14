---
layout: post
title: Data Science Introduction
excerpt: "Some Introductory concepts of Data Science"
categories: articles
tags: [data_science, R]
author: riken_shah
comments: true
share: true
modified: 2017-01-25T14:18:57-04:00
published: true
---

# Introduction

With increasing amount of data in the last decade, the need to make sense of it has been more than ever. Data, in its raw form, is useless. Unless, it's converted to some strategic information which can help make useful decisions, is just eating away space. Hence, the field of data science is in its prime time now. I have been learning data science from an online course at [Coursera](https://www.coursera.org/), and here are some key takeaways. 

- We always have either very small data or a surplus of data. We are interested in answering questions that we want to solve using the data.
- Statistics is the base of it all.
- There is explosive growth in data right now, hence it's a perfect time. Also, lots of tools are available.
- R programming? Most commonly used language for data science. Another popular language - python. 
    - Free
    - Comprehensive set of packages
    - Best development environments
    - East to install
- Data scientist? Someone who uses data to answer questions. 
- Data science = hacking skills + math and statistics + substantive expertise
- hacking skills = programming + ability is to answer questions
- Recommended Book (https://leanpub.com/datastyle/)

### What Data Scientist do?
- Define question
- Define dataset
- Get data
- Clean data
- Modelling
- Results
- Distribute results

The main focus is on R programming language in data science. RStudio is an IDE for R. Best part - It's free. Primary types of files, R scripts, have `.R` extension. `.Rmd` is used for creating docs, which is a base of *Reproducible Research*. Also distributed version control is done using `Github`. 

### Few important R functions

- `?rnorm` -> Tells where the help file is?
- `help.search("rnorm")` -> No need to even get the function name right
- `args("rnorm")` -> Will tell us function arguments
- `rnorm` -> Just type the function name, and it will display the entire code of the function.


### Types of Data Science questions

1. Descriptive Analysis
The goal is to just describe and interpret the given data. An example of it can be, descriptive analysis of census data, or google n-grams.

2. Exploratory analysis
Find relations in the data. For finding new connections. 
"Correlation does not imply causation"
Usually not the final say, and should not be used for generalization/prediction.
Example, which brain region lights up, upon what stimulus.

3. Inferential Analysis
Take small data and infer about some larger data. Most popular task.
Example - Effect of Air pollution on life expectancy

4. Predictive Analysis
use data on some objects to predict values for another object.
More challenging, if X predicts Y, does not mean X causes Y.
More data and simple model work really well.
Example - Outcome of US elections from Polling.

5. Causal Analysis
What happens to Y with a change in X. Much difficult. 
Usually, randomized models are used.
Causal relationships are usually identified as an average effect but can be applied to individuals.
Example - Medical symptoms etc.

6. Mechanistic Analysis
Very rare, understand the exact changes in variables that lead to exact changes in other variables. 
Applicable in physical and engineering sciences.

### What is data

- Values of qualitative or quantitative variables, belonging to a set of items.
- Set of things, that you are going to make measurements on.
- Variable - A measurement or a characteristic of an item

The most important thing is the question that you want to answer. Data comes second. But having data can't save if you do not have a question.

- Some dataset requires cloud computing, due to lack of local computational power.

- Getting the right data is very important, the only size of the dataset is not the important criteria.

- Correlation is not causation. Everything that is correlated, may not be related in reality. 
Example - Chocolate consumption, vs, Nobel laureates. There must be some confounding variable.

- Prediction is slightly more challenging than inference.
