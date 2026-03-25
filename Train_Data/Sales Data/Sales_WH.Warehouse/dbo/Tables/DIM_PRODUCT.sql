CREATE TABLE [dbo].[DIM_PRODUCT] (

	[product_id] int NULL, 
	[product_name] varchar(200) NULL, 
	[category] varchar(100) NULL, 
	[product_subcategory] varchar(100) NULL, 
	[price_band] varchar(20) NULL, 
	[first_sold_date] date NULL, 
	[last_sold_date] date NULL
);