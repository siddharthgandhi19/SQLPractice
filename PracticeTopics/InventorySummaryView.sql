

Create Table ProductDetails(
ProductId INT PRIMARY KEY,
ProductName VARCHAR(50),
SupplierId INT,
UnitPrice Decimal(10,2),
FOREIGN KEY (SupplierId) REFERENCES SupplierInformation(SupplierId)
)

insert into ProductDetails values (101,'Sharbati Wheat',1,5000.00)
insert into ProductDetails values (102,'Elible Oil',2,2200.00)
insert into ProductDetails values (103,'Internet 100Mbps',3,999.00)
insert into ProductDetails values (104,'Sinerest',4,50.00)
insert into ProductDetails values (105,'Sinerest',4,50.00)
insert into ProductDetails values (101,'Lokwan Wheat',1,2500.00)

select * from ProductDetails

Create Table SupplierInformation (
SupplierId INT PRIMARY KEY,
SupplierName VARCHAR(50),
SupplierCity VARCHAR(50),
SupplierState VARCHAR(50)
)

insert into SupplierInformation values (1,'Jain & Sons','Bhopal','MP')
insert into SupplierInformation values (2,'Adani Group','Surat','GJ')
insert into SupplierInformation values (3,'Jio','Mumbai','MH')
insert into SupplierInformation values (4,'PharmaComp','Mandideep','MP')

select * from SupplierInformation
select * from ProductDetails

Create View InventorySummary AS
Select
p.ProductName,
P.SupplierId,
p.UnitPrice

from
ProductDetails p inner join SupplierInformation s ON p.SupplierId = s.SupplierId
where ProductName = 'Sinerest'

select * from InventorySummary




