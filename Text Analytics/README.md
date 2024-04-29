
# Medical Tweets Topic Modelling 


### View of Tweets Data
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/48e5cfca-159e-4fa4-8562-f89507b4b90c)

* We understand that the data contains tweets in different language.
* Thus percentage of other language must be explored.

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/04eada64-5328-4f94-a16c-19fceeae6cfd)

### Data Preprocessing

#### Examine the Language 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/472cbd7d-8d86-451d-a953-9b7099d450e7)

* Thus as 91% of the data is in English we will ignore other language tweets.
##### Assign the Language 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e1a9bec1-fdf3-4485-b91d-6914f374aba4)

#### Remove duplicates 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/b446e111-3c48-4f09-874c-ed0b9269e2d5)

#### Visualize the Data 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/de37700f-907d-4b2b-afcd-60369bec90a1)

* After visualizing few range of tweets, we observe that same tweets has slightly different url resulting in multiple tweets.
##### We observe that:
* Tweets are repeated,tweets contain emojis,links, hastags, organizations and hastags
* Thus data need to be preprocessed with careful insights.

##### Important preprocessing steps conducted

* This dataset contains unique url address which is processed.    
* Custom stop word is applied inorder to preserve certain stopwords like 'not'
* Hastags are preserved in seperate column.
* Contractions are expanded.
* Organization named NICE is changed to NIXX inorder to not to effect sentiment analysis if done further.

##### Preprocessed Data 
Before: 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e455b2b6-ffb1-41e9-bd96-e0f5b6e5f98a)

After: 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/95fd1614-41ae-4f9e-8e56-17ddf19acc9a) 

### Exploratory Data Analysis

#### Word Frequency 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/11c8e96e-130e-4720-ad46-ddf8f972d6c5)

#### Plotting Word Cloud 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/eeb101ce-1e4e-4d5a-8b23-909b9b079ec4)

#### Visualizing N-grams 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e921e9d8-6ffd-4572-b9ad-d60f87eea048)

