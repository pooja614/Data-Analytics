### Report 

1. Introduction
   1.1 Objective
2. Preprocessing
   2.1 Dataset
   2.2 Data Exploration and Preprocessing
3. Statistical Analysis
   3.1 Assumption of Regression

     3.11 Multicollinearity
     3.12 Variable transformation
     3.13 Linearity
   3.2 Handling Categorical Variables
     3.2.1 Analyzing categorical variables
     3.2.2 Onehot encoding
   
# Car Price Prediction 

## 1. Introduction
In today's automotive market, the ability to accurately predict car prices is invaluable for both consumers and industry professionals. Whether buying, selling, or simply evaluating market trends, having reliable price predictions can facilitate informed decision-making and optimize financial outcomes. <br> 
This regression project aimed at predicting car prices based on a range of relevant features.

### 1.1 Objective 
We aim to create a predictive model that can provide reliable estimates of car prices.

## 2. Preprocessing   
This step is crucial for ensuring data cleanliness and compatibility with machine learning algorithms. 
### 2.1 Dataset 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/df8d8bea-05b2-4f6b-9adc-f3f38a08ec4b) 
### 2.2 Data Exploration and Preprocessing 
Conducted basic exploratory data analysis to verify the required preprocessing steps have effectively prepared the dataset for further analysis.  
## 3. Statistical Analysis 
### 3.1 Assumption of Regression
"""
1. Choose the variables/regressors to focus on (here all may be, leave the correlated column)
2. (you can delete less than 5% values from a dataset if it has null values)
Assumption 1: Linearity (make data linear)
3.Check for linearity using scatter plot
Assumption 2: No endogenity (find correaltion of residuals with individual x) - not now
Assumption 3: Normality and homodescadasticity(assumed to hold after transformation)(Normality assumed for big sample)
Assumption 4: autocorrelation
Assumption 5: Multicollinearity: We have obsserved and removed
"""
Analyzing numeric data involves examining numerical variables to uncover patterns, trends, and relationships within the dataset.
##### 3.1.1 Multicollinearity 
Multicollinearity occurs when two or more independent variables in a regression model are highly correlated, leading to instability and unreliable estimates of the coefficients. 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e99a11f8-ce34-43a8-ab9f-c929db6d68c4)

* There is correlation between highwaympg, citympg(0.97)
* There is correlation between wheelbase, carlength(0.87)
* There are features not correlated with price
* <b>Remove wheelbase and remove city mpg as one of the correlated feature is sufficient to give information to the model.</b>
  


