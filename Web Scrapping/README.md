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

