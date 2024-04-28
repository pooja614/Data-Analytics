USE mavenfuzzyfactory; 



/* Trend Analysis */ 



/*  List the users who have orderd within 7 days of previous order. */

WITH frequent_buyers AS (

SELECT user_id, created_at, 
lead(created_at, 1) OVER (partition by user_id ORDER BY created_at) as next_order_date
FROM orders
) 
SELECT DISTINCT user_id from frequent_buyers
WHERE datediff(created_at, next_order_date) <=7 ;


/* Find monthly patterns of 2012 for session and order trends. */



SELECT website_session_id, created_at, 
HOUR(created_at) AS hr, 
WEEKDAY(created_at) AS wkday 
FROM website_sessions 
WHERE website_session_id BETWEEN 150000 AND 1555000;


SELECT  
YEAR(website_sessions.created_at) AS yr, 
MONTH(website_sessions.created_at) AS mo, 
COUNT(DISTINCT website_sessions.website_session_id) AS sessions, 
COUNT(DISTINCT orders.order_id) AS orders 
FROM website_sessions 
LEFT JOIN orders 
ON website_sessions.website_session_id = orders.website_session_id
WHERE website_sessions.created_at < '2013-01-01' 
GROUP BY 1,2;

/* Analyze average website session volume by hour of day and by day week*/ 


WITH t1 AS (
SELECT DATE(created_at) AS created_date, 
WEEKDAY(created_at) as wkday, 
HOUR(created_at) as hr, 
COUNT(DISTINCT website_session_id) AS website_sessions
FROM website_sessions 
WHERE created_at BETWEEN '2012-09-15' AND '2012-11-15' 
GROUP BY 1,2,3
) 
SELECT hr, 
round(avg(website_sessions), 2) as average_sessions, 
round(avg(CASE WHEN wkday = 0 THEN website_sessions ELSE 0 END), 2) AS mon, 
round(avg(CASE WHEN wkday = 1 THEN website_sessions ELSE 0 END), 2) AS tue, 
round(avg(CASE WHEN wkday = 2 THEN website_sessions ELSE 0 END), 2) AS wed, 
round(avg(CASE WHEN wkday = 3 THEN website_sessions ELSE 0 END), 2) AS thurs,
round(avg(CASE WHEN wkday = 4 THEN website_sessions ELSE 0 END), 2) AS fri,
round(avg(CASE WHEN wkday = 5 THEN website_sessions ELSE 0 END), 2) AS sat,
round(avg(CASE WHEN wkday = 6 THEN website_sessions ELSE 0 END), 2) AS sun 
FROM t1 
group by hr 
ORDER BY hr;

# Product Analysis 

/* Find the monthly trends till January 4 2013 for number of sales, 
total revenue, total margin generated for the business?  */ 

SELECT 
YEAR(created_at) as yr, 
MONTH(created_at) as mo, 
COUNT(DISTINCT order_id) AS number_of_sales, 
SUM(price_usd) AS total_revenue, 
SUM(price_usd - cogs_usd) AS total_margin

FROM orders
WHERE created_at < '2013-01-04' 
GROUP BY 1,2;

/* Analyzing Product Launch */

/* Product is launched on January 6th. Get the monthly order volume, 
overall conversion rates, revenue per session, breakdown of sales by product, since April 1, 2012 upto April 05 2013*/ 

SELECT YEAR(website_sessions.created_at) AS yr, 
MONTH(website_sessions.created_at) AS mo, 
COUNT(DISTINCT website_sessions.website_session_id) AS sessions, 
COUNT(DISTINCT orders.order_id) AS orders, 
COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) AS conv_rate, 
SUM(orders.price_usd)/COUNT(DISTINCT website_sessions.website_session_id) AS revenue_per_session, 
COUNT(DISTINCT CASE WHEN primary_product_id = 1 THEN order_id ELSE NULL END) as product_one_orders, 
COUNT(DISTINCT CASE WHEN primary_product_id = 2 THEN order_id ELSE NULL END) as product_two_orders 
FROM website_sessions 
LEFT JOIN orders 
ON website_sessions.website_session_id = orders.website_session_id
WHERE website_sessions.created_at < '2013-04-01' 
AND website_sessions.created_at > '2012-04-01' 
GROUP BY 1, 2; 


/* Product level website analysis */ 



Identigy users who viewed product page, and see the products they clicked next. 
from specified prdocut pages, look at view to order conversion rates. */ 
 
/* Product level conversion funnels 
Look at two products since January 6th and analyze the conversion funnels
from each product page to conversion. 

Produce a comparision between the two conversion funnels, 
for all website traffic*/  

