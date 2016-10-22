CREATE DATABASE EtsyProject;
GO

USE EtsyProject;
GO

CREATE TABLE Suppliers(
	SupplierID bigint NOT NULL PRIMARY KEY,
	SupplierName varchar (50) NOT NULL,
	SupplierStreet varchar (50) NOT NULL,
	SupplierCity varchar (50) NOT NULL,
	SupplierState varchar (2) NOT NULL,
	SupplierZip varchar (5) NOT NULL,
	SupplierPhone varchar (10) NOT NULL);

CREATE TABLE Products(
	ProductID bigint NOT NULL PRIMARY KEY,
	ProductName varchar (50) NOT NULL,
	ProductCost decimal(10,2) NOT NULL,
	ProductPrice decimal(10,2) NOT NULL,
	CategoryID bigint NOT NULL,
	SupplierID bigint NOT NULL);

CREATE TABLE Category(
	CategoryID bigint NOT NULL PRIMARY KEY,
	CategoryName varchar (50) NOT NULL);

CREATE TABLE Subcategory(
	SubcategoryID bigint NOT NULL PRIMARY KEY,
	SubcategoryName varchar (50) NOT NULL,
	CategoryID bigint NOT NULL);

CREATE TABLE OrderDetail(
	OrderDetailID bigint NOT NULL PRIMARY KEY,
	Quantity integer NOT NULL,
	ProductID bigint NOT NULL,
	OrderID	bigint NOT NULL);

CREATE TABLE Orders(
	OrderID bigint NOT NULL PRIMARY KEY,
	CustomerID bigint NOT NULL,
	OrderDate timestamp NOT NULL,
	ShipDate date NOT NULL,
	DueDate date NOT NULL,
	ShipCost decimal(10,2) NOT NULL,
	TaxAmount decimal(10,2) NOT NULL,
	OrderTotal decimal(10,2) NOT NULL,
	ShippingCoID bigint NOT NULL);

CREATE TABLE Customers(
	CustomerID bigint NOT NULL PRIMARY KEY,
	CustFirstName varchar (50) NOT NULL,
	CustLastName varchar (50) NOT NULL);

CREATE TABLE CustomerInfo(
	CustomerInfoID bigint NOT NULL PRIMARY KEY,
	CustomerID bigint NOT NULL,
	CustomerEmail varchar (50) NOT NULL,
	CustomerPhone varchar (10) NOT NULL,
	CustomerAddress varchar (50) NOT NULL,
	CustomerCity varchar (50) NOT NULL,
	CustomerState varchar (2) NOT NULL,
	CustomerZip varchar (5) NOT NULL);

CREATE TABLE ShippingCompany(
	ShippingCoID bigint NOT NULL PRIMARY KEY,
	ShippingCoName varchar (50) NOT NULL,
	ShippingCoEmail varchar (50) NOT NULL,
	ShippingCoPhone varchar (10) NOT NULL,
	ShippingCoAddress varchar (50) NOT NULL,
	ShippingCoCity varchar (50) NOT NULL,
	ShippingCoState varchar (2) NOT NULL,
	ShippingCoZip varchar (5) NOT NULL);

ALTER TABLE Products ADD CONSTRAINT FK_Products_Category 
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);

ALTER TABLE Products ADD CONSTRAINT FK_Products_Supplier 
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID);

ALTER TABLE Subcategory ADD CONSTRAINT FK_Subcategory_Category 
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);

ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Products 
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Orders
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customers 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_ShippingCompany 
FOREIGN KEY (ShippingCoID) REFERENCES ShippingCompany(ShippingCoID);

ALTER TABLE CustomerInfo ADD CONSTRAINT FK_CustomerInfo_Customers 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

GO