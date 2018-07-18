
# Simple Linear Regression

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Salary_Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values

#Splitting the dataset into the training set and test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 1/3, random_state = 0)

#fitting Simple Linear Regression to the Training set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)

#Predicting the Test set results
y_pred = regressor.predict(X_test)

#Visualize the Training set results
  #Step 1: observation point (scatter plot) - Original training data points
  #Step 2: regression line (linear line) - predicted regression line which shows how the predicted line fits into original training set
  #Step 3: plot title
  #step 4: plot level in X and Y axis
#note: X_train = number of years experience , y_train = real salaries

plt.scatter(X_train, y_train, color = 'red')
plt.plot(X_train, regressor.predict(X_train), color ='blue')
plt.title('Salary vs Experience (Training set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()

#Visualize the Test set results
  #Step 1: observation point (scatter plot) - Original test set data points
  #Step 2: regression line (linear line) - predicted regression line which shows how the predicted line (training data sets preidcted line) fits into original test set
  #Step 3: plot title
  #step 4: plot level in X and Y axis
plt.scatter(X_test, y_test, color = 'red')
plt.plot(X_train, regressor.predict(X_train), color ='blue')
plt.title('Salary vs Experience (Test set)')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()
