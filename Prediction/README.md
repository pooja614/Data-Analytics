### Report  
# Car Price Prediction 
<pre>
<b>1. Introduction</b>
   1.1 Objective
<b>2. Preprocessing </b>
   2.1 Dataset
   2.2 Data Exploration and Preprocessing
<b>3. Statistical Analysis</b>
  <b> 3.1 Assumption of Regression</b>
     3.1.1 Multicollinearity
     3.1.2 Normality
     3.1.3 Variable transformation
     3.1.4 Linearity
   <b>3.2 Handling Categorical Variables</b>
     3.2.1 Analyzing categorical variables
     3.2.2 Encoding
<b>4. Modelling</b>
  <b> 4.1  Preperation for Modelling</b>
      4.1.1 Train-test-split
      4.1.2 Standardization 
   <b>4.2 Experimentation and Evaluation</b>
      4.2.1 Models for experiment
      4.2.2 Experimentation
  <b> 4.3 Feature Selection</b>
      4.3.1 F_regression
      4.3.2 Model after feature selection 
<b>5. Conclusion </b>
   
  </pre>  
  


## 1. Introduction
In today's automotive market, the ability to accurately predict car prices is invaluable for both consumers and industry professionals. Whether buying, selling, or simply evaluating market trends, having reliable price predictions can facilitate informed decision-making and optimize financial outcomes. <br> 
This regression project aimed at predicting car prices based on a range of relevant features.

### 1.1 Objective 
We aim to create a predictive model that can provide reliable estimates of car prices.

## 2. Preprocessing   
This step is crucial for ensuring data cleanliness and compatibility with machine learning algorithms. 
### 2.1 Dataset  
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/d6112964-8df8-449a-848b-20f13a66d393)


### 2.2 Data Exploration and Preprocessing 
Conducted basic exploratory data analysis to verify the required preprocessing steps have effectively prepared the dataset for further analysis.  
## 3. Statistical Analysis 
### 3.1 Assumption of Regression
<Pre>
1. Choose the variables/regressors to focus on (here all may be, leave the correlated column)
2. (you can delete less than 5% values from a dataset if it has null values)
Assumption 1: Linearity (make data linear)
3.Check for linearity using scatter plot                               
Assumption 2: No endogenity (find correlation of residuals with individual x) - not now
Assumption 3: Normality and homodescadasticity(assumed to hold after transformation)(Normality assumed for big sample)
Assumption 4: autocorrelation
Assumption 5: Multicollinearity: To be checked 
</Pre>
#### 3.1.1 Multicollinearity 
Multicollinearity occurs when two or more independent variables in a regression model are highly correlated, leading to instability and unreliable estimates of the coefficients. 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e99a11f8-ce34-43a8-ab9f-c929db6d68c4)

* There is correlation between highwaympg, citympg(0.97)
* There is correlation between wheelbase, carlength(0.87)
* There are features not correlated with price
* <b>Remove wheelbase and remove city mpg as one of the correlated feature is sufficient to give information to the model.</b>
  
#### 3.1.2 Normality 
Normality refers to the characteristic of a dataset or distribution where the data points follow a bell-shaped curve or Gaussian distribution, exhibiting symmetry around a central value. 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/3fd4b056-9c93-4c5f-b01b-70c684a2ee1e)

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/97138a49-3ab7-4587-b5da-b9bce115616e) 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/aedb41d5-037c-482d-a5e7-f30b1eebde5d)

Skewness: 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e5650922-c208-4b91-a883-e87a395f7e16)
* Lets consider -1 to +1 skewness as acceptable range
* Anything above -1 and +1 is transformed. Positively skewed data: engine size, compressionratio, horsepower.
* Variable transformation is applied to 3 variables. 
#### 3.1.3 Variable transformation  

* Variable transformation involves altering the scale or distribution of variables in a dataset to meet the assumptions of statistical tests or improve model performance.
* This process can include logarithmic, exponential, or power transformations to normalize skewed data or stabilize variance. 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/ff82f8dd-6af4-447d-91fa-07151b08670e) 

* Log transformation is applied.
#### 3.1.4 Linearity  
Linearity refers to the relationship between independent and dependent variables in a regression model, where the relationship can be represented by a straight line. Assessing linearity is crucial for ensuring the validity of regression analysis. 

Uncorrelated features w.r.to "price" are removed.
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/bbc38c01-09c3-4f0d-9464-72d7f5633cf2)  
<br>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/382aee6a-465b-481f-91ae-b05735632b30)


* Uncorrelated features are: 
<pre>['symboling', 'carheight', 'stroke', 'compressionratio', 'peakrpm'] </pre>

### 3.2 Handling Categorical Variables 
Handling categorical variables involves converting qualitative data into a format suitable for analysis, often through encoding techniques or transformation into numerical values. <br>
<b>Understand Categorical Variables:</b> 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/69e148ee-1dd2-44fd-8b63-37a77c235378)
<b>Remove Carname and ID: </b>
<pre>df = df.drop(['car_ID', 'CarName'], axis=1)</pre> 
<b>Get Unique Values: </b>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/ad1a2628-55d4-4bf6-aecb-6d28f1823a29)
<b>Change cylinder number to numeric:</b>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/ad99664e-838b-45d8-8b87-4e02d48eb31e)

