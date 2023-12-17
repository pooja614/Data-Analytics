# Ecommerce & Website Analysis Using SQL 

## Objective 
Extract and analyze website traffic and performance data from the Maven Fuzzy Factory
database to quantify the company’s growth.  
 
## About the data 
- The mavenfuzzyfactory database is used for our analysis.
- The data has the following schema. 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/578d08dc-8dce-4cce-8f35-51f06d130110)

- Website session table contains alld etails about the sessions, its creation, utm source, campaign and content,device type used and http_referrer.
- <b>UTM Parameters</b>: As in Wikepedia, 
   - utm_source: Identifies which site sent the traffic, and is a required parameter.
   - utm_medium: what type of link was used, such as cost per click or email.
   - utm_campaign: It indicates a specific promotion or strategic promotion.
   - utm_content: Indentifies what specifically clicked brought user to the site, such as banner ad or text link, logo etc. It is used for A/B testing, content targeted ads etc.
- <b>website_pageviews</b>: Contains details of the website page viewed, viewed date, session id and page url. 
- <b>orders</b>: It contains order details like user, product, item ids, price and cogs.
- <b>products</b>: It contains details of products.
- <b>order_items</b>:It contains details about the item purchasedincluding type of product, orderid, price, etc.
- <b>order_item_refunds</b>: It contains details of the refund amount, the order item and order ids of the refunded product.
  
## Analysis 

1. Where the bulk of our website sessions are coming from April 12 2012? Breakdown by UTM source, campaign and referring domain.

   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/9a17afe8-a9cc-48b9-9ea2-b901b999664c)

   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/af741919-d2b2-4b3a-9695-f5974d5de02e)


2. Gsearch seems to be the biggest driver of our business. Pull monthly 
trends for gsearch sessions and orders so that we can showcase the growth there?

   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/5e39697e-9c56-430a-8924-eee8a30d70ce)
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/3b462582-897c-4c7a-84c4-5760c08765d3)


3. What is the monthly trend for Gsearch?. But this time splitting out nonbrand and brand campaigns separately. Is the brand picking up at all? If so, it is important to know.
   
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/d86f16d1-6ecb-4b7f-a725-fffc0e95c944)
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/a12da68b-9dd8-4cc5-a275-b95f99037913)

4. On Gsearch, could you dive into nonbrand, and pull monthly sessions and orders split by device type to know the traffic sources.
   
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e4d231c2-ee19-427e-8343-c0e89cd55704)
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/76b21881-671a-44fe-bd64-030aa745c497)

5. One of our more pessimistic board members may be concerned about the large % of traffic from Gsearch. 
Can you pull monthly trends for Gsearch, alongside monthly trends for each of our other channels?

   - Find the various utm sources and referers to see the traffic sources
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/415e6780-1aec-40ec-b799-1bef67365fbb)
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/f6d0e8f0-c149-4e9f-9a47-8ddba8184567)
   - Count different traffic sources and orders
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/abc864b3-c6c3-401f-b0a7-9be47748c0c1)
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/10a2dbae-d9a8-4e71-b836-60df86c3fdce)

6. How is the website performance improvements over the course of the first 8 months?
Could you pull session to order conversion rates, by month?

   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/70caf7c7-825e-4a99-b010-8d285611e466)
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/defd18e3-ab79-4b5a-85f4-79e95369d07f)

7. The organisation ran a new custom landing page (/lander-1) in a 50/50 test against the homepage (/home) for gsearch nonbrand traffic.  Estimate the revenue for 'lander 1' and 'home'. Make sure to just look at the time period where /lander-1 was getting traffic.
For the gsearch lander test, please estimate the revenue that test earned us.(Hint: Look at the increase in CVR from the test (Jun 19 – Jul 28)

   Identify first test page visit
     
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/9ad3c614-4fea-4834-a510-30f95cd89a27)
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/07f8fb74-131c-46de-9aa8-350d4b944e07)

   Find the first pageview id
   
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/90424c9e-bc9c-48e8-b624-86a5ce9ed2ce)
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/c5fc294a-798e-42e5-a569-ad2039b068fb)

   Identify the landing page to each session: Either home or lander-1
   
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/f7b57e80-c2ce-483c-95ed-3514f44697fe)
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/05ada6e8-4e8e-4b74-ac15-c1d05759f382)

   Create table to get orders
   
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/5d20f0d1-f68d-42fd-974c-9ac4f0563b83)
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/cd048e8d-b01e-4b2e-85ad-00dca07ad3d3)

   Find the difference between conversion rates
   
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/8e5e9c12-7b91-4245-9c44-dc857a413d7e)
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/181c52ee-1657-4252-aa0b-e8e04cd14b0a)

   Find the most recent pageview for gsearch nonbrand where the traffic was sent to /home
   
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e02ec7c3-ac97-4860-b5cd-b097dfcc4fbc)
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/989b217f-4445-4680-9d7b-7567285b19f4)

8. For the landing page test you analyzed previously, it would be great to show a full conversion funnel 
from each of the two pages to orders. You can use the same time period you analyzed last time (Jun 19 – Jul 28).

    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/4e019494-47dc-45f1-8c58-39f79a7e772a)
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/20d44855-edbb-45f6-be67-b0c5a545e901)

    Funnel through customer lander , saw_homepage
   
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/c1dd3e66-c275-436b-a212-4be53d51e5df)
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e8ffba35-24c3-40d3-84d9-eb80d7adc776)

    Click rates across the funnel 
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/245aab5b-ba95-4aaa-9cfc-109db5a66772)
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/1c28180c-ea11-424b-bac7-02cdda31ef4b)


9. I’d love for you to quantify the impact of our billing test, as well. Please analyze the lift generated 
from the test (Sep 10 – Nov 10), in terms of revenue per billing page session, and then pull the number 
of billing page sessions for the past month to understand monthly impact.

    Billing inner query
   
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/453dd51c-a2c1-4f3d-8ed1-ee338e4dec94)
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/5e67663b-3a13-4f7c-9579-3ac6fbe4019c)


    Number of billing page sessions past month
   
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/021aa63f-7186-4f0c-87d4-724620108ace)
    ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/817b62ad-6aa7-4539-b4f7-2802987454f4)




