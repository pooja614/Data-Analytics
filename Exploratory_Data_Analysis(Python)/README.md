###  EDA Report
# Exploratory Data Analysis: Naukri Job Listing 2020 


### Aim
This project aims at exploring the job listing dataset extracted from professional job portal https://www.naukri.com/ Naukri.com is a recruitment platform that provides hiring-related services to corporates/recruiters, placement agencies and to job seekers in India and overseas. It offers multiple products like Resume Database Access, listings and Response Management Tools. <br>

###  About
Total Records Count : 29998  Domain Name : naukri.com  Date Range : 01st Feb 2019 - 30th May 2020<br>
Dataset created by house Web Scraping and Data Mining teams at PromptCloud and DataStock.<br>

This dataset contains information about various job listings by different companies, job posting dates, different job positions, categories/ domain of job postions etc. <br>

Its an excitement to explore different patterns of the jobs listing and professional patterns of job recruitement.

## Exploratory Analysis and Visualization

### Job Distribution Along States
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/5dc3c175-cb6a-4f91-9f69-d1f3e6d705f0) 

* Here we observe that 6061 jobs are posted in Maharashtra which is the highest.
* Madhya pradesh, Karnataka, West Bengal falls at the subsequent positions followed by the rest of the states.
* Sikkim Chattisgarh, Himachal Pradesh, Jharkhand areas have single job listings.
685 jobs have their states not mentioned.
### Top Salaries
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/cdb4c528-8287-4465-8cd4-5826c29081cc)
* `Inferred_salary_to` is used to choose the highest salary yielding jobs.
* There are 8 salaries in the range of 40lakhs to 90lakhs in the top 20 salary yieldding jobs.
* 40lakhs to 60lakhs has more representations, above which there are only 1 each jobs for the salary as high as 90lakhs

### Salary Vs Number of Job offerring Trends
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/d4c8ec24-0926-4db5-8543-063629fdb014)

* Grouping of data tuples based on salary results in grouping of jobs on the basis of salary.
* The number of jobs in different groups are stored in `grp_counts`. Salaries are plotted against Number of jobs.
* The graph is concentrated at the left, indicating that most jobs have salaries less than 10lakhs per annum.
* There is almost single representations for packages higher than 40lakhs.
### Job categories with more number of jobs

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/6d113d0c-a3fd-40ec-95e9-3dbd2689d01c) 
* The plot indicates the percentage plot of top 25 jobs available in different categories.
* Here we observe that `IT software Application programming` category has highest number of job offering.
* ITES and sales fall at subsequent positions.

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/173102cc-794b-49ef-9bff-50c1d620b2ae)
* The above graph represents the overall trends with respect to number of jobs in the category versus job category.
* `IT software Application programming` category has 26% of the job profiles followed by 15.6% and 13.5% by `ITES` and `sales` respectively.
* We also observe that the jobs has been grouped into category with single alphabets representing specific set of jobs like example: A represents Datascience
* `Q, L, H, R` category finds the least number of jobs.
### Salary Range of Top 20 Frequent Jobs 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/5241c74a-d2e1-4f04-a012-3bb2465df08c)
* Developer profiles have higher packages. 
* Managerial roles also attracts higher salaries. 
* Sales executive, Business development executive, Accounts executive, HR executive, marketing executive roles have similar salary spectrum.
* Java developer salaries fall under higher spectrum.
### Top 5 Job Offering Companies 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/542001e1-39f2-48e3-9390-d3b75c0f69e6)
* Above companies are the companies which have posted highest number of job profiles.
* `Adeeba E-Services Pvt. Ltd ` has posted `1941`job oportunities.
* `Capgemini Technology Services India Limited` has posted `955` job opportunities follwed by 3 others.

### Job Posting Language 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/af778f94-f60d-4bf4-b3e2-fd66841072c2)
* The above graph is the plot indicating usage of language in percentage for job listing.
* Only 0.3% US-English is used.

### Frequency of Posting 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/fcb7ef10-7a11-4e2e-b205-0684c4ac6d60)
* From above graph we observe that February month has highest calling for jobs and October has the lowest.
* We observe that certain job posts are available through out the year.
* We observe that there is increase from the starting of the year, decrease in job posting at the middle from August and finally again at the end it increases. 
* We have to keep note that data has post dates from February 2019 to May 2020.