/* Select pageviews for relevant sessions. 
Find right pageview_urls to build the funnels */
-- Get to know the different product pages and select product 1 and product 2 page urls.  

-- SELECT DISTINCT website_pageviews.pageview_url            (put before t2)
-- FROM product_page_seen_sessions 
-- LEFT JOIN website_pageviews
-- ON website_pageviews.website_session_id  = product_page_seen_sessions.website_session_id 
-- AND website_pageviews.website_pageview_id > product_page_seen_sessions.website_pageview_id;
show tables; 
SELECT DISTINCT pageview_url FROM website_pageviews;

SELECT * FROM website_pageviews; 


CREATE view Product_Funnel AS 
WITH product_page_seen_sessions AS (
SELECT website_pageview_id, website_session_id, 
pageview_url as product_page_seen
FROM website_pageviews 
WHERE created_at < '2013-04-10' 
AND created_at > '2013-01-06' 
AND pageview_url IN ('/the-original-mr-fuzzy', '/the-forever-love-bear') 
), 

t2 AS (
SELECT 
product_page_seen_sessions.website_session_id, 
product_page_seen_sessions.product_page_seen, 
CASE WHEN pageview_url = '/cart' THEN 1 ELSE 0 END AS cart_page, 
CASE WHEN pageview_url = '/shipping' THEN 1 ELSE 0 END AS shipping_page, 
CASE WHEN pageview_url = '/billing-2' THEN 1 ELSE 0 END AS billing_page,  
CASE WHEN pageview_url = '/thank-you-for-your-order' THEN 1 ELSE 0 END AS thankyou_page  
FROM product_page_seen_sessions
LEFT JOIN website_pageviews
ON website_pageviews.website_session_id  = product_page_seen_sessions.website_session_id 
AND website_pageviews.website_pageview_id > product_page_seen_sessions.website_pageview_id 
ORDER BY 
product_page_seen_sessions.website_session_id, 
website_pageviews.created_at 
) 
SELECT t2.website_session_id, 
CASE WHEN t2.product_page_seen = '/the-original-mr-fuzzy' THEN 'mrfuzzy' 
WHEN t2.product_page_seen = '/the-forever-love-bear' THEN 'lovebear' 
ELSE 'Something wrong' 
END AS product_seen, 
MAX(cart_page) AS made_it_to_cart, 
MAX(shipping_page) AS made_it_to_shipping, 
MAX(billing_page) AS made_it_to_billing, 
MAX(thankyou_page) AS made_it_to_thankyou 
FROM t2 
GROUP BY 1, 2;

SELECT * FROM Product_Funnel; 




SELECT product_seen, 
COUNT(DISTINCT website_session_id) AS sessions, 
COUNT(DISTINCT CASE WHEN made_it_to_cart = 1 THEN website_session_id ELSE NULL END) as to_cart, 
COUNT(DISTINCT CASE WHEN made_it_to_shipping = 1 THEN website_session_id ELSE NULL END) as to_shipping,
COUNT(DISTINCT CASE WHEN made_it_to_billing = 1 THEN website_session_id ELSE NULL END) as to_billing,
COUNT(DISTINCT CASE WHEN made_it_to_thankyou = 1 THEN website_session_id ELSE NULL END) as to_thankyou
FROM Product_Funnel 
GROUP BY product_seen; 

/* Click Rates */ 
SELECT product_seen,  
COUNT(DISTINCT CASE WHEN made_it_to_cart = 1 THEN website_session_id ELSE NULL END)/
   COUNT(DISTINCT website_session_id) as cart_click_rt, 

COUNT(DISTINCT CASE WHEN made_it_to_shipping = 1 THEN website_session_id ELSE NULL END)/
   COUNT(DISTINCT CASE WHEN made_it_to_cart = 1 THEN website_session_id ELSE NULL END)  as shipping_click_rt,

COUNT(DISTINCT CASE WHEN made_it_to_billing = 1 THEN website_session_id ELSE NULL END)/
   COUNT(DISTINCT CASE WHEN made_it_to_shipping = 1 THEN website_session_id ELSE NULL END) as billing_click_rt,

COUNT(DISTINCT CASE WHEN made_it_to_thankyou = 1 THEN website_session_id ELSE NULL END)/
   COUNT(DISTINCT CASE WHEN made_it_to_billing = 1 THEN website_session_id ELSE NULL END) as thankyou_click_rt
   
FROM Product_Funnel 
GROUP BY product_seen;
 
 
