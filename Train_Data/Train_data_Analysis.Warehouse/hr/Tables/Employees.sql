CREATE TABLE [hr].[Employees] (

	[EmployeeID] bigint NOT NULL, 
	[FirstName] varchar(50) NOT NULL, 
	[LastName] varchar(50) NOT NULL, 
	[Gender] char(1) NULL, 
	[Email] varchar(320) NOT NULL, 
	[Phone] varchar(30) NULL, 
	[DepartmentID] bigint NOT NULL, 
	[JobTitle] varchar(100) NOT NULL, 
	[Grade] varchar(10) NULL, 
	[WorkLocation] varchar(100) NULL, 
	[Salary] decimal(12,2) NOT NULL, 
	[DateOfJoin] date NOT NULL, 
	[DateOfExit] date NULL, 
	[ManagerEmail] varchar(320) NULL, 
	[ManagerEmployeeID] bigint NULL, 
	[LoadTS] datetime2(3) NOT NULL
);