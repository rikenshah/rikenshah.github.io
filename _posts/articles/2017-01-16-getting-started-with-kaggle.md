---
layout: post
title: Getting Started with Kaggle
excerpt: "Improving your data science skill in Kaggle"
categories: articles
tags: [python, datascience, ml]
author: riken_shah
comments: true
share: true
modified: 2017-01-16T14:18:57-04:00
published: true
---

<a href="https://www.kaggle.com" target="_blank"> Kaggle </a> is a very good platform for improving your Data Science and Machine Learning skills.

### Some python tricks and tips for data science

Dataset is available <a href="https://www.kaggle.com/c/titanic/data?train.csv" target="_blank"> here </a>

```python
# Load a csv file as a dataframe using Pandas library.
titanic = pandas.read_csv("titanic_train.csv")

# Print the first 5 rows of the dataframe.
print(titanic.head(5))

# Get description of the dataframe
print(titanic.describe())

# To access a column
titanic["Age"]

# fillna() function fill the column with missing values
# median() is self-explanatory
titanic["Age"] = titanic["Age"].fillna(titanic["Age"].median())

# Find all the unique genders -- the column appears to contain only male and female.
print(titanic["Sex"].unique())

# Replace all the occurences of male with the number 0. The objective is to convert all non-numeric values to numeric values
titanic.loc[titanic["Sex"] == "male", "Sex"] = 0

```

### Linear Regression (Machine Learning Starts)

To oversimplify, linear Regression is a way of predicting future using past. The simplest form of linear regression is `y = mx + c` in which we try to predict y, using input variable x and parameters c and m.

#### Problem with linear regression
- Won't work when input variable (past data) and output variable that we are trying to predict (future data) are not linearly related.
- It can not give probabilities, instead just gives an output based on selected threshold.

ML Best Practice - Use 3-way folding on your dataset to achieve good results. 
Divide your dataset in three parts, train on first two and test on third, then train on 2nd and 3rd part and test on first, etc.

#### Sk-learn snippets

```python
# Import the linear regression class
from sklearn.linear_model import LinearRegression
# Sklearn also has a helper that makes it easy to do cross validation
from sklearn.cross_validation import KFold

# The columns we'll use to predict the target
predictors = ["Pclass", "Sex", "Age", "SibSp", "Parch", "Fare", "Embarked"]

# Initialize our algorithm class
alg = LinearRegression()
# Generate cross validation folds for the titanic dataset.  It return the row indices corresponding to train and test.
# We set random_state to ensure we get the same splits every time we run this.
kf = KFold(titanic.shape[0], n_folds=3, random_state=1)

predictions = []
for train, test in kf:
    # The predictors we're using the train the algorithm.  Note how we only take the rows in the train folds.
    train_predictors = (titanic[predictors].iloc[train,:])
    # The target we're using to train the algorithm.
    train_target = titanic["Survived"].iloc[train]
    # Training the algorithm using the predictors and target.
    alg.fit(train_predictors, train_target)
    # We can now make predictions on the test fold
    test_predictions = alg.predict(titanic[predictors].iloc[test,:])
    predictions.append(test_predictions)
    
# Now calculating accuracy

import numpy as np

# The predictions are in three separate numpy arrays.  Concatenate them into one.  
# We concatenate them on axis 0, as they only have one axis.
predictions = np.concatenate(predictions, axis=0)

# Map predictions to outcomes (only possible outcomes are 1 and 0)
predictions[predictions > .5] = 1
predictions[predictions <=.5] = 0

totalPredictions = predictions.size

# How many matches in actual and predicted values
totalMatch = np.sum(predictions == titanic["Survived"])

accuracy = totalMatch*1.0 / totalPredictions
```

### Logistic Regression

To get values between 0 and 1 we use this. 
```python
from sklearn import cross_validation

# Initialize our algorithm
alg = LogisticRegression(random_state=1)
# Compute the accuracy score for all the cross validation folds.  (much simpler than what we did before!)
scores = cross_validation.cross_val_score(alg, titanic[predictors], titanic["Survived"], cv=3)
# Take the mean of the scores (because we have one for each fold)
print(scores.mean())

titanic_test = pandas.read_csv("titanic_test.csv")

# Do some cleaning of data
titanic_test = pandas.read_csv("titanic_test.csv")

titanic_test["Age"] = titanic_test["Age"].fillna(titanic["Age"].median())

titanic_test.loc[titanic_test["Sex"] == "male", "Sex"] = 0
titanic_test.loc[titanic_test["Sex"] == "female", "Sex"] = 1

titanic_test["Embarked"] = titanic_test["Embarked"].fillna("S")
titanic_test.loc[titanic_test["Embarked"] == "S", "Embarked"] = 0
titanic_test.loc[titanic_test["Embarked"] == "C", "Embarked"] = 1
titanic_test.loc[titanic_test["Embarked"] == "Q", "Embarked"] = 2

titanic_test["Fare"] = titanic_test["Fare"].fillna(titanic_test["Fare"].median())


# Initialize the algorithm class
alg = LogisticRegression(random_state=1)

# Train the algorithm using all the training data
alg.fit(titanic[predictors], titanic["Survived"])

# Make predictions using the test set.
predictions = alg.predict(titanic_test[predictors])

# Create a new dataframe with only the columns Kaggle wants from the dataset.
submission = pandas.DataFrame({
        "PassengerId": titanic_test["PassengerId"],
        "Survived": predictions
    })
    
```



