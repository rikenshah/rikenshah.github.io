---
layout: post
title: Named Entity Recognition in python using StandfordNER and NLTK
excerpt: "Implementing NER with NLTK in Python"
categories: articles
tags: [nltk, python, natural_language_processing]
author: deesha_shah
comments: true
share: true
modified: 2017-01-05T14:18:57-04:00
published: true
---

### Using StandfordNER and NLTK for Named Entity Recognition in Python

**StanfordNER** is a popular tool for a task of Named Entity Recognition. Named Entity Recognition (NER) labels sequences of words in a text which are the names of things, such as person and company names, or gene and protein names. However, the implementation of StanfordNLP is in Java. So there is a way to use this wonderful tool in python as well, since you know, *Python* is life for a programmer. NLTK, which is a python library for Natural Language Processing, provides an interface of Stanford NER. The steps to implement it are as follows:

- Import StanfordNER Wrapper from `nltk.tag`

```python 
from nltk.tag import StanfordNERTagger
```

Note that the old class name was NERTagger instead of StanfordNERTagger. 

- Download the zip file of StanfordNER from its link and unzip its contents. It contains a file called `stanford-ner.jar`. We need to set path of the jar file and models

```python 
model = 'stanford-ner/classifiers/english.all.3class.distsim.crf.ser.gz'
jar = 'stanford-ner/stanford-ner.jar'
```

Note the path. You need to add the path where the jar file belongs in your directory.

- Now we use those paths in the StanfordNERTagger Wrapper to make it work in python

```python 
st = StanfordNERTagger(model,jar)
```

- Now add the input sentence as follows to get the output.

```python 
print st.tag(‘John is studying at SUNY Buffalo University in NY’.split())
```

Which results in the following output.

```python 
(u'PERSON      ', u'John')
(u'ORGANIZATION', u'SUNY Buffalo University')
```

Hope that was helpful. Comment below for hugs of bugs.