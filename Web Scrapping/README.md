
### Report
# Web Scrapping and Data Cleaning with Python  


Web scraping and data cleaning are essential processes in extracting and preparing data for analysis, modeling, and insights generation.

* <b>Data Availability:</b> Web scraping enables access to vast amounts of data from websites, forums, social media platforms, and other online sources. 
This wealth of information can be invaluable for various purposes, including market research, sentiment analysis, and competitive intelligence.
* <b>Automation and Efficiency:</b> Through automation, web scraping tools can systematically gather data from multiple sources, saving time and effort compared to manual data collection. 
* <b>Data Quality Challenges:</b> Despite its advantages, inconsistent formatting, missing values, duplication, and noisy data are common issues that require thorough data cleaning processes.
* <b>Data Cleaning Importance:</b> Data cleaning, also known as data preprocessing or data wrangling, is crucial for ensuring the accuracy, reliability, and usefulness of the extracted data.
It involves tasks such as handling missing values, standardizing formats, removing duplicates, and correcting errors.
* <b>Techniques and Tools:</b> Various techniques and tools are available for data cleaning. 
These tools offer functionalities for data manipulation, transformation, and validation to streamline the cleaning process.
* <b>Domain Knowledge:</b> Effective data cleaning often requires domain-specific knowledge to interpret the data correctly and make informed decisions about handling anomalies or outliers.
* <b>Continuous Improvement:</b> Data cleaning is not a one-time task but an iterative process that may involve multiple iterations of extraction, cleaning, and validation. 
* <b>Ethical Considerations:</b> Ethical considerations are paramount when scraping data from websites or online platforms. It's essential to respect the terms of service, privacy policies, and copyright regulations of the websites being scraped and to handle sensitive or personal information responsibly. 

This project focuses on scrapping magicbrick.com a property website for Bangalore property sales and data cleaning of the generated data.  
Sections: <br>
<b> I. Web Scrapping </b> <br>
<b> II. Data Cleaning </b>

<pre>
<b>I. Web Scrapping</b>
<b>1. Introduction to Webscrapping</b> 
   1.1 Aim 
<b>2. Technology Used</b>
<b>3. Methodology</b> 
   3.1 Approach
      3.1.1 Indentify the Pages
      3.1.2 Navigation Path 
      3.1.3 Relevant Tags 
      3.1.4 Pass Contents of Each Page and Parse
      3.1.5 Extract Data and Store in Dataframe 
<b>4. Webscrapping Result</b>  
   
<b>II. Data Cleaning</b> 
<b>1. Introduction to Data Cleaning</b> 
<b>2. Techniques Used</b> 
<b>3. Steps Performed </b>
   3.1 Understanding the data
   3.2 Removal of Unwanted Observations
   3.3 Fixing Structural Errors
      3.3.1 Add units to headers
      3.3.2 Removing text and symbols
      3.3.3 Removing Alphabets 
   3.4 Creating New Features
      3.4.1 Extract BHK information
      3.4.2 Extract type of flat and location 
      3.4.3 Extract floor number and total floors 
   3.5 Handling missing data
<b>4. Finalized Dataframe</b>
   </pre> 


## 1. Introduction to Webscrapping

Web scraping is the process of extracting data from websites by directly access the World Wide Web using the Hypertext Transfer Protocol or a web browser. 
It is a form of copying in which specific data is gathered and copied from the web, typically into a central local database or spreadsheet, for later retrieval or analysis.

### 1.1 Aim 
Scrapping Affordable Flats for Sale in Bangalore from magicbricks.com and conduct data cleaning tasks. 
## 2. Technology Used

1. <b>Python:</b> Python programming language is used for webscrapping task.
2. <b>Beautiful Soup:</b> Python package for parsing HTML and XML documents. It represents parsed data as tree which can be searched and iterated to extract data.
3. <b>Requests Module</b>: It allows to send HTTP requests using python. THe HTTP request returns a response object.
4. <b> Pandas:</b>It is an open source data analysis and manipulation tool. It has functions for analyzing, cleaning, exploring, and manipulating data. 
5. <b>Selenium:</b> Selenium is partially used for experimentation but later beautiful soup is used due to structure of this website. 

