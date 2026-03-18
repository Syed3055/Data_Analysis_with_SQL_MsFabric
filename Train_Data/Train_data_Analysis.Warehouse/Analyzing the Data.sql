---Data Loading-----
select * from [Train_LH].[dbo].[Train_Data]
--Checking row count ---------------

select count(*) total_rows from [Train_LH].[dbo].[Train_Data]

---Checking Doublicate ID's---

select ID, COUNT(*) Nof_R from train_data 
GROUP by ID order by Nof_R desc --- No douplicates 

---Creating the view -------

create VIEW train_data AS
(select *, (Cost_of_the_Product * Prior_purchases) as total_sales_amt from [Train_LH].[dbo].[Train_Data])
go;


----------*** Analyzing the data  *** -----------

---- Mode of shipment wise Sales-------

select Mode_of_Shipment, SUM(total_sales_amt) total_sales
from train_data
group by Mode_of_Shipment order by total_sales DESC;

--Mode of shipment with Avg Sales ---------------

select Mode_of_Shipment, AVG(total_sales_amt) total_sales
from train_data
group by Mode_of_Shipment order by total_sales DESC;

------Mode of shipment with more then Avg Amount --------

with cte as (
select Mode_of_Shipment, AVG(total_sales_amt) avg_sales
from train_data
group by Mode_of_Shipment
) 
select t.Mode_of_Shipment, t.total_sales_amt, cte.avg_sales
from train_data t INNER join cte on t.Mode_of_Shipment = cte.Mode_of_Shipment 
WHERE t.total_sales_amt>cte.avg_sales

------More utilize of Warehouse_Blocks

SELECT Warehouse_block, COUNT(*) nof, ROW_NUMBER() over(order by COUNT(*)  desc) rnk from train_data
GROUP by Warehouse_block ORDER by nof DESC

---Product Importance with Gender and Sales---------------

Select  Product_importance , Gender,
COUNT(*) Nof, sum(total_sales_amt) total_sales_amt
from train_data group by Product_importance, Gender order by total_sales_amt desc;

----- Product_importance with no_Orders teir sales Values----

select Product_importance  ,
SUM( Prior_purchases) as nof_preferance, SUM(total_sales_amt) amt_value  from train_data
group by Product_importance  order by nof_preferance DESC

-----Product_importance with more then Avg_rating

with avg_r as(
SELECT  Product_importance, Avg(Customer_rating) avg_ratings  from train_data 
GROUP by Product_importance 
)
select t.Product_importance, t.Customer_rating from train_data t
INNER join avg_r on t.Product_importance = avg_r.Product_importance where t.Customer_rating>avg_ratings

--- Nof order reached in time with %

with cte as (
select Product_importance, 
 CASE when [Reached.on.Time_Y.N]= 1 then   sum([Reached.on.Time_Y.N]) end as reached_on_time
from train_data  
group by Product_importance , [Reached.on.Time_Y.N] 
)
SELECT*, ROUND(100.0 * reached_on_time / NULLIF((SELECT COUNT(*) FROM train_data), 0),2) AS in_pc
FROM cte
WHERE reached_on_time IS NOT NULL;



























