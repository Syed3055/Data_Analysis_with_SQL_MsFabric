CREATE TABLE [hr].[Bonuses] (

	[BonusID] bigint NOT NULL, 
	[EmployeeID] bigint NOT NULL, 
	[BonusYear] int NOT NULL, 
	[BonusAmount] decimal(12,2) NOT NULL, 
	[AwardedOn] date NOT NULL
);