### Job Posting frequency of Categories: Sales, IT, Fashion, Hotels 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/7c24b199-a0f0-4b0c-be56-87042f0c2906)

* Sales and IT has similar trends. 
* There is dip in posting during April, June and September for both sales and IT. 
* December, January, February appears to be peak time of job posting for sales and IT. 
* Fashion has declining trend after July. 
* Hotel job posting has increased trend from October. 

### Types of Jobs Available 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/a33be195-4dd9-470b-a4aa-ec557b8737b8)
* 99% of jobs are Full Time, Permanent where as 0.037% is Part Time, permanent.

## Asking and Answering Questions 

### Q1: What percentage of companies have not disclosed their salary?
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/2178885d-ceb7-4c69-8b76-37115eba352e)
### Q2: What are the job positions that have highest pay scales? 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/833131ba-4a6f-4e0c-baed-edddcbf086a8)

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/a265b631-c6c4-4baf-b0e1-0efcc4315aa7)
* Above are the job postions which has highest salary offering.
* We find that the highest salary is an International package.
* We find that positions are demanding high level experiences and manegerial and leading roles.

### Q3: What are the different job and number of postings by Capgemini? 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/4e05ea66-d30a-4c16-abd2-f40405c27dd7)

### Q4: What is the percentage distribution of different categories in Capgemini? 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/913a5033-28e1-4498-ba5d-4c95454692eb)
### Q5: What is the percentage distribution of jobs in different cities? 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/87723516-cf43-4022-a7ef-c228732855f2) 
* Percentage of jobs available in different locations is analyzed.
* Lowest percentage areas(lesser than 1%) are aggregated and represented in the piechart as All the Rest.
* Hyderbad, Banglore and Pune has the highest job postings with 13.96%, 13.41%, 12.89% respectively.
* Navi Mumbai has 0.6%. All the other cities with minimal representations ie All the Rest is 5%.
### Q6: Which jobs are hot trends in part time and freelancing section? 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/681416e2-0461-4e54-89e1-0b5968ce67d9)
* <u>Part time and permanent</u> job section is dominated by `teaching` and `sales` jobs followed by  `HR `and `IT-Software Application Programming jobs.` `MEdical jobs` are also preferred.  
* <u>Full Time, Freelance/Homebased</u> job section  is dominated by `Information Technology (ITES)` jobs, with `sales`, `acoounts` and `journalism` in subsequent positions.
* <u>Part Time, Freelance/Homebased Part Time, Temporary/Contractual</u> has `ITES`, `sales`, `accounts` and `journalism` as a major playground.
* <u>Part Time, Temporary/Contractual</u> has `IT-Software Applicatioon Programming`, `Teaching`, `HR`, `Sales` and `Medical` jobs in demand.
* We also observe that based on nature of the jobs the preference of part time/ freelance etc categorization has been observed.
### Q7: What is the average salary (in million trends) of different category of jobs considering the lower limit of salary range? 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/95904a58-47a1-404d-a774-d25833ba56b3)

* The graph is the plot of average salary of different category.
* The T category which majorly consists of directorial and manegerial roles has the highest average salary.
* IT Software-ERP Medical, S(Dect cadates and security officers), self employed, strategy are other areas with better average salary.

### Q8: What is the average salary in different cities for top 5 job titles? 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/ecc4cfb3-efd6-4250-9bdf-7c76cba6f17d)
* Java Developer roles has highest average salary in Bangaluru follwed by Pune. 
* Sales executive has balanced distribution with Bhavnagar, Chennai, Mumbai and subarbs having similar mean. 
* PHP Developer roles has highest in Delhi NCR. 
## Analyzing Job Description 
### Word Cloud 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/d4dc2674-c0d3-4d44-9e7e-208d9e9cbda9)
* Word cloud gives insights regarding frequent expectation of recruiters and skillsets they are expecting amongst candidates.
### General Idea and Difference in Job Description of: Business Development Executive, Sales Executive and Business Development Manager 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/27bcd706-99eb-4c19-b5e9-f73e4bd58edf)
