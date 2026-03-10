import os
import json
# import mysql.connector
# from typing import TypedDict, Annotated, List, Dict, Any, Optional
from datetime import datetime
import warnings
warnings.filterwarnings('ignore')

# LangChain imports
from langchain_groq import ChatGroq
from langchain_core.prompts import ChatPromptTemplate
from langchain_core.messages import HumanMessage, AIMessage
from langchain_core.output_parsers import StrOutputParser


GROQ_API_KEY = ""
os.environ["GROQ_API_KEY"] = GROQ_API_KEY


llm = ChatGroq(
    model="openai/gpt-oss-20b",
    temperature=0.0,  # no variation & haullocination so, = 0
    max_tokens=2048,
    groq_api_key=GROQ_API_KEY
)

print(f"Configuration complete")

from langchain_core.messages import SystemMessage, HumanMessage

messages = [
    SystemMessage(content="""
       
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
       
                DATABASE SCHEMA:

                    website_sessions(
                        website_session_id BIGINT,
                        created_at DATETIME,
                        user_id BIGINT,
                        is_repeat_session TINYINT(1),
                        utm_source VARCHAR,
                        utm_campaign VARCHAR,
                        utm_content VARCHAR,
                        device_type VARCHAR,
                        http_referer TEXT
                    )

                    website_pageviews(
                        website_pageview_id BIGINT,
                        created_at DATETIME,
                        website_session_id BIGINT,
                        pageview_url TEXT
                    )

                    orders(
                        order_id BIGINT,
                        created_at DATETIME,
                        website_session_id BIGINT,
                        user_id BIGINT,
                        primary_product_id BIGINT,
                        items_purchased INT,
                        price_usd DECIMAL(10,2),
                        cogs_usd DECIMAL(10,2)
                    )

                    order_items(
                        order_item_id BIGINT,
                        created_at DATETIME,
                        order_id BIGINT,
                        product_id BIGINT,
                        is_primary_item TINYINT(1),
                        price_usd DECIMAL(10,2),
                        cogs_usd DECIMAL(10,2)
                    )

                    order_item_refunds(
                        order_item_refund_id BIGINT,
                        created_at DATETIME,
                        order_item_id BIGINT,
                        order_id BIGINT,
                        refund_amount_usd DECIMAL(10,2)
                    )

                    products(
                        product_id BIGINT,
                        created_at DATETIME,
                        product_name VARCHAR
                    )

                    FOREIGN KEY RELATIONSHIPS:

                    website_pageviews.website_session_id → website_sessions.website_session_id
                    orders.website_session_id → website_sessions.website_session_id
                    orders.primary_product_id → products.product_id
                    order_items.order_id → orders.order_id
                    order_items.product_id → products.product_id
                    order_item_refunds.order_item_id → order_items.order_item_id
                    order_item_refunds.order_id → orders.order_id
                     
                  """),
    HumanMessage(content="""

Question:
Get the monthly trend of sessions, order volume, conversion rate, and revenue per session for the period between '2012-04-01' and '2013-04-05


""")
]

response = llm.invoke(messages)
# Find the monthly trends till January 4 2013 for number of sales, total revenue, total margin generated for the business?
# Analyze average website session volume by hour of day and by day week for dates between 2012-09-15 AND 2012-11-15
# Find monthly patterns of 2012 for session and order trends.
print(response.content)