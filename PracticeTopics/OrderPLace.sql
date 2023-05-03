create a stored procedure that can handle the complete 
order processing workflow, including creating an order, updating inventory,
calculating total price, and generating an invoice.


CREATE TABLE CustomersTable(	
	CustomerId INT PRIMARY KEY,
	CustomerName VARCHAR(50),
	CustomerEmail VARCHAR(50),
	CustomerPhone VARCHAR(50)
)

INSERT INTO CustomersTable Values ( 101, 'Siddharth Gandhi', 'sid@gmail.com','7418529630' )
INSERT INTO CustomersTable Values ( 102, 'Saurabh Rajankar', 'saurabh@gmail.com','9741651321' )
INSERT INTO CustomersTable Values ( 103, 'Lalit Raghuwanshi', 'lalit@gmail.com','9632587410' )
INSERT INTO CustomersTable Values ( 101, 'Aniket Jiotode', 'aniket@gmail.com','8527419630' )

select * from CustomersTable


Create Table ProductTable(
	ProductId INT PRIMARY KEY,
	ProductName VARCHAR(50),
	ProductPrice Decimal(10,2)
)

INSERT INTO ProductTable Values ( 201, 'Wheat', '5000.00' )
INSERT INTO ProductTable Values ( 202, 'Rice', '20000.00' )
INSERT INTO ProductTable Values ( 203, 'Cashew', '1000.00' )
INSERT INTO ProductTable Values ( 204, 'Almonds', '1200.00' )

select * from ProductTable

Create Table OrdersTable(	
	OrderId INT PRIMARY KEY,
	ProductId INT,
	CustomerId INT,
	FOREIGN Key (ProductId) REFERENCES ProductTable (ProductId),
	FOREIGN Key (CustomerId) REFERENCES CustomersTable (CustomerId),
	Quantity INT,
	TotalPrice Decimal (10,2)
)

drop Table OrdersTable

create table InventoryTable(
	InventoryId INT PRIMARY KEY,
	ProductId INT,
	FOREIGN Key (ProductId) REFERENCES ProductTable (ProductId),
	StockQuantity INT
)

INSERT INTO InventoryTable Values (501,201,500000)
INSERT INTO InventoryTable Values (502,202,450000)
INSERT INTO InventoryTable Values (503,203,1800)
INSERT INTO InventoryTable Values (504,204,2500)

select * from InventoryTable

create table InvoiceTable(
	
	InvoiceId INT PRIMARY KEY,
	OrderId INT,
	CustomerId INT,
	ProductId INT,
	ProductName VARCHAR(50),
	CustomerName VARCHAR(50),
	FOREIGN Key (ProductId) REFERENCES ProductTable (ProductId),
	FOREIGN Key (CustomerId) REFERENCES CustomersTable (CustomerId),
	FOREIGN Key (OrderId) REFERENCES OrdersTable (OrderId),
	Quantity INT,
	ProductPrice Decimal(10,2),
	TotalPrice Decimal (10,2)

)
drop table InvoiceTable


--create procedure spCreateOrder(

--	@CustomerName VARCHAR(50),
--	@CustomerEmail VARCHAR(50),
--	@CustomerPhone VARCHAR(50),
--	@ProductId INT
--	)
--AS
--Begin

--Declare @CustomerId INT,

--INSERT INTO OrdersTable (ProductId,CustomerId,Quantity,TotalPrice) Values 
--(@ProductId,@CustomerId,@Quantity,@TotalPrice)

--END

		create procedure spOrders(
		@CustomerId INT,
		@ProductId INT,
		@Quantity INT		
		)

		AS
		BEGIN


		Select  ProductName, ProductPrice from ProductTable where ProductId = ProductId;
		Select  StockQuantity from InventoryTable where ProductId = ProductId;

		set totalPrice = ProductPrice * Quantity

		Insert Into OrdersTable (ProductId,CustomerId,Quantity,TotalPrice) Values (@ProductId,@CustomerId,@Quantity,@TotalPrice)

		Update InventoryTable SET  StockQuantity = StockQuantity - Quantity where ProductId = ProductId;

		Insert Into InvoiceTable(OrderId,CustomerId,ProductId,ProductName,CustomerName,Quantity,ProductPrice,TotalPrice)
		Values (@OrderId,@CustomerId,@ProductId,@ProductName,@CustomerName,@Quantity,@ProductPrice,@TotalPrice)

		END

			
