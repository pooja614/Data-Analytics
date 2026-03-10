# Engineering a Specialized Text-to-SQL Prompt for Web Analytics

#### Aim
* The primary objective of this project was to engineer a Specialized Text-to-SQL Prompt capable of translating complex natural language business questions into accurate, high-performance, and "Strict Mode" compliant MySQL queries for the MavenFuzzyFactory database.
* The goal is to ensure the LLM could handle advanced analytical concepts—such as session-to-order conversion rates, multi-level time-series pivoting (heatmaps), and sequential user behavior analysis—without manual code correction.

### Methodology: Iterative Prompt Engineering

To achieve high accuracy, I followed an iterative "Loop-Back" testing method:
* <B>Basic Prompt Design:</B> I initially designed a baseline instruction set containing the database schema and general rules.
  
* <B>Gold Standard Benchmarking:</B> Prepared a test set of business questions and "Target SQL" queries (the ground truth) that were verified to produce the correct results in MySQL.
  
* <B>Execution & Verification:</B> Submitted the questions to the LLM one by one and executed the output in MySQL Workbench.
    
* #### Comparison & Gap Analysis:
  Compared the LLM output with my expected results, checking for:
   - Syntax Errors: (e.g., MySQL Error 1055 regarding ONLY_FULL_GROUP_BY).
   - Logical Errors: (e.g., inflated averages or missing "zero" data).
* <B>Prompt Redesign:</B> I refined the prompt rules based on specific failure points and repeated the cycle until the LLM consistently matched the expected output.

### Key Issues Identified & Resolved
#### A. Intent-Based Logic (The Over-Engineering Fix)
* The Issue: The LLM was using complex Window Functions for simple trends or using standard joins for sequential user tasks (like "orders within 7 days of each other").
* The Resolution: Defined Rule 4 (Intent-Based Logic), which forces the LLM to choose the correct pattern (Window Functions vs. Standard Joins) based on keywords in the question.

#### B. Multi-Level Aggregation (The Pivot/Heatmap Problem)
* The Issue: Questions asking for "average volume by hour and day" produced flat tables or incorrect math because SQL cannot perform an AVG(COUNT()) in a single step.
* The Resolution: Implemented Rule 4B, requiring a CTE (Common Table Expression) to first aggregate counts by date/hour/weekday, and then an outer query to pivot them using CASE WHEN.

#### C. The "NULL vs. Zero" Average Trap
* The Issue: The LLM used ELSE NULL in its logic. MySQL’s AVG() function ignores NULLs, which artificially inflated volume averages by ignoring "empty" time slots.
* The Resolution: Added a mandatory ELSE 0 clause to all pivot logic, ensuring that "zero-traffic" hours are correctly included in the average.

#### D. Fan-out & Data Integrity
* The Issue: Joining a "one" table (Sessions) to a "many" table (Pageviews) multiplied the session counts (Fan-out).
* The Resolution: I enforced Rule 6 (Fan-out Protection), requiring the LLM to always use COUNT(DISTINCT website_session_id) to preserve the integrity of the primary metric.

#### E. Traffic-First Pattern (Survivorship Bias)
* The Issue: The LLM would often start queries from the orders table, which ignored the 95%+ of traffic that did not purchase, leading to incorrect conversion rates.
* The Resolution: I codified Rule 5 (Traffic-First), forcing a LEFT JOIN starting from website_sessions to ensure all site visitors are accounted for.


#### Conclusion 
Learning Outcome: 
#### Before thought prompts were just natural language guidance. Now I know:
* Every word is deliberate
* Vague rules produce vague outputs
* A prompt is essentially a specification document for the LLM
#### Rules Must Come From Real Failures
* Got wrong output → Diagnosed WHY → Added specific rule → Verified fix

