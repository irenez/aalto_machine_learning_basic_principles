aalto_machine_learning_basic_principles
=======================================

Exercise 4

This data set contains two classes mention-
ing the person tested positive for diabetes or not, a famous classification
benchmark. Each row of the data set contains attributes measured from
a patient (all patients here are female at least 21 years old Pima Indian
heritage): the rst eight columns are (Number of times pregnant, Plasma
glucose concentration at 2 hours in an oral glucose tolerance test, Diastolic
blood pressures (mm Hg), Triceps skin fold thickness (mm), 2-Hour serum
insulin (mu U=ml), Body mass index (Weight in kg=(height in m)2), Di-
abetes pedigree function, Age (years)) and the ninth column is the class
label (1=tested positive for diabetes, 0=tested negative for diabetes). Use
the rst 100 rows as a training set and the rest as a validation set. The
point of this exercise is to classify the patients into the two dierent classes,
based on a single physical attribute only.

a) Assume the second feature (Plasma glucose concentration at 2 hours in
an oral glucose tolerance test) is normally distributed in both classes,
as in demonstration exercise 1. Using the Plasma glucose concentra-
tion as the only feature, nd the maximum likelihood estimate of the
parameters p1, 1, 2
1, p2, 2, 2
2.

b) Classify the points in the validation set, based on their Plasma glucose
concentration. What is your accuracy? (Hint: no need to compute
the Bayes' discriminant points, just check which class has higher
probability density at each validation point.)

c) Repeat parts a)-b) using a dierent feature this time, for example the
Diastolic blood pressure. What is your accuracy on the validation
set now?
