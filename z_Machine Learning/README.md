### Report 

1. Introduction
   1.1 Objective
2. Preprocessing
   2.1 Dataset
   2.2 Data Exploration and Preprocessing
3. Statistical Analysis
   3.1 Assumption of Regression

     3.1.1 Multicollinearity
     3.1.2 Normality
     3.1.3 Variable transformation
     3.1.4 Linearity
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
<Pre>
1. Choose the variables/regressors to focus on (here all may be, leave the correlated column)
2. (you can delete less than 5% values from a dataset if it has null values)
Assumption 1: Linearity (make data linear)
3.Check for linearity using scatter plot                               
Assumption 2: No endogenity (find correaltion of residuals with individual x) - not now
Assumption 3: Normality and homodescadasticity(assumed to hold after transformation)(Normality assumed for big sample)
Assumption 4: autocorrelation
Assumption 5: Multicollinearity: We have obsserved and removed
</Pre>
##### 3.1.1 Multicollinearity 
Multicollinearity occurs when two or more independent variables in a regression model are highly correlated, leading to instability and unreliable estimates of the coefficients. 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e99a11f8-ce34-43a8-ab9f-c929db6d68c4)

* There is correlation between highwaympg, citympg(0.97)
* There is correlation between wheelbase, carlength(0.87)
* There are features not correlated with price
* <b>Remove wheelbase and remove city mpg as one of the correlated feature is sufficient to give information to the model.</b>
  
##### 3.1.2 Normality 
Normality refers to the characteristic of a dataset or distribution where the data points follow a bell-shaped curve or Gaussian distribution, exhibiting symmetry around a central value.
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/97138a49-3ab7-4587-b5da-b9bce115616e) 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/aedb41d5-037c-482d-a5e7-f30b1eebde5d)

Skewness: 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e5650922-c208-4b91-a883-e87a395f7e16)
* Lets consider -1 to +1 skewness as acceptable range
* Anything above -1 and +1 is transformed. Positively skewed data: engine size, compressionratio, horsepower.
* Variable transformation is applied to 3 variables. 
##### 3.1.3 Variable transformation  

* Variable transformation involves altering the scale or distribution of variables in a dataset to meet the assumptions of statistical tests or improve model performance.
* This process can include logarithmic, exponential, or power transformations to normalize skewed data or stabilize variance. 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/ff82f8dd-6af4-447d-91fa-07151b08670e) 

* Log transformation is applied.
##### 3.1.4 Linearity  
Linearity refers to the relationship between independent and dependent variables in a regression model, where the relationship can be represented by a straight line. Assessing linearity is crucial for ensuring the validity of regression analysis. 

Uncorrelated features w.r.to "price" are removed.
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/bbc38c01-09c3-4f0d-9464-72d7f5633cf2)  
<br>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/3db792dd-dbae-441f-93c2-e7b5b83242d6)

* Non correlated features are removed.

### 3.2 Handling Categorical Variables

