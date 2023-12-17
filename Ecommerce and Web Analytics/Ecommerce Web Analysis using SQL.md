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

1. Where the bulk of our website sessions are coming from April 12 2012. Breakdown by UTM source, campaign
and referring domain.
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/f737845a-b239-4cb3-838e-f8bee3a3ab17)

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/eb3dd831-e8f9-4f5a-a323-462f8675c1ed)

2. Gsearch seems to be the biggest driver of our business. Pull monthly 
trends for gsearch sessions and orders so that we can showcase the growth there.
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/8bd437b9-19b4-4bf7-aec7-10b9e6012ad7)

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/8ac2a58d-6b07-4ff0-907e-78a7fb592aa2)

3. 
