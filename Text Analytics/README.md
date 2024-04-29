
# Medical Tweets Topic Modelling 

<pre>
1. Understanding the Data
    1.1	View of Tweets Data
2. Data Preprocessing
    2.1	Examine the Language
    2.2	Remove duplicates
    2.3	Visualize the Data
    2.4	Important text preprocessing conducted
3. Exploratory Data Analysis
    3.1	Word Frequency
    3.2	Plotting Word Cloud
    3.3	Visualizing N-grams
4. Topic Modelling
    4.1	Latent Dirichlet Allocation[LDA]
    4.2	Visualize LDA generated Topics
    4.3	Coherence Score and Preplexicity
    4.4	Modelling based on BERTopic
    4.5	Barchart of Sample Topics
    4.6	Intertopic Distance Map
    4.7	Heatmap
    4.8	Text based Topic tree
    4.9	Assign topics to respective tweets
    4.10 Dataframe of Topics
5. Finding tweets and author based on entities
    5.1	Select the required entities
    5.2	Extract tweets and author 
</pre>

### 1. Understanding the Data
#### 1.1 View of Tweets Data
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/48e5cfca-159e-4fa4-8562-f89507b4b90c)

* We understand that the data contains tweets in different language.
* Thus percentage of other language must be explored.

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/04eada64-5328-4f94-a16c-19fceeae6cfd)

### 2. Data Preprocessing

#### 2.1 Examine the Language 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/472cbd7d-8d86-451d-a953-9b7099d450e7)

* Thus as 91% of the data is in English we will ignore other language tweets.
##### Assign the Language 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e1a9bec1-fdf3-4485-b91d-6914f374aba4)

#### 2.2 Remove duplicates 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/b446e111-3c48-4f09-874c-ed0b9269e2d5)

#### 2.3 Visualize the Data 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/de37700f-907d-4b2b-afcd-60369bec90a1)

* After visualizing few range of tweets, we observe that same tweets has slightly different url resulting in multiple tweets.
##### We observe that:
* Tweets are repeated,tweets contain emojis,links, hastags, organizations and hastags
* Thus data need to be preprocessed with careful insights.

#### Important text preprocessing conducted

* This dataset contains unique url address which is processed.
  <pre>
    def remove_URL(text):
    """
        Remove URLs from a sample string
    """
        return re.sub(r"https://t.co/([A-Za-z0-9_]+)", '', text)

    df_e['tweet_text'] = df_e['tweet_text'].apply(lambda x:remove_URL(str(x)))
  </pre>
* Custom stop word is applied inorder to preserve certain stopwords like 'not'
* Hastags are preserved in seperate column.
  <pre>df_e['hashtag'] = df_e['tweet_text'].apply(lambda x:re.findall(r'#(\w+)',str(x)))</pre>
* Contractions are expanded.
* Organization named NICE is changed to NIXX inorder to not to effect sentiment analysis if done further.
  <pre>
  df_e['tweet_text'] = df_e['tweet_text'].apply(lambda x: re.sub('NICE', 'NXXX',str(x)))
  </pre>
  * Convert to lowercase
  * remove @ mentions
  * remove special urls and tags
  * remove url and tags
  * preserve hastags
  * remove hash but keep tags
  * remove non ascii characters
  * removing numbers
  * remove punctuation
  * remove single character
  * remove selected stopwords
  * remove multiple spaces

##### Preprocessed Data 
Before: 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e455b2b6-ffb1-41e9-bd96-e0f5b6e5f98a)

After: 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/95fd1614-41ae-4f9e-8e56-17ddf19acc9a) 

### 3. Exploratory Data Analysis

#### 3.1 Word Frequency 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/11c8e96e-130e-4720-ad46-ddf8f972d6c5)

#### 3.2 Plotting Word Cloud 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/eeb101ce-1e4e-4d5a-8b23-909b9b079ec4)

#### 3.3 Visualizing N-grams 
* 1gram and 2-grams
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e921e9d8-6ffd-4572-b9ad-d60f87eea048)
* 3 grams and 4grams
  ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/a0958806-9876-4e0e-8fd2-21eb3b7b0e91)

### 4. Topic Modelling 

#### 4.1 Latent Dirichlet Allocation[LDA] 
In natural language processing, Latent Dirichlet Allocation (LDA) is a generative statistical model that explains a set of observations through unobserved groups, and each group explains why some parts of the data are similar. The LDA is an example of a topic model. In this, observations (e.g., words) are collected into documents, and each word's presence is attributable to one of the document's topics. Each document will contain a small number of topics.                         
##### Topics generated after applying LDA
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/4b889e2f-e94a-4af1-adf0-e0504170ae0b)

