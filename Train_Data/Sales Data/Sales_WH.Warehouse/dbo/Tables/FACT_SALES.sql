CREATE TABLE [dbo].[FACT_SALES] (

	[sales_id] bigint NULL, 
	[cust_id] int NULL, 
	[product_id] int NULL, 
	[location_id] int NULL, 
	[order_date] date NULL, 
	[shipped_date] date NULL, 
	[unit_sold] int NULL, 
	[price] decimal(10,2) NULL, 
	[discount] decimal(5,2) NULL, 
	[net_sales] decimal(18,2) NULL, 
	[return_flag] char(1) NULL
);