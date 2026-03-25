CREATE TABLE [dbo].[DIM_CUSTOMER] (

	[customer_id] int NULL, 
	[customer_name] varchar(200) NULL, 
	[region] varchar(100) NULL, 
	[first_purchase_date] date NULL, 
	[last_purchase_date] date NULL
);