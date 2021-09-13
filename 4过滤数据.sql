/*过滤检索数据*/
/*
WHEWE子句操作符
= 等于
<> != 不等于
< 小于
<= !> 小于等于
> 大于
>= !< 大于等于
BETWEEN AND 在指定的两个值之间
IS NULL 为NULL值（与0，空字符串不同）
*/
# 用WHERE指定条件，选择特定的行
SELECT prod_name, prod_price
FROM Products
WhERE prod_price = 3.49;
# 检查单个值 <
SELECT prod_name, prod_price
FROM Products
WHERE prod_price < 10; 
# 检查单个值 <=
SELECT prod_name, prod_price
FROM Products
WHERE prod_price <= 10;
# 不匹配检查 <> 
# 虽然NULL也不匹配，但不会返回NULL类型
SELECT vend_id, prod_name
FROM Products
WHERE vend_id <> 'DLL01'; 
# 不匹配检查 !=
SELECT vend_id, prod_name
FROM Products
WHERE vend_id != 'DLL01';
# 范围值检查 BETWEEN AND
SELECT prod_name, prod_price
FROM Products
WHERE prod_price BETWEEN 5 AND 10;
# 空值检查 使用IS
SELECT prod_name
FROM Products
WHERE prod_price IS NULL;
# 空值检查
SELECT cust_name
FROM Customers
WHERE cust_email IS NULL;

/*挑战题*/
# 1
SELECT prod_id, prod_name
FROM Products
WHERE prod_price = 9.49;
# 2
SELECT prod_id, prod_name
FROM Products
WHERE prod_price >= 9;
# 3
SELECT DISTINCT order_num
FROM OrderItems
WHERE quantity >= 100;
# 4
SELECT prod_name, prod_price
FROM Products
WHERE prod_price BETWEEN 3 AND 6
ORDER BY prod_price;






