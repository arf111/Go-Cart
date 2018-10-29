clear screen;

drop table category cascade constraints;
drop table goes_in cascade constraints;
drop table branch cascade constraints;
drop table customer cascade constraints;
drop table membership cascade constraints;
drop table proceed cascade constraints;
drop table product cascade constraints;
drop table occurs_in cascade constraints;
drop table stores_in cascade constraints;
drop table transaction cascade constraints;
drop table warehouse cascade constraints;
drop table sales cascade constraints;

CREATE TABLE branch (
  Branch_ID int,
  Location varchar(11),
  Phone int
);

CREATE TABLE category (
  C_ID int,
  C_Name varchar(20)
);

CREATE TABLE membership (
  M_ID int,
  P_Range_From number,
  P_Range_To number,
  Discount_Rate number,
  Type varchar(50)
);

CREATE TABLE product (
  P_ID int,
  Selling_Price number,
  P_Name varchar(50),
  C_ID int
);

CREATE TABLE customer (
  C_ID int,
  C_Name varchar(50),
  Email varchar(50),
  M_ID int
);

CREATE TABLE transaction (
  T_ID int,
  Cust_ID int,
  Branch_ID int,
  Total_Price number,
  T_Date date
);

CREATE TABLE goes_in (
  P_ID int,
  T_ID int,
  Quantity int
);

CREATE TABLE occurs_in (
  Branch_ID int,
  T_ID int
);

CREATE TABLE proceed (
  T_ID int,
  C_ID int
);

CREATE TABLE stores_in (
  P_ID int,
  P_Quantity int,
  Branch_ID int
);

CREATE TABLE warehouse (
  S_ID int,
  S_Date date,
  P_ID int,
  P_Quantity int,
  Buying_Price number
);

CREATE TABLE sales (
   Serial_no int,
   Month number,
   Sales number
);

INSERT INTO branch (Branch_ID, Location, Phone) VALUES
(1, 'Dhanmondi', 168552341);
INSERT INTO branch (Branch_ID, Location, Phone) VALUES
(2, 'Mohammadpur', 169456783);
INSERT INTO branch (Branch_ID, Location, Phone) VALUES
(3, 'Kochukhet', 1734521376);

INSERT INTO membership (M_ID, P_Range_From, P_Range_To, Discount_Rate, Type) VALUES
(1, 2000, 10000, 5, 'Bronze');
INSERT INTO membership (M_ID, P_Range_From, P_Range_To, Discount_Rate, Type) VALUES
(2, 10000, 20000, 10, 'Silver');
INSERT INTO membership (M_ID, P_Range_From, P_Range_To, Discount_Rate, Type) VALUES
(3, 20000, 40000, 20, 'Gold');
INSERT INTO membership (M_ID, P_Range_From, P_Range_To, Discount_Rate, Type) VALUES
(4, 40000, 100000, 25, 'Platinum');

INSERT INTO category (C_ID, C_Name) VALUES
(1, 'Electronics');
INSERT INTO category (C_ID, C_Name) VALUES
(2, 'Cosmetics');
INSERT INTO category (C_ID, C_Name) VALUES
(3, 'Cellphone');

INSERT INTO product (P_ID, Selling_Price, P_Name, C_ID) VALUES
(10001, 500, 'Sunsilk Shampoo 500ml', 2);
INSERT INTO product (P_ID, Selling_Price, P_Name, C_ID) VALUES
(10002, 18000, 'Samsung J Prime', 3);
INSERT INTO product (P_ID, Selling_Price, P_Name, C_ID) VALUES
(10003, 28500, 'Samsung 32 inch TV', 1);
INSERT INTO product (P_ID, Selling_Price, P_Name, C_ID) VALUES
(10004, 36000, 'Conion 50-50 Refrigerator BG 21FDCG', 1);

INSERT INTO customer (C_ID, C_Name, Email, M_ID) VALUES
(1001, 'Arefeen Sultan', 'arsultan@gmail.com', 4);
INSERT INTO customer (C_ID, C_Name, Email, M_ID) VALUES
(1002, 'Fahim Ahsan Khan', 'fahim@gmail.com', 3);
INSERT INTO customer (C_ID, C_Name, Email, M_ID) VALUES
(1003, 'Ahnaf Tahseen Prince', 'gamer@gmail.com', 3);
INSERT INTO customer (C_ID, C_Name, Email, M_ID) VALUES
(1004, 'Sayed Hossain Khan', 'dark@gmail.com', 1);