#### 4.2 Visualize LDA generated Topics 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/acbc6464-1420-41f4-b22b-09409806b7c6)
The intent of salience is to help identify which words are the most informative words for identifying topics in all the documents. Higher saliency values indicate that a word is more useful for identifying a specific topic. 

#### 4.3 Coherence Score and Preplexicity  
* `Coherence` measures the semantic similarity between words within the same topic. It helps to ensure that the topics generated by the model are interpretable and meaningful.
* `Perplexity` measures how well the model predicts a sample. It quantifies how surprised the model is by new data it hasn't seen before.
* In LDA, perplexity is calculated based on how well the model predicts the held-out test set. A lower perplexity indicates better performance, as it suggests that the model is better at predicting unseen data.
* It's often a trade-off between coherence and perplexity, as optimizing one may negatively impact the other. Therefore, it's crucial to strike a balance between them when evaluating and tuning an LDA model.
  
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/c2bd0e5f-a6c2-4ab6-84a7-06d616abd7cf)

### 4.4 Modelling based on BERTopic 
* BERTopic is an extension of Latent Dirichlet Allocation (LDA) that utilizes BERT (Bidirectional Encoder Representations from Transformers) embeddings for topic modeling. BERT is a state-of-the-art language representation model developed by Google, known for its ability to capture contextual information effectively.
  
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/57380faa-010d-4d4d-ae24-e0d0554f848d) 

#### 4.5 Barchart of Sample Topics
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/37c5258e-5ce4-42cc-8252-b0733b7005c5)

#### 4.6 Intertopic Distance Map  

Here's how an Intertopic Distance Map works:

* <b>Topic Similarity Calculation:</b> The first step involves calculating the similarity or distance between pairs of topics. * Various metrics can be used for this purpose, such as cosine similarity or Jensen-Shannon divergence. These metrics measure how similar or dissimilar the distributions of words in two topics are.
* <b>Distance Matrix:</b> Based on the calculated similarities, a distance matrix is constructed. Each entry in this matrix represents the distance or dissimilarity between two topics.
* <b>Multidimensional Scaling (MDS):</b> Multidimensional Scaling is a technique used to visualize the high-dimensional data in a lower-dimensional space while preserving the pairwise distances as much as possible. In the case of an Intertopic Distance Map, MDS is applied to the distance matrix to project the topics onto a two-dimensional (2D) or three-dimensional (3D) space.
* <b>Visualization:</b> The topics are then plotted on a 2D or 3D scatter plot, where each point represents a topic. The proximity of points in the plot indicates the similarity between the corresponding topics. Topics that are close together are more similar, while topics that are far apart are more dissimilar.
  
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/f87f9e1f-003e-42d8-a1f0-f6834a7a2ee6)

#### 4.7 Heatmap 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/a75537cb-df8b-4146-a22e-967b14d4eecc)

#### 4.8 Text based Topic tree  

* Topic Tree interpretation:

* <b>Root Topic:</b> At the top of the tree is the root topic, which represents the overarching theme or domain of interest.
* <b>Branches:</b> Branches emanate from the root topic and represent major sub-themes or categories within the domain. Each branch may further branch out into more specific subtopics.
* <b>Nodes:</b> Nodes in the tree represent individual topics or subtopics. These nodes are connected to their parent nodes in a hierarchical manner, reflecting their relationships.
* <b>Leaves:</b> The terminal nodes of the tree, called leaves, represent the most specific topics or concepts within the hierarchy. These topics do not have any further subtopics branching out from them.
* <b>Hierarchy:</b> The hierarchy of the topic tree reflects the relationships between topics. Topics higher up in the tree are broader and encompass a wider range of concepts, while topics lower down are more specific and focused. 
  
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/05139f5c-f3b7-40d2-8fea-7d50165dab39)

#### 4.9 Assign topics to respective tweets

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/fda6e767-7f08-469b-a638-90de539c7855)

#### 4.10 Dataframe of Topics 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/ebd471fa-ac1f-4adc-a46c-78f8cf77bbbc)

### 5. Finding tweets and author based on entities 

#### 5.1 Select the required entities 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/d9eb717b-c250-462d-9d3a-a79e67fecf6f)


#### 5.2 Extract tweets and author 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/b8ff3159-b1f9-4f24-ae5f-f6d057643432)

* Thus based on the entities and authors tweets are extracted. 
* It can be useful based on the requirement of the problem in hand.
* It can also be used to learn the sentiment of the author tweets, with respect to the entities. 

##### References 
* https://www.kaggle.com/code/rtatman/analyzing-multilingual-data/notebook 
* https://www.kaggle.com/code/longtng/nlp-preprocessing-feature-extraction-methods-a-z