## 3. Methodology
Our goal is to assemble data from the site into one concise CSV, housing all the required information. 

### 3.1 Approach 
<pre>
1. Identify the page(s) with the information we want and review the source code.
2. Outline a path for navigating the pages.
3. Indentify relevant tags 
4. Pass the content of each page to Beautiful Soup to parse.
5. Extract data in a systemic way and store as dataframe
6. Save to csv file
</pre>
#### 3.1.1 Indentify the Pages:  
We have applied the following filters on the website. 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/fc6e0657-1771-4053-8bc8-41d82f1fe0d6)  


#### 3.1.2 Navigation Path 
   * The website appeears to have <b>infinite scrolling</b> pattern.
   * But upon trying to scrape it using selenium webdriver it is found to have different pages.
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/7d3c3297-3efb-4c0b-95d8-0cf2a4fd64a8)

   * Thus website is investigated for pages and following url is constructed.
     <pre> https://www.magicbricks.com/low-budget-flats-for-sale-in-bangalore-pppfs/page-1 </pre>
     ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/30957ff1-c46e-4e53-b90c-05de8464403c)

#### 3.1.3 Relevant Tags 
   * Information to be scrapped from the site:
   * We are collecting the following information:
   * Title, Society Name, Price, Price per sqft 
     ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/c3275cf4-4c70-45b3-826a-3317b0ef6585)
   * Different values in the card:
   * Carpet Area, Status, Floor, Transaction, Furnishing, Facing, Overlooking, Ownership, Bathroom, 
     Balcony

     ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/030446a9-e676-4857-926a-d131ebf2a60e)

     ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/90bb1749-e364-437d-a684-070c26ddbdb5)

</pre>

#### 3.1.4 Pass Contents of Each Page and Parse 
   * Set up the url and send request to the web page
   * Relevant tags are extracted by class value 
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/b6b453ad-a7f2-480b-9b84-ac6a8a44401f)
* Parsed Document

  ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/125fd56e-2ac4-4997-99f5-a413f8ec329e)

  


#### 3.1.5 Extract Data and Store in Dataframe 
*  The following steps are applied to get the data in required format.
   
   ##### Creating the DataFrame Header
   
   <pre>
   <b>Algorithm </b>
   Function Create_dataframe():
         url    <-- URL of the webpage
         result <-- send get request to the webpage and return status code
         doc    <-- Create object of Beautiful Soup and parse the html file
         info   <-- Get values inside div class 'mb-srp__card__info'  # Get relevant classes
         fields <-- [] # Initialize field
         for i <-- 0 to len of info:
            labels <-- Extract div class "mb-srp__card__summary--label" from info[i]
            fields <-- Append fields list with labels not in fields (No repeatition) 
         for i <-- 0 to length of fields:
            fields[i] <-- extract text from fields[i} 

         df_titles = list of ['title', 'Society_Name', 'Price', 'Price_Per_sqft'] + fields 
         df <-- create dataframe using df_titles
         return (df, fields)

            
   </pre>
            
   * Extract values by class name
  ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/c31e5e0b-eeaa-4c59-a0a7-c141a32d2f00)


   * Get the labels for dataframe header 
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/7d5c8dc8-e14e-4306-8c63-a6e6f9aeed8e)

   * Extracted fields
     ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/4e6e9fb6-8f5c-4364-8ea3-78f33aec888b)

     <br>
   * Dataframe Header:
   * Function Create_dataframe() gives the following dataframe. 
     ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/994a03db-ebe2-466a-a7ce-b8ad2ac2e475)


   
     
  ##### Append the Dataframe with Values