INSERT INTO transaction (T_ID, Cust_ID, Branch_ID, Total_Price, T_Date) VALUES
(1, 10001, 1, 500, '09-JAN-2018');
INSERT INTO transaction (T_ID,Cust_ID,Branch_ID,Total_Price,T_Date) VALUES
(2, 10002, 2, 36000, '02-JAN-2018');
INSERT INTO transaction (T_ID,Cust_ID,Branch_ID,Total_Price,T_Date) VALUES
(3, 10003, 1, 28500, '03-JAN-2018');
INSERT INTO transaction (T_ID,Cust_ID,Branch_ID,Total_Price,T_Date) VALUES
(4, 10004, 2, 72000, '04-JAN-2018');

INSERT INTO goes_in values(10001,1,1);
INSERT INTO goes_in values(10002,2,2);
INSERT INTO goes_in values(10003,3,1);
INSERT INTO goes_in values(10004,4,2);

INSERT INTO occurs_in (Branch_ID, T_ID) VALUES
(1, 1);
INSERT INTO occurs_in (Branch_ID, T_ID) VALUES
(2, 3);
INSERT INTO occurs_in (Branch_ID, T_ID) VALUES
(3, 2);

INSERT INTO proceed (T_ID, C_ID) VALUES
(1, 1003);
INSERT INTO proceed (T_ID, C_ID) VALUES
(2, 1004);
INSERT INTO proceed (T_ID, C_ID) VALUES
(3, 1001);

INSERT INTO stores_in (P_ID, P_Quantity, Branch_ID) VALUES
(10001, 3, 1);
INSERT INTO stores_in (P_ID, P_Quantity, Branch_ID) VALUES
(10002, 1, 2);
INSERT INTO stores_in (P_ID, P_Quantity, Branch_ID) VALUES
(10003, 2, 2);
INSERT INTO stores_in (P_ID, P_Quantity, Branch_ID) VALUES
(10004, 1, 3);

INSERT INTO warehouse (S_ID, S_Date, P_ID, P_Quantity, Buying_Price) VALUES
(1, '02-JAN-2018', 10001, 20, 9000);
INSERT INTO warehouse (S_ID, S_Date, P_ID, P_Quantity, Buying_Price) VALUES
(2, '03-JAN-2018', 10002, 10, 170000);
INSERT INTO warehouse (S_ID, S_Date, P_ID, P_Quantity, Buying_Price) VALUES
(3, '06-JAN-2018', 10003, 12, 336000);
INSERT INTO warehouse (S_ID, S_Date, P_ID, P_Quantity, Buying_Price) VALUES
(4, '03-JAN-2018', 10004, 8, 280000);

INSERT INTO sales values(1,1,345000);
INSERT INTO sales values(2,2,245987);
INSERT INTO sales values(3,3,212451);
INSERT INTO sales values(4,4,130851);
INSERT INTO sales values(5,5,517481);
INSERT INTO sales values(6,6,213947);
INSERT INTO sales values(7,7,128649);
INSERT INTO sales values(8,8,124711);
INSERT INTO sales values(9,9,235123);
INSERT INTO sales values(10,10,204818);
INSERT INTO sales values(11,11,365965);
INSERT INTO sales values(12,12,753212);
INSERT INTO sales values(13,1,344137);
INSERT INTO sales values(14,2,243487);
INSERT INTO sales values(15,3,212871);
INSERT INTO sales values(16,4,130851);
INSERT INTO sales values(17,5,514581);
INSERT INTO sales values(18,6,212147);
INSERT INTO sales values(19,7,122639);
INSERT INTO sales values(20,8,127531);
INSERT INTO sales values(21,9,234933);
INSERT INTO sales values(22,10,201458);
INSERT INTO sales values(23,11,367465);
INSERT INTO sales values(24,12,744212);

commit;