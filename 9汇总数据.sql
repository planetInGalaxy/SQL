/*汇总数据*/
/*
聚集函数：
对某些行运行的函数，计算并返回一个值
*/
# 用AVG函数返回所有行中指定列的平均值
# AVG函数忽略值为NULL的行
# 只能用于单个列
SELECT AVG(prod_price) AS avg_price
FROM Products;
# 与WHHERE配合，指定特定的行
SELECT AVG(prod_price) AS avg_price
FROM Products
WHERE vend_id = 'DLL01';
# 用COUNT函数对行计数
SELECT COUNT(*) AS num_cust
FROM Customers;
# 对只具有电子邮件地址的客户计数
# 指定列名的时候，会忽略列名为NULL的行
SELECT COUNT(cust_email) AS num_cust
FROM Customers;
# 用MAX函数返回指定列的最大值
# 一般用于寻找最大的数值或日期值
# 忽略值为NULL的行
SELECT MAX(prod_price) AS max_price
FROM Products;
# 用MIN函数范湖指定列的最小值
# 一般用于寻找最小的数值或日期值
# 忽略值为NULL的行
SELECT MIN(prod_price) AS min_price
FROM Products;
# 用SUM函数返回指定列值的和(合计)
# 忽略值为NULL的行
SELECT SUM(quantity) AS items_ordered
FROM OrderItems
WHERE order_num = 20005;
# SUM也可以利用标准的算术操作符用来合计计算值
SELECT SUM(item_price*quantity) AS total_price
FROM OrderItems
WHERE order_num = 20005;
# 用DISTINCT指定不同的值
# 不加则默认为ALL
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM Products
WHERE vend_id = 'DLL01';
# 组合使用聚集函数
SELECT COUNT(*) AS num_items,
    MIN(prod_price) AS price_min,
    MAX(prod_price) AS price_max,
    AVG(prod_price) AS price_avg
FROM Products;

/*挑战题*/
# 1
SELECT SUM(quantity) AS items_ordered
FROM OrderItems;
# 2
SELECT SUM(quantity) AS items_ordered
FROM OrderItems
WHERE prod_id = 'BR01';
# 3
SELECT MAX(prod_price) AS max_price
FROM Products
WHERE prod_price <= 10;
