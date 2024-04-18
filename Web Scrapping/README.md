# Web Scrapping and Data Cleaning with Python 

# Web Scrapping
This section focuses on scrapping magicbrick.com a property website for Bangalore property sales. 

<pre>
<b>1. Introduction</b> 
   1.1 Aim 
<b>2. Methodology</b> 
   2.1 Approach
   2.2 Experimentation 
</pre> 

## 1. Introduction 
<Pre>
Web scraping is the process of extracting data from websites by directly access the World Wide Web using the Hypertext Transfer Protocol or a web browser. 
It is a form of copying in which specific data is gathered and copied from the web, typically into a central local database or spreadsheet, for later retrieval or analysis.
</Pre>
### 1.1 Aim 

Scrape the required data from the website and conduct data cleaning tasks. 

## 2. Methodology
Our goal is to assemble data from the site into one concise CSV, housing all the required information. 

### 2.1 Approach 
<Pre>
1. Identify the page(s) with the information we want and review the source code.
2. Outline a path for navigating the pages.
3. Indentify relevant tags 
4. Pass the content of each page to Beautiful Soup to parse.
5. Extract data in a systemic way and store as dataframe
6. Save to csv file
</Pre>
#### Indentify the Pages:  
We have applied the following filters on the website. 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/fc6e0657-1771-4053-8bc8-41d82f1fe0d6)  


#### Navigation Path 
* The website appeears to have <b>infinite scrolling</b> pattern.
* But upon trying to scrape it using selenium webdriver it is found to have different pages.
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/7d3c3297-3efb-4c0b-95d8-0cf2a4fd64a8)

* Thus website is investigated for pages and following url is constructed.
  <pre> https://www.magicbricks.com/low-budget-flats-for-sale-in-bangalore-pppfs/page-1 </pre>
  ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/30957ff1-c46e-4e53-b90c-05de8464403c)

#### Relevant Tags 
* Information to be scrapped from the site:
   * We are collecting the following information
     ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/c3275cf4-4c70-45b3-826a-3317b0ef6585)

  ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/030446a9-e676-4857-926a-d131ebf2a60e)

  ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/90bb1749-e364-437d-a684-070c26ddbdb5)

</pre>

