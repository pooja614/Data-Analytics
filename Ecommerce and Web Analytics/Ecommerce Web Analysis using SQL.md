# Ecommerce & Website Analysis Using SQL
## Aim 

This project aims at analysing traffic sources and website performance of an ecommerce website. 
 
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

4. While we’re on Gsearch, could you dive into nonbrand, and pull monthly sessions and orders split by device type? 
I want to flex our analytical muscles a little and show the board we really know our traffic sources. 
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e4d231c2-ee19-427e-8343-c0e89cd55704)
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/76b21881-671a-44fe-bd64-030aa745c497)

5. I’m worried that one of our more pessimistic board members may be concerned about the large % of traffic from Gsearch. 
Can you pull monthly trends for Gsearch, alongside monthly trends for each of our other channels?
-- first, finding the various utm sources and referers to see the traffic we're getting
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/415e6780-1aec-40ec-b799-1bef67365fbb)
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/f6d0e8f0-c149-4e9f-9a47-8ddba8184567)

6. I’d like to tell the story of our website performance improvements over the course of the first 8 months. 
Could you pull session to order conversion rates, by month?
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/70caf7c7-825e-4a99-b010-8d285611e466)
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/defd18e3-ab79-4b5a-85f4-79e95369d07f)


8. For the gsearch lander test, please estimate the revenue that test earned us 
(Hint: Look at the increase in CVR from the test (Jun 19 – Jul 28), and use 
nonbrand sessions and revenue since then to calculate incremental value)
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/9ad3c614-4fea-4834-a510-30f95cd89a27)
   ![image](https://github.com/pooja614/Data-Analytics/assets/69869583/07f8fb74-131c-46de-9aa8-350d4b944e07)

-- next, we'll bring in the landing page to each session, like last time, but restricting to home or lander-1 this time 

-- then we make a table to bring in orders  

-- to find the difference between conversion rates 

-- finding the most reent pageview for gsearch nonbrand where the traffic was sent to /home 

8. For the landing page test you analyzed previously, it would be great to show a full conversion funnel 
from each of the two pages to orders. You can use the same time period you analyzed last time (Jun 19 – Jul 28).

-- funnel through customer lander , saw_homepage 

-- click rates  

9. I’d love for you to quantify the impact of our billing test, as well. Please analyze the lift generated 
from the test (Sep 10 – Nov 10), in terms of revenue per billing page session, and then pull the number 
of billing page sessions for the past month to understand monthly impact.



