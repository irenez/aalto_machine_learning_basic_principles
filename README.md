aalto_machine_learning_basic_principles
=======================================

T-61.3050 Machine Learning Basic Principles
Autumn 2014

project repository for the above course 

(1 branch per assignment, whenever coding was needed)

The data is exchange rates of euro versus dollar
from 1999 to 2013, with some additional noise. The data set has 3766 data
items (rows) and 2 variables x and y (columns) in ASCII format; the rst
column is the time index (in decades since 1999) and the second column is
the euro-dollar exchange rate. There are 50 data items in the the training
set, and 3716 in the test set. Your task is to train a regressor (predicting
the exchange rate from the time index) using the training set only such
that the prediction error on the test set is as small as possible. Train
some polynomial regressors of dierent orders and choose the best one by
validation. You need to leave out part of the training set for validation.
