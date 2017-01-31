---
layout: post
title: NLTK CheatSheet - Part 1
excerpt: "Natural Language Processing with NLTK"
categories: articles
tags: [nltk, python]
author: riken_shah
comments: true
share: true
modified: 2016-12-29T14:18:57-04:00
published: true
---

### Some basics

Some of the basic Natural Language Processing (NLP) tasks are tokenization, stemming, lemmatization, parsing, chunking, chinking, etc. Lets look at how this can be done using `python` library named `NLTK`.

#### Setting up

- You must ideally use `virtualenv` for installing any python packages. Hence the system must have `virtualenv`, `python-2.7`, and `pip` (python package manager) installed. [Follow this guide for setting up.]({{site.url}}articles/setting-up-python-environment/)
- Make an activate `virtualenv` and activate it.
- First install `NLTK` using `pip install nltk`.
- Download data from python shell.

```
python
>>> import nltk
>>> nltk.download('all',halt_on_error=False)
```
### Basic Tasks with `NLTK`

```python
# sent_tokenize - used for tokenizing into sentences
# word_tokenize - used for tokenizing sentences into words

from nltk.tokenize import word_tokenize # Way of importing the word_tokenizer

from nltk.corpus import stopwords # for importing stop words
stop_words = set(stopwords.words('english')) # for assigning english stop words to variable

from nltk.stem import PorterStemmer # for stemming
ps = PorterStemmer()
ps.stem([list])

from nltk.tokenize import PunktSentenceTokenizer # Another type of sentence tokenizer. This tokenizer is capable of unsupervised machine learning, so you can actually train it on any body of text that you use.
``` 
_____________________________________________________________________________

### List of Pos Tags

POS tag list:

- CC	coordinating conjunction
- CD	cardinal digit
- DT	determiner
- EX	existential there (like: "there is" ... think of it like "there exists")
- FW	foreign word
- IN	preposition/subordinating conjunction
- JJ	adjective	'big'
- JJR	adjective, comparative	'bigger'
- JJS	adjective, superlative	'biggest'
- LS	list marker	1)
- MD	modal	could, will
- NN	noun, singular 'desk'
- NNS	noun plural	'desks'
- NNP	proper noun, singular	'Harrison'
- NNPS	proper noun, plural	'Americans'
- PDT	predeterminer	'all the kids'
- POS	possessive ending	parent's
- PRP	personal pronoun	I, he, she
- PRP$	possessive pronoun	my, his, hers
- RB	adverb	very, silently,
- RBR	adverb, comparative	better
- RBS	adverb, superlative	best
- RP	particle	give up
- TO	to	go 'to' the store.
- UH	interjection	errrrrrrrm
- VB	verb, base form	take
- VBD	verb, past tense	took
- VBG	verb, gerund/present participle	taking
- VBN	verb, past participle	taken
- VBP	verb, sing. present, non-3d	take
- VBZ	verb, 3rd person sing. present	takes
- WDT	wh-determiner	which
- WP	wh-pronoun	who, what
- WP$	possessive wh-pronoun	whose
- WRB	wh-abverb	where, when

_____________________________________________________________________

### Using punkt tokenizer

```python
import nltk
from nltk.corpus import state_union # importing some particular corpus
from nltk.tokenize import PunktSentenceTokenizer 
train_text = state_union.raw("2005-GWBush.txt") # way of importing a text out of corpus 
sample_text = state_union.raw("2006-GWBush.txt")
custom_sent_tokenizer = PunktSentenceTokenizer(train_text) #training punktSentenceTokenizer
tokenized = custom_sent_tokenizer.tokenize(sample_text)
def process_content():
    try:
        for i in tokenized[:5]: # tokenizing first 5 sentences only
            words = nltk.word_tokenize(i)
            tagged = nltk.pos_tag(words)
            print(tagged)

    except Exception as e:
        print(str(e))

process_content()
```

The above code is going to give a list of tuples with each element being something like this 
('during', 'IN'), ('his', 'PRP$') ...

___________________________________________________________________________

### Chunking with NLTK
- Meaning separating the noun phrase 
- Now that we know the parts of speech, we can do what is called chunking, and group words into hopefully meaningful chunks. One of the main goals of chunking is to group into what are known as "noun phrases." 
- The idea is to group nouns with the words that are in relation to them.

The regex guide:

- \+ = match 1 or more
- ? = match 0 or 1 repetitions.
- \* = match 0 or MORE repetitions	  
- . = Any character except a new line

*refer code*

__________________________________

### Chinking with NLTK

- You may find that, after a lot of chunking, you have some words in your chunk you still do not want, but you have no idea how to get rid of them by chunking. You may find that chinking is your solution.
- Chinking is a lot like chunking, it is basically a way for you to remove a chunk from a chunk. The chunk that you remove from your chunk is your chink.

*refer code*

_____________________________________________________________________________________________

### Lemmatization

- A very similar operation to stemming is called lemmatizing. The major difference between these is, as you saw earlier, stemming can often create non-existent words, whereas lemmas are actual words.
- So, your root stem, meaning the word you end up with, is not something you can just look up in a dictionary, but you can look up a lemma.
- Some times you will wind up with a very similar word, but sometimes, you will wind up with a completely different word. 

```python
>>> print( lemma.lemmatize("cats"))
cat
>>> print( lemma.lemmatize("cacti"))
cactus
>>> print( lemma.lemmatize("geese"))
goose
>>> print( lemma.lemmatize("rocks"))
rock
```

- The only major thing to note is that lemmatize takes a part of speech parameter, "pos." If not supplied, the default is "noun." 

```python
>>> print( lemma.lemmatize("better", pos="a"))
good
>>> print( lemma.lemmatize("better"))
better
```

#### Sources

1. <a href="https://pythonprogramming.net/tokenizing-words-sentences-nltk-tutorial/" target="_blank">Python Programming tutorials</a>

