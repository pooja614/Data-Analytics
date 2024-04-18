# Web Scrapping and Data Cleaning with Python 

# Web Scrapping
This section focuses on scrapping magicbrick.com a property website. 

1. Introduction
   1.1 Aim
2. Methodology
   2.1 Approach
   2.2 Experimentation 

## Introduction 
Web scraping is the process of extracting data from websites by directly access the World Wide Web using the Hypertext Transfer Protocol or a web browser. 
It is a form of copying in which specific data is gathered and copied from the web, typically into a central local database or spreadsheet, for later retrieval or analysis.

### Aim 
Scrape the required data from the website and conduct data cleaning tasks. 

## Methodology
Our goal is to assemble data from the site into one concise CSV, housing all the required information. 

### Approach 
1. Identify the page(s) with the information we want and review the source code.
2. Outline a path for navigating the pages.
3. Indentify relevant tags 
4. Pass the content of each page to Beautiful Soup to parse.
5. Extract data in a systemic way and store as dataframe
6. Save to csv file

#### Indentify the Pages 
We have applied the following filters on the website. 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/fc6e0657-1771-4053-8bc8-41d82f1fe0d6)

https://www.magicbricks.com/low-budget-flats-for-sale-in-bangalore-pppfs