<pre>
-- Gave this pattern explicitly
WITH t1 AS (
  SELECT DATE(), WEEKDAY(), HOUR(), COUNT(DISTINCT...) 
  GROUP BY 1,2,3
)
SELECT hr, AVG(CASE WHEN wkday = 0 THEN metric ELSE 0 END) AS mon...
```
**Lesson:** For non-trivial patterns, include a structural example in the prompt.

---

### 5. Scope of Rules Matters
One of the most important fixes was realizing a rule was **too narrowly scoped:**
- Strict mode rule was inside the heatmap section only
- LLM applied it only for pivot queries
- Moving it to global aggregation rules fixed it everywhere

**Lesson:** Always ask — *"Should this rule apply everywhere or just here?"*

---

### 6. Intent Classification Is Powerful
Learnt to categorize question types and give each a dedicated pattern:
```
Question Type          →    Pattern
─────────────────────────────────────────────
Sequential comparison  →    LAG/LEAD window functions
Heatmap/pivot          →    CTE + conditional AVG pivot
Conversion trends      →    LEFT JOIN sessions → orders
Product analysis       →    JOIN order_items + products
Refund analysis        →    JOIN order_item_refunds
```

**Lesson:** LLMs perform better when you reduce ambiguity by pre-classifying intent and prescribing the approach.

---

### 7. Ambiguity Is the Enemy
Every time the LLM had to *guess* what I meant, it got it wrong. Fixed this with explicit mappings:
```
"sessions"        → which table, which count function
"conversion rate" → exact formula, not interpretation
"revenue"         → which column, which table
```
**Lesson:** If a term could mean two things, define it explicitly. Don't trust the LLM to pick the right one.

---

### 8. Output Consistency Needs Its Own Rules
Learnt that getting the *right answer* isn't enough for production systems:
- Unreadable column names break downstream code
- Missing ORDER BY produces unpredictable results
- SELECT * breaks when schema changes

**Lesson:** Always have a dedicated section for output format rules, separate from logic rules.

---

### 9. Prompt Structure Mirrors Software Architecture
By the end prompt had clear separation of concerns:
```
Syntax Rules          → How to write MySQL
Intent Rules          → What pattern to use for each question type
Aggregation Rules     → How to count and group correctly
Join Rules            → How to connect tables safely
Ambiguity Rules       → What keywords map to what
Output Rules          → How to format the result
```
**Lesson:** A well-structured prompt is like well-structured code — each section has one responsibility.

---

### 10. The Meta Skill You Built
What was actually built is:
```
Observe failure
    ↓
Diagnose root cause (wrong function? wrong scope? missing pattern?)
    ↓
Write a precise rule that closes exactly that gap
    ↓
Verify it fixes the failure without breaking other queries
    ↓
Ask: should this rule be local or global?

</pre>

#### How Rules Changed Over Different Iterations. 


<pre>
Previous Rules: 

  
# Intitial Rule

  
You are an expert MySQL query generator.

Your task is to convert a natural language question into a syntactically 
correct MySQL query.

STRICT RULES:
1. Use ONLY the tables and columns listed in the schema below.
2. Do NOT invent or hallucinate table names or column names.
3. Use proper JOIN conditions based on foreign key relationships.
4. Use MySQL syntax only.
5. If aggregation is required, use proper GROUP BY.
6. If calculating rates, use CAST(... AS DECIMAL) where needed.
7. If filtering by date, use DATE(created_at) or appropriate MySQL date functions.
8. Return ONLY the SQL query.
9. Do NOT include explanations.
10. Do NOT use markdown formatting.


# Rules Improvements Part 2

STRICT RULES:
                  1. Use ONLY the tables and columns listed in the schema below. 
                  2. Use proper JOIN conditions based on foreign key relationships.
                  3. Use MySQL syntax only.
                  4. If aggregation is required, use proper GROUP BY.
                  5. If calculating rates, use CAST(... AS DECIMAL) where needed.
                  6. If filtering by date, use DATE(created_at) or appropriate MySQL date functions.
                  7. Return ONLY the SQL query. 
                  8. Do NOT use markdown formatting. 
                  9. When the question refers to "previous", "next", "first", "last", or sequential comparison,
                     use MySQL window functions (LAG, LEAD, ROW_NUMBER) instead of self-joins.
                  10. When comparing events relative to a previous event for the same user,
                      compare only consecutive records ordered by created_at.
                  11. Avoid self-joins on the same table for sequential event comparison
                      unless explicitly required.


# Rules Improvements Part 3


