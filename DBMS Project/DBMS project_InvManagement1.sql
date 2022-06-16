create database project_InvManagement1;

use project_InvManagement1;

--------------------------------------------------------------------------------------------------------------------------------

create table Brands
(B_Id int primary key,
B_Name nvarchar(50)
);


insert into Brands values(1,'Dell');
insert into Brands values(2,'Lenove');
insert into Brands values(3,'IBM');
insert into Brands values(4,'Apple');

insert into Brands values(5,'Bata');
insert into Brands values(6,'Stylo');
insert into Brands values(7,'Adidas');
insert into Brands values(8,'Nike');

insert into Brands values(9,'Khaadi');
insert into Brands values(10,'Generation');

select *from Brands;


--------------------------------------------------------------------------------------------------------------------------------

create table Inv_User
(Inv_UserId int primary key,
Name nvarchar(50),
Password nvarchar(50),
Last_login datetime default (getdate()),
User_type nvarchar(50)
);

insert into Inv_User (Inv_UserId,Name,Password,User_type ) values(11,'Shehroz','7856', 'Buyer');
insert into Inv_User (Inv_UserId,Name,Password,User_type ) values(12,'Hamza','1122', 'Buyer');
insert into Inv_User (Inv_UserId,Name,Password,User_type ) values(13,'Haseeb','2233', 'Buyer');
insert into Inv_User (Inv_UserId,Name,Password,User_type )values(14,'Ali Arif','3344','Buyer');

select *from Inv_User;

--------------------------------------------------------------------------------------------------------------------------------
create table Categories
(C_Id int primary key,
Category_Name nvarchar(50)
);


insert into Categories values(21,'Electronic');
insert into Categories values(22,'Machinery');
insert into Categories values(23,'Accessories');
insert into Categories values(24,'Cables');
insert into Categories values(25,'Shoes');
insert into Categories values(26,'Clothes');

select *from Categories;

--------------------------------------------------------------------------------------------------------------------------------

Create table Stores
(S_Id int primary key,
S_Name nvarchar(50),
Address nvarchar(50),
);

insert into Stores values(31,'Amazone','Lahore');
insert into Stores values(32,'Daraz','karachi');
insert into Stores values(33,'OLX','Multan');
insert into Stores values(34,'Ali baba','Quetta');
insert into Stores values(35,'Big Bazar','Raiwind');

select *from Stores;

--------------------------------------------------------------------------------------------------------------------------------

create table Product
(P_Id int primary key,
C_Id int foreign key references Categories (C_Id) on delete set null on  update set null,
B_Id int foreign key references Brands (B_Id)on delete set null on  update cascade,
S_Id int foreign key references Stores (S_Id) on delete set null on  update cascade,
P_Name nvarchar(50),
P_Stoke int,
Price int,
Added_date datetime default (getdate())
);

insert into Product (P_Id,C_Id,B_Id,S_Id,P_Name,P_Stoke,Price) values(41,23,1,31,'Keyboard',76,299);
insert into Product (P_Id,C_Id,B_Id,S_Id,P_Name,P_Stoke,Price) values(42,23,3,32,'Mouse',59,99);
insert into Product (P_Id,C_Id,B_Id,S_Id,P_Name,P_Stoke,Price) values(43,22,2,35,'PC desktop',42,5999);
insert into Product (P_Id,C_Id,B_Id,S_Id,P_Name,P_Stoke,Price) values(44,24,1,34,'Power Supply',80,90);
insert into Product (P_Id,C_Id,B_Id,S_Id,P_Name,P_Stoke,Price) values(45,25,7,33,'RACER TR21 SHOES',89,299);
insert into Product (P_Id,C_Id,B_Id,S_Id,P_Name,P_Stoke,Price) values(46,25,6,32,'Golden Color Fancy Sandals FN4864',19,199);
insert into Product (P_Id,C_Id,B_Id,S_Id,P_Name,P_Stoke,Price) values(47,26,9,31,'Classic Kameez Printed Embroidered',11,999);
insert into Product (P_Id,C_Id,B_Id,S_Id,P_Name,P_Stoke,Price) values(48,26,10,34,'FABRIC Shirt: Lawn (100% Cotton)',25,1000);


select *from Product;


--------------------------------------------------------------------------------------------------------------------------------

create table Providers
(Provider_Id int primary key,
Provider_Name nvarchar(50),
P_Id int foreign key references Product(P_Id) ,
S_Id int foreign key references Stores(S_Id) ,
Discount int
);

