# Vrinda Stores Sales Analysis 
Objective:<br>
Vrinda Store' wants to  understand their customers and purchase trends online for better growth of the business in the year 2023. <br><br>
The project focuses on understanding the customers of 'Vrinda Store' and the purchase trends for better growth of the business. <br>
The sales for year 2022 is analyzed. 
## Data Preprocessing  
![image](https://github.com/pooja614/PowerBI_Projects_/assets/69869583/269c5344-8fe4-4564-b480-105cf8332e2f)
<pre> 
Removing duplicate data, and useless columns. 
Relevant preprocessing is done. 
</pre>
## Data Modelling 
![image](https://github.com/pooja614/PowerBI_Projects_/assets/69869583/abd7a744-21fd-4472-a4c0-3c8bfb1c381a)

- Data is modelled to 'Star Schema'.
![image](https://github.com/pooja614/PowerBI_Projects_/assets/69869583/2ccc0de9-d318-48c4-97bf-d136cdc82faf)

## DAX Calculations 
DAX functions are used for efficient analysis. The following are few DAX codes coded for the project. 
<pre> 
Total Sales = SUM('Fact-VrindaStores'[Amount]) 
  
Overall Sales = 
CALCULATE(
    [Total Sales], 
    ALL('Fact-VrindaStores'[ship-city]), 
    ALL('Dim-Category'[Category]), 
    ALL(Dates), 
    ALL('Dim-Gender'[Gender]
))

% Sales = 
DIVIDE(
    [Total Sales],
    [Overall Sales],
    "0"
) 


% of Sales by Females = 
VAR fem_sales = 
    CALCULATE(
        [Total Sales],
        'Dim-Gender'[Gender] = "Women"
    )
VAR ratio = 
DIVIDE(
    fem_sales,
     [Total Sales],
     0
     )
return ratio 

Refunded % = 
VAR Refunded = 
CALCULATE(
    [Total Sales], 
    'Dim-DeliveryStatus'[Status] = "Refunded"
) 

VAR ratio = 
    DIVIDE(
        Refunded,
        [Total Sales],
        0
    )
return ratio  

% Share in their State = 
CALCULATE(
    [Total Sales], 
    'Fact-VrindaStores'[ship-city]
    ) 

Average Monthly Sales = 
AVERAGEX(
    Dates, 
    [Total Sales]
)

Last Month's Sales = 
CALCULATE(
    [Total Sales], 
    PARALLELPERIOD(
        Dates[Date], 
        -1, 
        MONTH
    )
) 

Sales MoM% Change = 
DIVIDE(
    ([Total Sales]-[Last Month's Sales]), 
    [Last Month's Sales], 
    BLANK()
) 


</pre>
- DAX measures is used for applying suitable filtering and generating aggregate values.


### Dashboard 


![Vrinda_Stores-2023_ggif](https://github.com/pooja614/Data-Analytics/assets/69869583/334d1aaa-4013-4eab-b5d0-f7cd41e882bc)



### Sales Insights

<pre></pre>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/2821ca3c-a16c-4d07-8409-0f726797379e)

<pre></pre>
### Sales Trends 

<pre></pre>
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/9e98f0f9-2eea-4727-9314-88bbde116912)

<pre></pre>
### What are the 'returned' insights in Madhya Pradesh?
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/fd72dc4c-4b61-42e3-80ee-0819bfc54331)

<pre></pre>

<pre></pre>
### How are sales of 'Sarees' and 'Top' in Amazon?  
##### Saree Sales
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/6b81a268-7543-436d-b407-db15b669c7c0)
##### Top Sales 
<pre></pre>

![image](https://github.com/pooja614/PowerBI_Projects_/assets/69869583/eef01025-ae29-4408-83c2-2b2bf8281494)
<pre></pre>


## Important Insights 
<pre>
- Amazon has highest sales for the store products followed by Myntra and Flipkart. 
- Middle Age adults are highest purchasers. 
- Women have highest rate of purchase. 
- Maharastra, Karnataka, Uttarpradesh are top states. 
- 2M sales are B2B
- M, L, XL are the sizes high in demand overall.
- Bengaluru, Hyderabad, New Delhi are having highest sales %.
- 64% of sales are sold to women.
- 93% of sales are delivered overall, 2.3% of sales are cancelled, 1.3% are refunded and 3.4% are returned.
- Flipkart and Myntra has 3M sales returned,  5M sales in Amazon is returned.  
</pre>
##### Category and Sales of not delivered Items 
<pre>
- Depicts total sales of undelivered : Refunded, cancelled, returned.
  - Men have western dress the highest followed by 'set'. 
  - Women have Kurta highest followed by 'set'. 
  - Blouse and bottom are completely delivered at Amazon.
</pre>
  

##### Purchase Trends Women
<pre>
On filter on women, 
- February to April is peak time for Set purchases, with peak on March. 
- Further sales are increased in October. 
- Kurta has peak sales during February, May, September, November. 
- March, September, November is peak time for western dress of women.
</pre>
##### Date and Sales 
<pre>
- Qtr 1 has highest sales and Qtr 4 has lowest sales. 
- March- April has peak sales followed by July- August. 
- July has highest MoM% change and September has lowest. 
- Overall sales has a decreasing trend. 
</pre>
##### Delivery Status Analysis 

<pre>
- Top table shows the category wise status. 
- 'Kurta' has highest refund rate, 'Set' has highest cancellation and return rate campared to other categories. 
- Monthly trends indicate May and November had highest cancellation rate
- February, June, November had more refunds. 
- July October, December had highest returning of products. 
- 'Top', 'Set' has high delivery rate. 
- 'Bottom' has highest cancellation rate. 
- 'Ethnic dress', 'kurta' are mostly refunded. 
- 'Western Dress' and 'Bottom' are returned more. 
</pre> 

<pre>
This is non-interactive sample of the interactive dashboard.
Interactive dashboard will generate further insights. 
</pre>
## Conclusion 
- This analysis will be useful for taking relevant business decisions.
- Understanding the low performing areas and taking appropriate steps will serve the cause.
- Trends and patterns of purchases and preferences can be used for targetted marketing and offer announcements.
<pre>

  
</pre> 
![image](https://github.com/pooja614/PowerBI_Projects_/assets/69869583/593f982e-5df1-4363-8663-741c6b992a5a)