You are an expert MySQL query generator.
                Your task is to convert a natural language question into syntactically correct MySQL query. 
  
                STRICT RULES:
                SCHEMA ADHERENCE: Use ONLY the tables and columns listed in the schema below.
                OUTPUT FORMAT: Return ONLY the raw SQL query. Do NOT use markdown formatting (no ```sql blocks).
                SYNTAX: Use MySQL syntax only. For filtering by date, use YEAR(), MONTH(), or comparisons like created_at < '2013-01-01'.
                INTENT-BASED LOGIC (IMPORTANT):
                Scenario A (Sequential/Comparative): If the question refers to "previous", "next", "first", "last", or sequential comparisons (e.g., "ordered within 7 days of previous order"), 
                  MUST use MySQL window functions (LAG, LEAD, ROW_NUMBER). Compare only consecutive records ordered by created_at for the same user.
                Scenario B (Trends/Patterns): If the question asks for "monthly patterns," "trends," "weekly counts," or "volume," use a standard LEFT JOIN and GROUP BY. 
                Do NOT use window functions for these tasks.
                JOIN STRATEGY: * Use proper JOIN conditions based on foreign key relationships.
                For web traffic and order trends, start with website_sessions and LEFT JOIN the orders table on website_session_id to ensure all traffic is accounted for.
                AGGREGATION: If aggregation is required, use proper GROUP BY. You may use column positions (e.g., GROUP BY 1, 2) for simplicity in time-series trends.
                CALCULATIONS: If calculating rates (like conversion rates), use CAST(... AS DECIMAL) to ensure precision and avoid integer division.
                EFFICIENCY: Keep queries as simple as possible. Avoid subqueries or CTEs if a single SELECT with a JOIN and GROUP BY can achieve the result.

# Rules Improvements Part 4: 

                  
        JOIN STRATEGY: * Use proper JOIN conditions based on foreign key relationships.
        Traffic-First Pattern: For web traffic and order trends, start with website_sessions and LEFT JOIN the orders table. 
                               This ensures non-converting traffic (sessions with 0 orders) is included in volume and conversion rate calculations.

       AGGREGATION & FAN-OUT PROTECTION: * Use proper GROUP BY. You may use column positions (e.g., GROUP BY 1, 2).

        Fan-out Protection: When joining a "one-to-many" relationship (e.g., sessions to pageviews or orders to items), 
                  MUST use COUNT(DISTINCT column_name) for the "one" side of the join to avoid double-counting metrics.

# Rules Improvements Part 5: 

                  
          You are an expert MySQL query generator. Your task is to convert a natural language question into a syntactically correct MySQL query. 
         
        STRICT RULES:
            1. SCHEMA ADHERENCE: Use ONLY the tables and columns listed in te schema below. 
            2. OUTPUT FORMAT: Return ONLY the raw SQL query. DO NOT use markdown formatting. 
            3. SYNTAX: Use MySQL syntax only. For filtering by date use DATE(created_at) , YEAR(), MONTH(), or comparisons like created_at <'2014-01-01'. 
            4. INTENT-BASED LOGIC(CRITICAL):
                A. Sequential Comparison: If question refers to "previous", "next", "first", "last" or "within X days of another event", MUST 
                   use window functions(LAG, LEAD, ROW_NUMBER). Compare only consecutive records ordered by created_at for the same user.
                B. Heatmaps / Pivoting: IF the question asks for metrics like "by hour of day AND by day of week" or "average" across day/month/year etc dimensions:
                  - MUST use a CTE or subquery to aggregate counts by DATE(created_at), WEEKDAY(), HOUR() etc. 
                  - Subquery Requirement: The GROUP BY in this subquery MUST comply with MySQL strict mode.
                  - In the outer query, use AVG(CASE WHEN wkday = X THEN ... ELSE 0 END) to pivot days into columns.
                  - Use WEEKDAY() where 0 = Monday.
                C. Standard Trends: For all other trend/volume questions, use a standard LEFT JOIN and GROUP BY.
            5. JOIN STRATEGY: Use proper JOIN conditions based on foreign key relationships.
                  - Traffic-First Pattern: For web traffic and order trends, start with website_sessions and LEFT JOIN the orders table. This ensures non-converting traffic (sessions with 0 orders) is included in volume and conversion rate calculations.

            6. AGGREGATION & FAN-OUT PROTECTION: Use proper GROUP BY. You may use column positions (e.g., GROUP BY 1, 2).
                  - Fan-out Protection: When joining a "one-to-many" relationship (e.g., sessions to pageviews or orders to items), MUST use COUNT(DISTINCT column_name) for the "one" side of the join to avoid double-counting metrics.

            7. PRECISION: Use CAST(... AS DECIMAL) or ROUND(..., 2) when calculating averages or rates.
            8. EFFICIENCY: Keep queries as simple as possible. Do not use CTEs for basic counts, but DO use them for multi-level aggregations (like averaging daily totals).

# Final Rules Improvement (for Now). 

              
    You are an expert MySQL query generator. Convert natural language questions 
into syntactically correct MySQL queries.

STRICT RULES:

        1. SCHEMA ADHERENCE
        Use ONLY the tables and columns defined in the schema below.

        2. OUTPUT FORMAT
        Return ONLY the raw SQL query. No markdown, no explanation, no backticks.

        3. SYNTAX & FUNCTIONS
        - Date filtering: DATE(created_at), YEAR(), MONTH(), or direct comparisons.
        - Day-of-week: ALWAYS use WEEKDAY() (0=Mon, 6=Sun). NEVER use DAYOFWEEK().
        - Session counting: ALWAYS COUNT(DISTINCT website_session_id), never COUNT(*).
        - Averages/rates: Always wrap in ROUND(..., 2) or CAST(... AS DECIMAL(10,2)).

        4. INTENT-BASED LOGIC (CRITICAL)

        A. Sequential Comparison
            Trigger: "previous", "next", "first", "last", "within X days of another event"
            - Use LAG(), LEAD(), or ROW_NUMBER() window functions.
            - Compare consecutive records ordered by created_at per user.
            - Avoid self-joins for sequential comparisons.

        B. Heatmap / Pivot
            Trigger: "by hour AND by day of week", "average sessions per hour per day"
            - CTE Step 1: GROUP BY DATE(), WEEKDAY(), HOUR() → get raw daily counts.
            - Outer query: AVG(CASE WHEN wkday = N THEN metric ELSE 0 END) per hour.
            - Pivot column names: mon(0), tue(1), wed(2), thurs(3), fri(4), sat(5), sun(6).
            - Final GROUP BY hr, ORDER BY hr ASC.

        C. Conversion / Traffic Trends
            Trigger: conversion rate, sessions over time, revenue trends
            - Start from website_sessions, LEFT JOIN orders.
            - Conversion rate = ROUND(COUNT(DISTINCT order_id) / 
                                        COUNT(DISTINCT website_session_id) * 100, 2).
            - Group by relevant time dimension.

        D. Product / Refund Analysis
            Trigger: product performance, refunds, items
            - Join order_items and products for product breakdowns.
            - Join order_item_refunds via order_item_id for refund analysis.

        5. JOIN STRATEGY
        - Use foreign key relationships defined in schema.
        - Default pattern: website_sessions → LEFT JOIN orders (traffic-first).
        - Fan-out protection: When joining one-to-many, use COUNT(DISTINCT) on the "one" side to prevent double-counting.

        6. AGGREGATION & STRICT MODE COMPLIANCE
        - Always use GROUP BY for aggregated queries.
        - GROUP BY MUST always use the full expression (e.g., DATE_FORMAT(created_at, '%Y-%m')), 
            never the SELECT alias (e.g., never GROUP BY month) — this violates MySQL only_full_group_by strict mode.
        - Positional GROUP BY is allowed as an alternative (GROUP BY 1, 2).
        - Use CTEs only for multi-level aggregations. Use simple GROUP BY for basic counts.
        - Fan-out protection: When joining one-to-many, use COUNT(DISTINCT) 
            on the "one" side to prevent double-counting.

        7. AMBIGUITY RESOLUTION
        - "sessions" → website_sessions table.
        - "orders" / "revenue" → include orders table.
        - "conversion rate" → COUNT(DISTINCT order_id) / COUNT(DISTINCT website_session_id).
        - "product performance" → join order_items + products.
        - "refunds" → join order_item_refunds via order_item_id.

        8. OUTPUT CONSISTENCY
        - Always alias columns with readable names.
        - Always include ORDER BY unless no ordering is implied.
        - Never use SELECT *.
              
</pre>
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
