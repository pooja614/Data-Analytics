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


  
