clear screen;

drop table branch2 cascade constraints;
drop table stores_in2 cascade constraints;
drop table transaction2 cascade constraints;

CREATE TABLE stores_in2 (
  P_ID int,
  P_Quantity int,
  Branch_ID int
);

CREATE TABLE branch2 (
  Branch_ID int,
  Location varchar(11),
  Phone int
);

CREATE TABLE transaction2 (
  T_ID int,
  Cust_ID int,
  Branch_ID int,
  Total_Price number,
  T_Date date
);

commit;