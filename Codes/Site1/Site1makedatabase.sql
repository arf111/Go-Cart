clear screen;

drop table branch cascade constraints;
drop table stores_in cascade constraints;
drop table transaction cascade constraints;

CREATE TABLE stores_in1 (
  P_ID int,
  P_Quantity int,
  Branch_ID int
);

CREATE TABLE branch1 (
  Branch_ID int,
  Location varchar(11),
  Phone int
);

CREATE TABLE transaction1 (
  T_ID int,
  Cust_ID int,
  Branch_ID int,
  Total_Price number,
  T_Date date
);


commit;