insert into Providers values(51,'Bilal',48,34,25);
insert into Providers values(52,'Huzaifa',43,32,600);
insert into Providers values(53,'Asad',45,35,250);
insert into Providers values(54,'Chand',41,33,0);
insert into Providers values(55,'Asis',47,31,100);
							
select *from Providers;

--------------------------------------------------------------------------------------------------------------------------------

create table Customer_cart
(Cart_Id int primary key,
);

insert into Customer_cart values(61);
insert into Customer_cart values(62);
insert into Customer_cart values(63);
insert into Customer_cart values(64);
insert into Customer_cart values(65);

select *from Customer_cart;


--------------------------------------------------------------------------------------------------------------------------------

create table Select_Product
(Cart_Id int foreign key references Customer_cart(Cart_Id) on delete set null on  update cascade,
Inv_UserId int foreign key references Inv_User(Inv_UserId) on delete cascade on  update cascade,
P_Id int foreign key references Product (P_Id) on delete cascade on  update cascade,
Quantity int
);


insert into Select_Product values(62,11,43,1);
insert into Select_Product values(61,14,45,2);
insert into Select_Product values(63,12,44,5);
insert into Select_Product values(65,13,47,3);

select *from Select_product;

--------------------------------------------------------------------------------------------------------------------------------

create table [Transaction]
(T_Id int primary key,
Total_Amount int,
Paid int,
Gst int,
Discount int,
Payment_Method nvarchar(50),
Cart_Id int foreign key references Customer_cart(Cart_Id) on delete set null on  update cascade,
Inv_UserId int foreign key references Inv_User(Inv_UserId) on delete cascade on  update cascade
);

insert into [Transaction] values(71,5999,5000,999,999,'cash',62,11);
insert into [Transaction] values(72,598,550,48,0,'bank Transaction',61,14);
insert into [Transaction] values(73,450,400,50,50,'cash',63,12);
insert into [Transaction] values(74,2997,2950,47,47,'cash',65,13);
insert into [Transaction] values(75,5999,5000,999,999,'bank Transaction',62,11);

select *from [Transaction];

--------------------------------------------------------------------------------------------------------------------------------

create table Invoice
(Invoice_Id int primary key,
Product_Name nvarchar(50),
price int,
Quantity int,
Inv_UserId int foreign key references Inv_User(Inv_UserId) on delete cascade on update cascade
);




insert into Invoice values(81,'PC desktop',5000,1,11);
insert into Invoice values(82,'RACER TR21 SHOES',550,2,14);
insert into Invoice values(83,'Classic Kameez Printed Embroidered',2950,3,13);
insert into Invoice values(84,'Power Supply',400,5,12);

select *from Invoice;

-----------------------------------------------------------------------------------------------------------------------------

drop table Brands;
drop table Inv_User;
drop table Categories;
drop table Product;
drop table Stores;
drop table Providers;
drop table Customer_cart;
drop table Select_Product;
drop table [Transaction];
drop table Invoice;

-------------------------------------------------------------------------------------------------------------------------------



---Queries---

--Show Name in ascending and descending order--
select Name from Inv_User order by Name desc;
--show upper and lower case (Employee_Name) ---
select UPPER (Name) USER_NAME from Inv_User;
----Merage Two columns-----
select concat (Name,' password is ',password) 'Name or passwprd' from Inv_user;--Retrive first two letter of string---
select SUBSTRING (Name,1,2) Letters_of_User_Name from Inv_User;---Order By---
select model from cars group by model having avg(model)>2000 order by model desc;--------1. List products with order quantities greater than 100.
SELECT P_Name
 FROM product
WHERE p_id IN (SELECT p_id
 FROM Select_Product
 WHERE quantity > 2);


 --------2List all customers with their total number of orders
SELECT Name,
OrderCount = (SELECT COUNT(cart_id) FROM customer_cart )
 FROM inv_user;


 --------3 : Which products were sold by the unit (i.e. quantity = 1)
SELECT p_name
 FROM product
WHERE p_id = ANY
 (SELECT p_id
 FROM Select_product
 WHERE quantity = 5); --------4List customers who placed orders that are larger than the average of each
customer order
SELECT DISTINCT first_name + ' ' + last_name as CustomerName
 FROM Customer1, [orders]
WHERE Customer1.id = [orders].id
 AND total_amount> ALL
 (SELECT AVG(total_amount)
 FROM [orders]
 GROUP BY id);