---
layout: post
title: Setting up python environment
excerpt: "Short guide on python package installation"
categories: articles
tags: [python]
author: riken_shah
comments: true
share: true
modified: 2017-1-30T14:18:57-04:00
published: true
---

Exploring fields like Machine Learning, Data Science or Natural Language Processing becomes quite easy with use of `Python`, `Matlab` (`Octave`) and `R`.
When we consider python, the most common problem encountered when dealing with various packages is that, due to continous development, particular version of a pckage becomes outdated pretty quickly and then you have to deal with updating them, which might break some existing functionality in your projects, and so on. 

To avoid such problems, there is something known as `Virtual Environment` which creates isolated boxes of python environment in which you can have python packages as per your needs. 

Following are the steps that you need to follow to set up a `virtualenv` in Ubuntu, with Python 2.7 

- Install python package manager `pip` using `sudo apt install python-pip` (For `python3` it will be a different command)

- Install Virtual Environment using `sudo pip install virtualenv`. Note whenever you install some python package with elevated priviledges (`sudo`) it will be installed globally.

- Go to a directory where you store your codes `cd /your/code/directory`.

- Make a new `virtualenv` using `virtualenv <name_of_virtualenv>`. Lets call it `venv` then, `virtualenv venv`, this will create a new virtualenv named `venv` in which you can install python packages as per your project requirements. Thus it ois recommended that you have separate virtualenv for ech of your projects.

- Activate the `virtualenv` using `source venv/bin/activate`, and later you can deactivate it using `deactivate`. Note that `source` command needs an exact path of your virtualenv, meaning, if you are in some different ditrectory, change the path in the commad appropriately. `deactivate` can be used from anywhere.

- Start installing your project specific packages using `pip install <package_name>`. Lets install `nltk`, using, `pip install nltk`.

- Also you can upgrade packages with `pip install --upgrade <package_name`.

- You should never push your `virtualenv` while collaborating with other users on `GitHub` or `BitBucket` (add <virtualenv_directory_name>, in our case `venv`, to `.gitignore` to tell git to ignore it), since it would result in lots of conflicts. Then how will your collaborators know of any package that you have installed ? 

- For that you must use `requirements.txt` file. Using which each collaborator can install packages in their own separate virtualenvs.

- Using `pip freeze` command you can get a list of packages that are installed in your system. If you run this command in a `virtualenv` (after activating virtualenv), this will give packages that are installed in a `virtualenv`.

- To make a `requirements.txt` file for a specific `virtualenv` use, `pip freeze > requirements.txt` after activating your virtaulenv.

- You can push `requirements.txt` file, and your collaborator can use `pip install -r requirements.txt`, after activating his/her virtualenv which will install all the packages that are listed in `requirements.txt`.

Comment below for hugs and bugs.

