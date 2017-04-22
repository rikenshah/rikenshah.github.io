---
layout: post
title: NLTK CheatSheet - Part 2
excerpt: "Some basic functionality of NLTK"
categories: articles
tags: [nltk, python, natural_language_processing]
author: riken_shah
comments: true
share: true
modified: 2016-012-02T14:18:57-04:00
published: true
---
### Named Entity Recognition

- One of the most major forms of chunking in natural language processing is called "Named Entity Recognition." The idea is to have the machine immediately be able to pull out "entities" like people, places, things, locations, monetary figures, and more.
- There are two major options with NLTK's named entity recognition: either recognize all named entities or recognize named entities as their respective type, like people, places, locations, etc.

##### NE Type and Examples
- ORGANIZATION - Georgia-Pacific Corp., WHO
- PERSON - Eddy Bonte, President Obama
- LOCATION - Murray River, Mount Everest
- DATE - June, 2008-06-29
- TIME - two fifty a.m, 1:30 p.m.
- MONEY - 175 million Canadian Dollars, GBP 10.40
- PERCENT - twenty pct, 18.75 %
- FACILITY - Washington Monument, Stonehenge
- GPE - South East Asia, Midlothian

*<a href="http://rikenshah.github.io/articles/named-entity-recognition-with-nltk/" target="_blank">Check this out for detailed post on Named Entity Recognition</a>*

__________________________________________________________________________________________

### Wordnet

Wordnet is a lexical database of English that serves as a very large corpus as required by NLP tasks. It can be used to find synonyms of a word, find similarity between two words. Also, similarity can be of various kinds, like path similarity, etc.

- `from nltk.corpus import wordnet`
- `syns = wordnet.synsets("program")` # returns a list of synsets objects which has various methods like *name*
- Synsets are synonyms of a given work. 
- `print(syns[0].name())` #method name is called on one synset object
plan.n.01
- `print(syns[0].lemmas()[0].name())` ->  prints just the name 
plan
- `print(syns[0].definition())`
 a series of steps to be carried out or goals to be accomplished 
- `print(syns[0].examples())`
['they drew up a six-step plan', 'they discussed plans for a new bond issue']

##### Finding synonyms and antonyms

```python
synonyms = []
antonyms = []

for syn in wordnet.synsets("good"):
    for l in syn.lemmas():
        synonyms.append(l.name())
        if l.antonyms():
            antonyms.append(l.antonyms()[0].name())

print(set(synonyms))
print(set(antonyms))
```
- There are also other methods of similarity  like `path_based` similarity and so on.

_____________________________________________________________________________

### Classification

- `nltk.FreqDist(all_words)`  -> Gives freq distribution
-  There are built-in classifiers in NLTK like naive bayes classifier ( and others also, eg. sklearn module) and the function to train and test against it.

- We can save the classifier using `pickle` module so that no need to train every time we need to use it.

```python
save_classifier = open("naivebayes.pickle","wb")
pickle.dump(classifier, save_classifier) # classifier is the variable classifier and save classifier is like flag
save_classifier.close()
```
 And to load it back

```python
classifier_f = open("naivebayes.pickle", "rb")
classifier = pickle.load(classifier_f)
classifier_f.close()
```

___________________________________________________________________________________________

### Scikit-Learn

- The people behind NLTK foresaw the value of incorporating the sklearn module into the NLTK classifier methodology. As such, they created the SklearnClassifier API of sorts. To use that, you just need to import it like:
` from nltk.classify.scikitlearn import SklearnClassifier`
 - There are loads of classifiers in sklearn, just check that out.
- Also, we can use Stanford NER and POS tagging modules. Check out tutorials for more.
- *Refer tutorials for various other classifiers and how a combination of such classifiers can be used*

#### Sources

1. <a href="https://pythonprogramming.net/tokenizing-words-sentences-nltk-tutorial/" target="_blank">Python Programming tutorials</a>
