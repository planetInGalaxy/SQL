/*插入数据*/
/*
插入有三种方式：
插入完整的行
插入行的一部分
插入某些查询的结果
*/
# 用INSERT将一行数据插入到表中
# INTO是可选的
# 每一列都要有值，如果没有，用NULL代替
# 不允许插入主键相同的值
INSERT INTO Customers
VALUES(
    1000000006,
    'Toy Land',
    '123 Any Street',
    'New York',
    'NY',
    '1111',
    'USA',
    NULL,
    NULL);
# 按顺序指定列名并插入
INSERT INTO Customers(
    cust_id,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country,
    cust_contact,
    cust_email) 
VALUES(
    1000000006,
    'Toy Land',
    '123 Any Street',
    'New York',
    'NY',
    '1111',
    'USA',
    NULL,
    NULL);
# 以其他顺序指定列名并插入
# 未指定的列为NULL
INSERT INTO Customers(
    cust_id,
    cust_contact,
    cust_email,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip
    ) 
VALUES(
    1000000006,
    NULL,
    NULL,
    'Toy Land',
    '123 Any Street',
    'New York',
    'NY',
    '1111'
);
# 插入行的一部分（即部分列）
# 被省略的列需要满足允许NULL或者有默认值
INSERT INTO Customers(
    cust_id,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country
    ) 
VALUES(
    1000000006,
    'Toy Land',
    '123 Any Street',
    'New York',
    'NY',
    '1111',
    'USA'
);
# 插入检索出来的数据
# 用列的位置来匹配，而不是列名
INSERT INTO Customers(
    cust_id,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country,
    cust_contact,
    cust_email) 
SELECT cust_id,
    cust_name,
    cust_address,
    cust_city,
    cust_state,
    cust_zip,
    cust_country,
    cust_contact,
    cust_email
FROM CustNew;
# 用CREATE TABLE配合SELECT将一个表的内容复制到另一个表中
CREATE TABLE CustCopy AS SELECT * FROM Customers;
# SQL Server的写法
SELECT * INTO CustCopy FROM Customers;

/*挑战题*/
# 1
INSERT INTO Customers(
    cust_id,
    cust_name,
    cust_email) 
VALUES(
    1000000007,
    'Tjg',
    '1205322591@qq.com'
);
# 2
-- MySQL, MariaDB, Oracle, PostgreSQL, SQLite
CREATE TABLE OrdersBackup AS SELECT * FROM Orders;
CREATE TABLE OrderItemsBackup AS SELECT * FROM OrderItems;
-- SQL Server
SELECT * INTO OrdersBackup FROM Orders;
SELECT * INTO OrderItemsBackup FROM OrderItems;