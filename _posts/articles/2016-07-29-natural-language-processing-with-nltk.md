---
layout: post
title: Natural Language Processing with NLTK in Python
excerpt: "Natural Language Processing with NLTK"
categories: articles
tags: [nltk, python, natural_language_processing]
author: riken_shah
comments: true
share: true
modified: 2016-12-29T14:18:57-04:00
published: true
---

### Some basics

Some of the basic Natural Language Processing (NLP) tasks are tokenization, stemming, lemmatization, parsing, chunking, chinking, etc. Lets look at how this can be done using `python` library named `NLTK`.

#### Setting up

- You must ideally use `virtualenv` for installing any python packages. Hence the system must have `virtualenv`, `python-2.7`, and `pip` (python package manager) installed. [Follow this guide for setting up.]({{site.url}}/articles/setting-up-python-environment/)
- Make an activate `virtualenv` and activate it.
- First install `NLTK` using `pip install nltk`.
- Download data from python shell. Note that this will take a long time if your internet is slow. You can even download individual packages as and when you need.

```python
python
>>> import nltk
>>> nltk.download('all',halt_on_error=False)
```

### Basic Tasks with `NLTK`

Tokenization refers to splitting up words from sentences or sentences from paragraphs. It can sound simple since a rudimentary solution would require a simple `sentence.split(" ")` method, however, this can become complicated when there is punctuation involved. Hence it is always better to use library functions whenever possible.

```python
from nltk.tokenize import word_tokenize # Way of importing the word_tokenizer
# sent_tokenize - used for tokenizing into sentences
# word_tokenize - used for tokenizing sentences into words

# query is an input sentence
word_list = word_tokenize(query.lower())

from nltk.tokenize import PunktSentenceTokenizer # Another type of sentence tokenizer. This tokenizer is capable of unsupervised machine learning, so you can actually train it on any body of text that you use.
```

Many of NLP tasks requires removal of `stop_words` which are the most common words that hardly contains any information, like `the`, `a`, `this`, `is`, etc.

```python
from nltk.corpus import stopwords # for importing stop words
stop_words = set(stopwords.words('english')) # for assigning english stop words to variable

# Remove stop_words from word_list, where word_list is a list of all words that you want to check
filtered_words = [word for word in word_list if word not in stopwords.words('English')]

# Print filtered words
print filtered_words
```

Stemming means converting words to their base forms. Just for example `driving`, `drives`, `drove`, etc. can be stemmed to `driv`.

```python
from nltk.stem import PorterStemmer # for stemming
ps = PorterStemmer()
ps.stem([list])

# Assuming you have a list of words, named filtered_words, you can create their stemmed version using this
stem_words = [ ps.stem(word) for word in filtered_words]
```
_____________________________________________________________________________

### POS Tagging

To assign each word a particular part-of-speech, POS tagging is used. Here are some common POS tags.

POS tag list:

- CC    coordinating conjunction
- CD    cardinal digit
- DT    determiner
- EX    existential there (like: "there is" ... think of it like "there exists")
- IN    preposition/subordinating conjunction
- JJ    adjective    'big'
- JJR    adjective, comparative    'bigger'
- JJS    adjective, superlative    'biggest'
- NN    noun, singular 'desk'
- NNS    noun plural    'desks'
- RB    adverb    very, silently,
- RBR    adverb, comparative    better
- VB    verb, base form    take
- VBD    verb, past tense    took
- VBN    verb, past participle    taken
- VBP    verb, sing. present, non-3d    take
- VBZ    verb, 3rd person sing. present    takes
- WDT    wh-determiner    which
- WP    wh-pronoun    who, what
_____________________________________________________________________

Here is an example code that trains a custom tokenizer and applies pos tagging.

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

### Chunking and Chinking with NLTK
- Meaning separating the noun phrase 
- Now that we know the parts of speech, we can do what is called chunking, and group words into hopefully meaningful chunks. One of the main goals of chunking is to group into what are known as "noun phrases." 
- The idea is to group nouns with the words that are in relation to them.

The regex guide:

- \+ = match 1 or more
- ? = match 0 or 1 repetitions.
- \* = match 0 or MORE repetitions      
- . = Any character except a new line

- You may find that, after a lot of chunking, you have some words in your chunk you still do not want, but you have no idea how to get rid of them by chunking. You may find that chinking is your solution.
- Chinking is a lot like chunking, it is basically a way for you to remove a chunk from a chunk. The chunk that you remove from your chunk is your chink.

_____________________________________________________________________________________

### Lemmatization

- A very similar operation to stemming is called lemmatizing. The major difference between these is, as you saw earlier, stemming can often create non-existent words, whereas lemmas are actual words.
- So, your root stem, meaning the word you end up with, is not something you can just look up in a dictionary, but you can look up a lemma.
- Sometimes you will wind up with a very similar word, but sometimes, you will wind up with a completely different word. 

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
___________________________________________________________________

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

__________________________________________________________________________________

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
- There are built-in classifiers in NLTK like naive bayes classifier ( and others also, eg. sklearn module) and the function to train and test against it.

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

________________________________________________________________________

### Scikit-Learn

- The people behind NLTK foresaw the value of incorporating the sklearn module into the NLTK classifier methodology. As such, they created the SklearnClassifier API of sorts. To use that, you just need to import it like:
  ` from nltk.classify.scikitlearn import SklearnClassifier`
 - There are loads of classifiers in sklearn, just check that out.
- Also, we can use Stanford NER and POS tagging modules. Check out tutorials for more.
- *Refer tutorials for various other classifiers and how a combination of such classifiers can be used*


#### Sources

1. <a href="https://pythonprogramming.net/tokenizing-words-sentences-nltk-tutorial/" target="_blank">Python Programming tutorials</a>

