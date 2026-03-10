Project Report: Engineering a Specialized Text-to-SQL Prompt for Web Analytics
1. Aim
The primary objective of this project was to engineer a Specialized Text-to-SQL Prompt capable of translating complex natural language business questions into accurate, high-performance, and "Strict Mode" compliant MySQL queries for the MavenFuzzyFactory database.

The goal was to ensure the LLM could handle advanced analytical concepts—such as session-to-order conversion rates, multi-level time-series pivoting (heatmaps), and sequential user behavior analysis—without manual code correction.

2. Methodology: Iterative Prompt Engineering
To achieve high accuracy, I followed an iterative "Loop-Back" testing method:

Basic Prompt Design: I initially designed a baseline instruction set containing the database schema and general rules.

Gold Standard Benchmarking: I prepared a test set of business questions and "Target SQL" queries (the ground truth) that were verified to produce the correct results in MySQL.

Execution & Verification: I submitted the questions to the LLM one by one and executed the output in MySQL Workbench.

Comparison & Gap Analysis: I compared the LLM output with my expected results, checking for:

Syntax Errors: (e.g., MySQL Error 1055 regarding ONLY_FULL_GROUP_BY).

Logical Errors: (e.g., inflated averages or missing "zero" data).

Prompt Redesign: I refined the prompt rules based on specific failure points and repeated the cycle until the LLM consistently matched the expected output.

3. Key Issues Identified & Resolved
A. Intent-Based Logic (The Over-Engineering Fix)
The Issue: The LLM was using complex Window Functions for simple trends or using standard joins for sequential user tasks (like "orders within 7 days of each other").

The Resolution: We defined Rule 4 (Intent-Based Logic), which forces the LLM to choose the correct pattern (Window Functions vs. Standard Joins) based on keywords in the question.

B. Multi-Level Aggregation (The Pivot/Heatmap Problem)
The Issue: Questions asking for "average volume by hour and day" produced flat tables or incorrect math because SQL cannot perform an AVG(COUNT()) in a single step.

The Resolution: I implemented Rule 4B, requiring a CTE (Common Table Expression) to first aggregate counts by date/hour/weekday, and then an outer query to pivot them using CASE WHEN.

C. The "NULL vs. Zero" Average Trap
The Issue: The LLM used ELSE NULL in its logic. MySQL’s AVG() function ignores NULLs, which artificially inflated volume averages by ignoring "empty" time slots.

The Resolution: I added a mandatory ELSE 0 clause to all pivot logic, ensuring that "zero-traffic" hours are correctly included in the average.

D. Fan-out & Data Integrity
The Issue: Joining a "one" table (Sessions) to a "many" table (Pageviews) multiplied the session counts (Fan-out).

The Resolution: I enforced Rule 6 (Fan-out Protection), requiring the LLM to always use COUNT(DISTINCT website_session_id) to preserve the integrity of the primary metric.

E. Traffic-First Pattern (Survivorship Bias)
The Issue: The LLM would often start queries from the orders table, which ignored the 95%+ of traffic that did not purchase, leading to incorrect conversion rates.

The Resolution: I codified Rule 5 (Traffic-First), forcing a LEFT JOIN starting from website_sessions to ensure all site visitors are accounted for.










#### Project Slides
# Ecommerce Performance and Website Analysis 

1. Introduction
2. Objective
3. Database details
4. Trend Analysis
5. Product Analysis
6. Product Level Website Analysis 

#### 1. Introduction
* ECommerce has become the cornerstone of retail, revolutionizing how businesses connect with consumers and generate revenue. However, the mere existence of an online store is not enough to guarantee success in the competitive online marketplace. To thrive, businesses must continually assess and optimize their eCommerce performance and website functionality.
* Understanding the intricacies of eCommerce performance involves a comprehensive analysis of various metrics, including sales, conversion rates, traffic sources, customer engagement, and user experience.
* Website analysis is indispensable for identifying areas of friction within the online shopping journey. From website speed and responsiveness to navigation and checkout processes, every aspect of the user experience plays a pivotal role in shaping consumer behavior and influencing purchase decisions.

#### 2. Objective
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e0a29f3d-d126-42cc-a385-743e4d63d76b)
<pre></pre> 
#### 3. Database Details
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/aa122f67-feda-4691-8641-c002ac469796)
<pre></pre>

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e5b91cf7-8877-41ed-abf8-f11477fc2657)
<pre></pre> 
#### 4. Trend Analysis 
* Trend analysis reveals patterns and fluctuations in data over time, offering valuable insights for informed decision-making and strategic planning. 
<pre></pre>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/3ab05fec-34a4-4daa-bc76-6ddd5dcdecf5)
<pre></pre>

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/979e8c1b-d600-4460-8f13-f311240bed8a)
<pre></pre> 

#### 5. Product Analysis  
Product analysis involves examining various aspects of a product, such as its features, pricing, and market demand, to understand its performance. 
<pre></pre>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/0901311a-43ad-4a03-a178-a0b31492b9d4)
<pre></pre> 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/085799cd-64fd-4bd3-8301-3a211c4503fa)
<pre></pre>
#### 6. Product Level Website Analysis  
* Product-level website analysis focuses on evaluating the performance and usability of individual products within an eCommerce website, aiding in optimization efforts to enhance customer engagement and conversion rates.
<pre></pre>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/1b068be1-57cc-4e01-8430-3bf360178ae7)
<pre></pre> 

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/76b99279-f04b-42a2-9069-fea40dbfdbeb)
<pre></pre>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/36dc7743-e004-4df4-90e5-a9ddbf5befc6)
<pre></pre>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/4883f0f1-6e2a-4d08-9653-153cb976bdc1)
<pre></pre>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/ebbd0482-1153-4cb9-a0e0-8b3651cbdeee)