Below is the algorithm of the code to scrape, extract features and append to dataframe. 
<pre>
  <<b>for</b> i <-- 0 to 4:           # Loop 4 pages 
      page_number <-- i       # Assign i 
  df, fields <--  Call Create_dataframe() 
      correction <-- 30 * page_number   # Each page has 30 values, correction for dataframe index
      url    <-- URL of the webpage
      result <-- send get request to the webpage and return status code
      doc    <-- Create object of Beautiful Soup and parse the html file
      info   <-- Get values inside div class 'mb-srp__card__info'  # Get relevant classes
      price_info <--  Get values inside div class 'mb-srp__card__estimate'
      item_dictionary <-- {} # initialize
         # Different properties have different features. Thus initialize to NONE
         <b>for</b> i in fields:       # Assign fields as keys and assign NONE 
            item_dictionary[i] <-- None

         # Loop to extract relevant features
         <b>for</b> i <-- 0 to length of info:
            val_dict   <-- {} 
            title      <-- Extract text from info[i] by h2 class "mb-srp__card--title"
            society_name <-- Extract div class "mb-srp__card__society" from info[i]
            <b>if</b> society_name is not None:
               society_name <-- Extract text from society_name
            Price       <-- Extract text from info[i] by div class "mb-srp__card__price--amount" 
            Price_Per_sqft <-- Extract div class "mb-srp__card__society" from info[i] 
            <b>if Price_Per_sqft is not None:
               Price_Per_sqft <-- Extract text from Price_Per_sqft 

            # Add values to dictionary
            val_dict['title'] <-- title                  
            val_dict['Society_Name'] <-- society_name
            val_dict['Price'] <-- Price
            val_dict['Price_Per_sqft'] <-- Price_Per_sqft

            item_dict <-- item_dictionary             # Assign initiated dictionary

            # Extract labels and respective values 
            labels <-- Extract div class "mb-srp__card__summary--label" from info[i] 
            values <-- Extract div class "mb-srp__card__summary--value" from info[i]
             
            # Add values to relevant keys 
            <b>for</b> j <-- 0 to length of labels:
               item_dict[Extract text from labels[j]] <-- Extract text from values[j]
            
            final_dict = val_dict OR item_dict     # Combine both the dictionaries 

            df at location (i + correction) <-- final_dict 
            
   </pre> 

 ## Result
 * The dataframe generated: 
 ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/ddb0e458-c99d-493b-95c8-a1b5a521cdb5)

 * Overview:
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/6725e35b-648a-4905-b68a-608b764c0d0f)



# Data Cleaning  

<pre> 
<b>1. Introduction to Data Cleaning</b> 
<b>2. Techniques Used</b> 
<b>3. Steps Performed </b>
   3.1 Understanding the data
   3.2 Removal of Unwanted Observations
   3.3 Fixing Structural Errors
      3.3.1 Add units to headers
      3.3.2 Removing text and symbols
      3.3.3 Removing Alphabets 
   3.4 Creating New Features
      3.4.1 Extract BHK information
      3.4.2 Extract type of flat and location 
      3.4.3 Extract floor number and total floors 
   3.5 Handling missing data
<b>4. Finalized Dataframe</b>
   </pre>  
   
## 1. Introduction to Data Cleaning 
Data Cleaning is the process of pre processing the data by removing or modifying the data that is incorrect, incomplete, duplicated etc. The goal of data cleaning is to ensure that the data is accurate, consistent, and free of errors, as inconsistent data can negatively impact the performance. 
## 2. Techniques Used
For this dataset, we have extensively used <b>regex</b> as textual data is preprocessed, new features are created and further converted to relevant data types. 
## 3. Steps Performed 
#### 3.1 Understanding the Data  
* The dataframe 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/80bd9787-01b7-498b-af79-8431f34dea5f)
* About the data
  ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/1e3fc7d5-a242-4910-8bbe-7d1658652c1b)
* 120 entries are present. 
* Most of the features are in object format.
* There are 15 features.
#### 3.2  Removal of Unwanted Observations
* Check for duplicates:
  ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/f2c62cf0-837d-4fe8-ac0e-867249b82b8e) 
* Remove duplicates
  <pre>df = df.drop_duplicates()</pre> 
  
#### 3.3 Fixing Structural Errors

##### 3.3.1 Add units to headers 
<pre>
   df = df.rename(columns = {
    'Price':'Price(Lac)',
    'Price_Per_sqft':'Price_Per_sqft(rs)', 
    'Carpet Area':'Carpet Area(sqft)',
    'Super Area':'Super Area(sqft)'
    }) 
</pre> 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/775d921d-f911-4732-8f29-89f621c54945)



##### 3.3.2 Removing Text and Symbols 
<pre>
   def remove_initial_text(text):
    txt = text[1:]         
    return txt 