#### 3.2.1 Analyse categorical variables

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/6e04ac7d-dca3-48cb-b647-d122cab59184)
* Doornumber is not significant for determining price
* 3 variables is label encoded: Enginelocation, aspiration,fueltype
* Remaining 4 is onehot encoded. 

##### Encoding 

<b>Label Encoding:</b> Label encoding is a technique used to convert categorical variables into numerical format by assigning a unique numerical label to each category. 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/a3d74c47-454e-474b-847e-012aa370a4e6)


<b>One-Hot Encoding:</b> One-hot encoding is a technique used to convert categorical variables into a binary format, creating new binary columns for each category present in the original variable and returns a sparse matrix.
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/b77954ec-15cb-4f3c-a43b-c1f108aaf1d2)

## 4. Modelling 

### 4.1  Preparation for Modelling

#### 4.1.1 Train-test-split 
* After the encoding we split the data into train set and test set. 
* We have applied 80-20 rule ie, 80% of data for training and 20% of data for test.  
#### 4.1.2 Standardization 
* Standard Scaler function performs Standard Normal Distribution (SND).
* Z=(x-u) / s where u is the mean of the training samples and s is the standard deviation of the training samples.

### 4.2 Experimentation and Evaluation
#### 4.2.1 Models for experiment 

<b>Linear Regression:</b> <br> 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/0c22483e-d66d-469c-859f-4c097725d467) 


* Linear regression is a fundamental statistical technique used to model the relationship between one or more independent variables (predictors) and a continuous dependent variable (response).
* It assumes a linear relationship between the predictors and the response variable, where the relationship is modeled using a straight line.
* The goal of linear regression is to find the "best-fit" line that minimizes the sum of the squared differences between the observed and predicted values of the response variable.
  
<b>Ridge Regression:</b> <Br>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/db501f66-7d0e-4372-8736-818d923a7bf5)  


* Ridge regression is a regularization technique used to mitigate multicollinearity and overfitting in linear regression models.
* It adds a penalty term to the ordinary least squares (OLS) objective function, which penalizes large coefficients and encourages smaller coefficients.
* The penalty term is controlled by a regularization parameter (lambda or alpha), which determines the degree of shrinkage applied to the coefficients.

<b>Lasso Regression:</b>
* Similar to ridge regression, lasso regression adds a penalty term to the OLS objective function. However, lasso uses the L1 norm of the coefficients as the penalty term.
* Lasso regression has the property of performing variable selection by shrinking some coefficients to exactly zero, effectively removing irrelevant features from the model.
* Lasso regression is beneficial when dealing with datasets with a large number of features or when feature selection is desired, as it can automatically select the most important predictors while regularizing the model.

#### 4.2.2 Experimentation  
##### Create dictionary of Models
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/03c4fd0f-b1ee-46c5-836c-d6dadd6bdc7f)
##### Model selection
* Created function to train, test, evaluate the models and return the test results in the form of a dataframe.
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/99432469-0bcb-4006-b109-05a75df11246)


##### Result 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/67287043-60c7-493a-ab29-94706a27f823)

### 4.3 Feature Selection 

The choice of feature selection method depends on various factors such as the nature of the data, the specific problem at hand, and the goals of the analysis.
#### 4.3.1 F_regression:
* F_regression is primarily used in the context of linear regression models.
* It assesses the significance of individual features in explaining the variance of the target variable.
* F_regression computes the F-statistic and p-values for each feature, indicating the strength of the linear relationship between each feature and the target variable.
* This technique is suitable when the relationship between the features and the target variable is assumed to be linear, and the goal is to select the most relevant features for a linear regression model.
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/1b0f8468-e694-4e73-a2b3-dc41382b2e66)

* Important features:<br>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/a8b9e430-cf3a-4474-bd2e-b1f97fdab6d2)

#### 4.3.2 Model After feature selection 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/1ef157ec-7e89-40c6-b253-9556c83d1007) 
train and test data of selected features is used for modelling. 
##### Result
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/d7aaf93d-6191-427b-be31-19d65ff12756)
* Linear Regression and Lasso Regression has performed well
* More data will give better model.

## Conclusion 
* The car price prediction project leveraged various regression techniques and data preprocessing methods to develop a robust model for estimating car prices. Through extensive exploration, analysis, and feature engineering, we identified key variables influencing car prices.
* Additionally incorporating additional features or exploring advanced modeling techniques may further enhance the model's performance and expand its applicability in real-world scenarios
* The car price prediction model holds significant practical value for consumers, dealerships, and the automotive industry, empowering stakeholders with informed pricing strategies, market insights, and decision-making support.
##### References:
https://machinelearningmastery.com/feature-selection-for-regression-data/






