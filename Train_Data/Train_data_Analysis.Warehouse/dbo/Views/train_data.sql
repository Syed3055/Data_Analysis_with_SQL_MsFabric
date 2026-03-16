-- Auto Generated (Do not modify) DBBEE7FC597D454AB605649381C5152B04A6E035BE7DBC1A747870E409FAC8D6
create VIEW train_data AS
(select *, (Cost_of_the_Product * Prior_purchases) as total_sales_amt from [Train_LH].[dbo].[Train_Data])