</pre> 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/881ed9c7-c0f4-4cc2-80e3-fc369c6e8cc6)
* Rupee symbol is removed. 

##### 3.3.3 Removing Alphabets
  <pre>
     def remove_alphabets(text):
    """
        Used to remove units present in the values
    """
         return re.sub(r"[A-Za-z\t]", '', text) 
  </pre>               
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/1d71320f-39b9-4ed8-8b4b-8a4d4de882ae)

#### 3.4 Creating New Features
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/4dc1bf1a-58b4-4956-93bf-725fc2fb752e)

* Title column is used to generate new features : BHK, Type of Floor, Location.
* Floor column is used to generate floor related features.
##### 3.4.1 Extract BHK information
<pre>
   def extract_bhk(text):
       txt = re.findall(r'[0-9] BHK',text)
       if(len(txt)) > 0:
           return txt[0]
       else:
           return None 
df['BHK'] = df['title'].apply(lambda x: extract_bhk(str(x)))
</pre>
 ##### 3.4.2 Extract type of flat and location  
 <pre>
   def extract_type_loc(text):
       bhk_removed = re.sub(r'[[^[0-9] BHK ]*','', text)
       type_, location = re.split(' for Sale in ',bhk_removed)
       return type_, location 

   type_li = []
   location_li = []
   for i in type_loc:
       type_li.append(i[0])
       location_li.append(i[1])
       
df['Type'] = type_li 
df['Location'] = location_li
 </pre> 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/b7ac3611-dec8-4506-8bf5-f09f5b06dbc7)


 ##### 3.4.3 Extract floor number and total floors
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/8dbd5cde-e1db-4065-b77a-d1983cadb6de)
* We split the string at "out of" and create 2 features.
  <pre>
     c = df['Floor'].apply(lambda x: re.split(' out of ', str(x)))
  </pre>
  
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/8ad4fd71-4d8c-41fe-a3aa-26c173c43e79)
* We found that there are values which do not have floor values.
* Try and except is employed to handle exception.
<pre>
   def floor_split(text):
    floor_features = re.split(' out of ',text)
    return floor_features
    
floor_features = df['Floor'].apply(lambda x: floor_split(str(x))) 
      
available_floor, total_floors = [],[]
for i in floor_features:
    try:
        available_floor.append(i[0])
    except:
        available_floor.append(None)
    try:    
        total_floors.append(i[1])
    except:
        total_floors.append(None)
    
df['Floor_Available']  =   available_floor 
df['Total Floors in Building']  = total_floors  
</pre>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/814bece1-4f28-4226-a5ce-912bcea39201)

* Drop the unwanted columns (title, floor).
#### 3.5 Handling missing data and conversion
* There are empty string in the columns. It is difficult to change to int etc format with empty string.
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/4d4f680a-c9e5-4c62-a1e8-092cc447ed16)

* Extract empty string and impute it to 0.
<pre>
indx2 = df[df['Price_Per_sqft(rs)'] == ''].index 
for i in indx2:
    df.loc[i, 'Price_Per_sqft(rs)'] = 0
</pre> 
* Different columns are checked for empty strings and modified.
* The string data is finally converted to int/float data type wherever required.
<pre>
   def str_to_int(column):
    try:
        df[column] = df[column].astype(int)
    except:
        pass 
</pre> 
<pre>
df['Price(Lac)'] = df['Price(Lac)'].astype(float)
df['Price_Per_sqft(rs)'] = df['Price_Per_sqft(rs)'].astype(float)   
df['Bathroom'] = df['Bathroom'].astype(int)
df['Carpet Area(sqft)'] = df['Carpet Area(sqft)'].astype(float)  
</pre>

## 4. Finalized DataFrame 
* Thus we have a clean data with multiple features.
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/52ee4835-1515-4c72-a0e8-6eb65b522df6)

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/afd698b8-486b-408a-9e49-08cd85344b37)

## Conclusion

Thus webscrapping has been achieved on the magicbrick.com website and data cleaning is performed. Preprocessed dataset is acquired by this process. 
In conclusion, web scraping and data cleaning are indispensable components of the data lifecycle, enabling organizations and researchers to harness the power of online data while ensuring its integrity and reliability for informed decision-making and analysis.
