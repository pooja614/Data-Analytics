# Web Scrapping and Data Cleaning with Python 

# Web Scrapping
This section focuses on scrapping magicbrick.com a property website for Bangalore property sales. 

<pre>
<b>1. Introduction</b> 
   1.1 Aim 
<b>2. Technology Used</b>
<b>3. Methodology</b> 
   3.1 Approach
   3.2 Experimentation 
</pre> 

## 1. Introduction 

Web scraping is the process of extracting data from websites by directly access the World Wide Web using the Hypertext Transfer Protocol or a web browser. 
It is a form of copying in which specific data is gathered and copied from the web, typically into a central local database or spreadsheet, for later retrieval or analysis.

### 1.1 Aim 
Scrape the required data from the website and conduct data cleaning tasks. 
## 2. Technology Used

1. <b>Python:</b> Python programming language is used for webscrapping task.
2. <b>Beautiful Soup:</b> Python package for parsing HTML and XML documents. It represents parsed data as tree which can be searched and iterated to extract data.
3. <b>Requests Module</b>: It allows to send HTTP requests using python. THe HTTP request returns a response object.
4. <b> Pandas:</b>It is an open source data analysis and manipulation tool. It has functions for analyzing, cleaning, exploring, and manipulating data. 
5. <b>Selenium:</b> Selenium is partially used for experimentation but later beautiful soup is used due to structure of this website. 

## 3. Methodology
Our goal is to assemble data from the site into one concise CSV, housing all the required information. 

### 3.1 Approach 
<Pre>
1. Identify the page(s) with the information we want and review the source code.
2. Outline a path for navigating the pages.
3. Indentify relevant tags 
4. Pass the content of each page to Beautiful Soup to parse.
5. Extract data in a systemic way and store as dataframe
6. Save to csv file
</Pre>
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
     ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/994a03db-ebe2-466a-a7ce-b8ad2ac2e475)

   * <b>Combined Function:</b>
   
     
  ##### Append the Dataframe with Values
  Steps in the Code:
<pre>
  df, fields <-- Call Create_dataframe():
         url    <-- URL of the webpage
         result <-- send get request to the webpage and return status code
         doc    <-- Create object of Beautiful Soup and parse the html file
         info   <-- Get values inside div class 'mb-srp__card__info'  # Get relevant classes
         price_info <--  Get values inside div class 'mb-srp__card__estimate'
         item_dictionary <-- {} # initialize
         # Different properties have different features. Thus initialize to NONE
         For i in fields:       # Assign fields as keys and assign NONE 
            item_dictionary[i] <-- None

         # Loop to extract relevant features
         for i <-- 0 to length of info:
            val_dict   <-- {} 
            title      <-- Extract text from info[i] by h2 class "mb-srp__card--title"
            society_name <-- Extract div class "mb-srp__card__society" from info[i]
            if society_name is not None:
               society_name <-- Extract text from society_name
            Price       <-- Extract text from info[i] by div class "mb-srp__card__price--amount" 
            Price_Per_sqft <-- Extract div class "mb-srp__card__society" from info[i] 
            if Price_Per_sqft is not None:
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
            for j <-- 0 to length of labels:
               item_dict[Extract text from labels[j]] <-- Extract text from values[j]
            
            final_dict = val_dict OR item_dict     # Combine both the dictionaries 

            df at location (i + correction) <-- final_dict 
            
   </pre>
