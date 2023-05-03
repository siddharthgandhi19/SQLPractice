CREATE TABLE BookDetails(
	BookId int Identity(1,1) PRIMARY KEY,
	BookImage varchar(200),
	BookName varchar(200),
	AuthorName varchar(200),
    Rating varchar(200),   
	DiscountPrice int,
	OriginalPrice int,
	Description varchar(255),
	);


	CREATE TABLE ADDRESS
    (
    AddressId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Address varchar(5000)NOT NULL,
	City varchar(100),
	State varchar(100),
	Id INT NOT NULL FOREIGN KEY (Id) REFERENCES UserDetails(Id)
    );

	CREATE TABLE ORDERTABLE(
   OrdersId int IDENTITY(1,1) NOT NULL  PRIMARY KEY, Id int FOREIGN KEY (Id) REFERENCES UserDetails(Id),BookId int FOREIGN KEY (BookId) REFERENCES BookDetails(BookId),
   AddressId int FOREIGN KEY (AddressId) REFERENCES Address (AddressId),OrderDate Date);

	CREATE TABLE ORDERPLACES
	(
		OrderId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
		EmailUs varchar(5000) NOT NULL,
		ContactUs varchar(5000) NOT NULL,
		Address varchar(5000)NOT NULL
	)

	CREATE TABLE CART
	(
 	CartId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Id int NOT NULL
	FOREIGN KEY (Id) REFERENCES UserDetails(Id),
	BookId int NOT NULL
	FOREIGN KEY (BookId) REFERENCES BookDetails(BookId),	
	Quantity int 
    );

