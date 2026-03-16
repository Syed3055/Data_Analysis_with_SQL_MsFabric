---Data Loading-----
select * from [Train_LH].[dbo].[Train_Data]
--Checking row count ---------------
select count(*) total_rows from [Train_LH].[dbo].[Train_Data]
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
---

Select *from train_data









