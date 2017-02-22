---
layout: post
title: Data Science Introduction
excerpt: "Some Introductory concepts of Data Science"
categories: articles
tags: [datascience, R]
author: riken_shah
comments: true
share: true
modified: 2017-01-25T14:18:57-04:00
published: true
---

# Introduction

- We always have either very small data or a surplus of data. We are interested in answering questions that we want to solve using the data.
- Statistics is the base of it all.
- There is explosive growth in data right now, hence its a perfect time. Also lots of tool are available.
- R programming? Most commonly used language for data science. Other popular language - python. 
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

Main focus is on R programming language in data science. RStudio is an IDE for R. Best part - Its free. Primary types of files, R scripts, have `.R` extension. `.Rmd` is used for creating docs, which is a base of *Reproducible Research*. Also distributed version control is done using `Github`. 

### Few important R functions

`?rnorm` -> Tells where the help file is?
`help.search("rnorm") -> No need to even get the function name right
`args("rnorm") -> Will tell us function arguments
`rnorm` -> Just type the function name, and it will display the entire code of the function.


### Types of Data Science questions

1. Descriptive Analysis
Goal is to just describe and interpret the given data. Example of it can be, descriptive analysis of census data, or google n-grams.

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
More challanging, if X predicts Y, does not mean X causes Y.
More data and simple model works really well.
Example - Outcome of US elections from Polling.

5. Causal Analysis
What happens to Y with a change in X. Much difficult. 
Usually randomized models are used.
Causal relationships are usually identified as average effect, but can be applied to individuals.
Example - Medical symptoms etc.

6. Mechanistic Analysis
Very rare, understand the exact changes in variables that leads to exact changes in otehr variables. 
Applicable in physical and engineering sciences.

### What is data

- Values of qualitative or quantitative variables, belonging to a set of items.
- Set of things, that you are going to make measurements on.
- Variable - A measurement or a characteristic of an item

The most important thing is, the question that you want to answer. Data comes second. But having data can't save if you do not have a question.

- Some dataset requires cloud computing, due to lack of local computational power.

- Getting the right data is very important, only size of dataset is not an important criteria.

- Correlation is not causation. Everything that is correlated, may not be related in reality. 
Example - Chocolate consumption, vs, Nobel laureuts. There must be some confounding variable.

- Prediction is slighly more challenging than inference.

