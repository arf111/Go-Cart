# Go-Cart
A PL-SQL Project based on super shop

## Features

1.	Customer buys product, local store sells product, and therefore transaction happens.
2.	Customer can be approved for membership.
3.	Customer can search item for information and reliability.
4.	Warehouse has product inventory.
5.	Warehouse can distribute products to local store.
6.	There is monthly, weekly and daily sales report.
7.	Customer can search in different stores for product availability.
8.	Customer can see top selling products of specific category

## Platforms

1.	Programming Language :  PL-SQL

2.	Database:  Oracle SQL

## Machine Learning Technique

In procedure 6, we used a machine learning technique called linear regression to
predict the sales outcome for any month.
Our dataset includes 2 columns (Month = x, Sales = y). So for month, x = 1, 2…12
we inserted sales value y.
Then we calculated values by using the regression formula for a and b. Then for
any month, x = 1 = January we calculated y = a + bx and found the predicted
score.

![Go-Cart](Images/Machinelearning.jpg)

Output of forecasted sale of month 1 = January

