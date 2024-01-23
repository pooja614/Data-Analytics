# Supply Chain Analysis 

Supply chain analysis is the process of evaluating every stage of a supply chain starting from the time the business acquires raw materials or supplies from its suppliers, to the delivery of final products to the customers. 
                        

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/98ef2f00-0499-41fa-99c1-57dc860ea9c0)


## Descriptive analytics
This project aims at descriptive analysis. It is a type of analytics where data is used to describe trends and relationships, such as supply chain performance or a warehouse’s inventory levels. Logistics professionals use descriptive analytics, consequently, to understand how a supply chain and its parts are currently working.  
### About the Data 
* The dataset of Supply Chains used by the company DataCo Global is used for the analysis.
* The dataset is obtained from kaggle.
* Provisioning , Production , Sales , Commercial Distribution are some of the areas of analysis included in this project. 
## Planning 
* Data columns are grouped for understanding of the data.
* Excel is used to understand the relation between different columns and categorize them to create schema.

![image](https://github.com/pooja614/PowerBI_Projects_/assets/69869583/ca8de022-32c0-4c0a-83e5-f14e9553c420)

## Data Preprocessing and Data Modelling
* The data type of the relevant columns are changed to respective types.
* Dublicates are removed. 
* The data columns are grouped and seperated into different tables.
* Different transformation steps are applied. 
* ![etl_2](https://github.com/pooja614/supply_chain/assets/69869583/775714a3-d6e0-4c46-8982-586ed23165eb)
* Tables are merged to assign IDs' in  Fact table. 
* The data is modelled to 'Star Schema'. 
* New IDs' are assigned to few columns after creating table.
![data_model](https://github.com/pooja614/supply_chain/assets/69869583/f7a220ca-9653-4fdc-8c50-8fa29f2aaf1b)
* Relationship is assigned between primary key and foreign key. 
* Date table is newly populated for efficient plotting of graph.



## DAX and Measures
* Different measures are created using DAX for analysis<br>
* DAX functions are used to produce effective calculations and analysis.
<pre>
 

<b>Creating Date Column: </b>
Dates = CALENDAR(DATE(YEAR(MIN('DIM-order'[order date])),1,1), DATE(YEAR(MAX('DIM-order'[order date])), 1,31))

<b>DAX Queries: </b>
Net Sales = SUM('FACT-CoSupplyChain'[Net Sales])
Net Revenue = SUM('FACT-CoSupplyChain'[Net Sales])
Revenue Contribution % = 
  DIVIDE(
  [Net Revenue], 
  CALCULATE(
  [Net Revenue], ALL('DIM-category'), All('DIM-customers'), All('DIM-order'), ALL('DIM-product')
  )
  )


Total Profit Margin = sum('FACT-CoSupplyChain'[Order Profit Per Order])
Profit Margin % = [Total Profit Margin]/[Net Revenue] 
Profit Margin Contribution % =
  DIVIDE(
  [Total Profit Margin], 
  CALCULATE([Total Profit Margin], ALL('DIM-category'), All('DIM-customers'), All('DIM-order'), ALL('DIM-product')
  )
  )

Sales LM = CALCULATE( [Net Sales],DATEADD('FACT-CoSupplyChain'[order date],-1,MONTH))  
Sales Monthly Change% = DIVIDE([Net Sales],[Sales LM])



Quantity = 
CALCULATE(
[Total Quantity],
ALL('DIM-order'[Order Region]))

Total Orders = COUNT('FACT-CoSupplyChain'[Order Id])


Consumer Net Revenue = 
CALCULATE(
    [Net Revenue], 
    'DIM-customers'[Customer Segment] = "Consumer"
)

Corporate Net Revenue = 
CALCULATE(
    [Net Revenue], 
    'DIM-customers'[Customer Segment] = "Corporate"
)

Home Office Net Revenue = 
CALCULATE(
    [Net Revenue], 
    'DIM-customers'[Customer Segment] = "Home Office"
)

Loss Sales = CALCULATE(SUM('FACT-CoSupplyChain'[Net Sales]),'FACT-CoSupplyChain'[Order Item Profit Ratio]<0)
Loss % = DIVIDE([Loss Sales],[Net Sales])

Loss Sales LY % = 
VAR Sales_ = 
CALCULATE(
    [Loss %], 
    DATEADD(
        Dates[Date], 
        -1, 
        Year
    )
)

RETURN 
COALESCE(
    Sales_ , 
    "-"
)

</pre>
## Tooltips and Filters
Tooltips and filters are used. 


![image](https://github.com/pooja614/Data-Analytics/assets/69869583/9c64a7f5-0f22-4bcc-98ac-ce595106f575)



## Visualizations 
The below slides are the non-interactive version of the Interactive PowerBI Dashboard. 
### Geography and Market Sales Analysis

![image](https://github.com/pooja614/Data-Analytics/assets/69869583/36dbe808-fdfe-463a-a920-72b29f8156b0)

<pre></pre>
### Customer Insights
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/73e9eeeb-ce48-4ded-9c60-7a5030cac315)


<pre></pre>
### Yearly Sales 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/9f6e1cd3-ba1f-4cb8-9e15-2b34fde23568)


<pre></pre>
### Order Timing Trends by Category
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/44e8be35-14f7-4361-9b1d-624b44b3a176)

<pre></pre>
### Loss Sales Analysis
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/e79e370d-7eac-4c9a-a0c8-358edd518af9)

<pre></pre>
### Payment Analysis
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/bec23c38-3cef-4e27-a7be-b65643b1faa3)


<pre></pre>
### Shipment and Delivery Insights 
![image](https://github.com/pooja614/Data-Analytics/assets/69869583/b8b52fcb-47a0-440e-86ee-e2fb6ddd1462)


<pre></pre>

### Conclusion 
<pre>
 Thus these insights can be used for taking business decisions.
</pre>

![image](https://github.com/pooja614/PowerBI_Projects_/assets/69869583/7269b782-9f44-4ef2-9402-c4c7a98e61b5)
<pre>
This is non-interactive version of the interactive PowerBI dashboard. Sample insights are presented through the slide. 
Detailed insights and findings can be obtained by applying interactions. 
</pre>
