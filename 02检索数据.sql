/*检索数据*/
# 用SELECT检索数据
SELECT prod_name
FROM Products;
# 检索多个列
SELECT prod_id, prod_name, prod_price
FROM Products;
# * 是通配符,可以检索所有列
SELECT * 
FROM Products;
# DISTINCT 只检索不同值
SELECT DISTINCT vend_ID
FROM Products;
# LIMIT和OFFSET规定了检索哪些行
SELECT prod_name 
FROM Products 
LIMIT 5 OFFSET 2;
# 可以简写成如下形式（反过来的）
SELECT prod_name 
FROM Products 
LIMIT 2,5;

/*挑战题*/
# 1
SELECT cust_id 
FROM Customers;
# 2
SELECT DISTINCT prod_id 
FROM orderItems;
# 3
# SELECT *
SELECT cust_id
FROM Customers;
