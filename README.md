aalto_machine_learning_basic_principles
=======================================

Exercise 5.1

Download the SPECT heart data set from course web-page. The data
set concerns diagnosing of cardiac Single Proton Emission Computed To-
mography (SPECT) images and comes from the UCI Machine Learning
Repository. In the data set, the SPECT image of each patient has been summarized as 22
binary features (partial diagnoses) extracted from the image.
The task is to predict the class of a patient (the nal diagnosis, normal
or abnormal) in the test set based on the 22 image features. Note that
in the provided data matrices, the rst column of each row is the nal
diagnosis, the remaining 22 columns are the image features.


Exercise 5.2

Implement the gradient ascent algorithm to find parameters theta = (w;w0)
for the logistic discrimination binary classifier. Now use the \2-class Diabetes dataset 
(used in Exercise 4), nd the solution for w and w0, and compute training and
test classication errors.
