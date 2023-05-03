CREATE DATABASE BankingManagementDB

-------------------------Customers Table-------------------------

CREATE TABLE Customers (
CustomerID INT IDENTITY (1,1) PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
UNIQUE(Email),
PhoneNumber VARCHAR(20),
Address VARCHAR(200),
AccountNumber VARCHAR(50),
UNIQUE(AccountNumber),
AccountType VARCHAR(50),
Balance DECIMAL(10,2)
);


-------------------------Accounts Table-------------------------
CREATE TABLE Accounts (
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
UNIQUE(Email),
PhoneNumber VARCHAR(20),
Address VARCHAR(200),
AccountNumber VARCHAR(10) PRIMARY KEY,
AccountType VARCHAR(50),
Balance DECIMAL(10,2),
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

select * from Accounts
drop table Accounts
-------------------------Transactions Table-------------------------
CREATE TABLE Transactions(
TransactionID INT IDENTITY (1,1) PRIMARY KEY,
FromAccountNumber VARCHAR(10),
ToAccountNumber VARCHAR(10),
TransactionDate DATE,
TransferAmount DECIMAL(10,2),
AccountNumber VARCHAR(10),
FOREIGN KEY (AccountNumber) REFERENCES Accounts(AccountNumber)
);

select * from Transactions
drop table Transactions


-------------------------Loans Table-------------------------
CREATE TABLE Loans (
LoanID INT PRIMARY KEY,
CustomerID INT,
LoanAmount DECIMAL(10,2),
InterestRate DECIMAL(10,2),
LoanTerm INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-------------------------Payments Table-------------------------
CREATE TABLE Payments (
PaymentID INT PRIMARY KEY,
LoanID INT,
PaymentDate DATE,
PaymentAmount DECIMAL(10,2),
FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);

-------------------------Branches Table-------------------------
CREATE TABLE Branches (
BranchID INT PRIMARY KEY,
BranchName VARCHAR(50),
Address VARCHAR(200),
PhoneNumber VARCHAR(20),
Email VARCHAR(100),
--FOREIGN KEY (AccountNumber) REFERENCES Accounts(AccountNumber)
);

drop table Branches

-------------------------Employees Table-------------------------
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
PhoneNumber VARCHAR(20),
Address VARCHAR(200),
Designation VARCHAR(50),
Salary DECIMAL(10,2),
BranchID INT,
FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);

drop table Employees

-------------------------CreditCards Table-------------------------
CREATE TABLE CreditCards (
CreditCardNumber VARCHAR(50) PRIMARY KEY,
CustomerID INT,
CreditLimit DECIMAL(10,2),
Balance DECIMAL(10,2),
CreditCardType VARCHAR(50),
ExpirationDate DATE,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);