#Simple Linear Regression

#Our task is to predict salaries based on the information from independent variables

#Importing the dataset to read
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[, 2:3]

#spliting the dataset into the training set and test set
#install.packages('caTools')
library(caTools)
#to split data
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


#Fitting Simple linear regression to the training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)
#Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

#visualize the training set results
#install.packages('ggplot2')
library(ggplot2)
  #Step 1: observation point (scatter plot) - Original training data points
  #Step 2: regression line (linear line) - predicted regression line which shows how the predicted line fits into original training set
  #Step 3: plot title
  #step 4: plot level in X and Y axis
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
            colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

#visualize the test set results
#Step 1: observation point (scatter plot) - Original test set data points
#Step 2: regression line (linear line) - predicted regression line which shows how the predicted line fits into original test set
#Step 3: plot title
#step 4: plot level in X and Y axis
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test Set)') +
  xlab('Years of Experience') +
  ylab('Salary')