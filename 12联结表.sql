/*联结表*/
# 创建联结
# FROM后接多个表名，WHERE后要用限定列名
SELECT vend_name, prod_name, prod_price
FROM Vendors, Products
WHERE Vendors.vend_id = Products.vend_id;
# 如果没有WHERE，返回的是两个表的笛卡尔积(叉联结)
SELECT vend_name, prod_name, prod_price
FROM Vendors, Products;
# 内联结（等值联结）,效果与WHERE相同
SELECT vend_name, prod_name, prod_price
FROM Vendors
INNER JOIN Products 
ON Vendors.vend_id = Products.vend_id;
# 联结多个表
SELECT prod_name, vend_name, prod_price, quantity
FROM OrderItems, Products, Vendors
WHERE Products.vend_id = Vendors.vend_id
    AND OrderItems.prod_id = Products.prod_id
    AND order_num = 20007;
# 利用子查询完成类似的联结功能
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (
    SELECT cust_id
    FROM Orders
    WHERE order_num IN (
        SELECT order_num
        FROM OrderItems
        WHERE prod_id = 'RGAN01'));
# 利用联结完成上述语句的功能
# 利用两次联结加一个过滤代替两个子查询
SELECT cust_name, cust_contact
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
    AND OrderItems.order_num = Orders.order_num
    AND prod_id = 'RGAN01';

/*挑战题*/
# 1
-- 方法一
SELECT cust_name, order_num
FROM Customers, Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;
-- 方法二
SELECT cust_name, order_num
FROM Customers
INNER JOIN Orders
ON Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;
# 2
-- 方法一
SELECT cust_name, 
    Orders.order_num, 
    SUM(quantity*item_price) AS orderTotal 
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
    AND Orders.order_num = OrderItems.order_num
GROUP BY cust_name, order_num
ORDER BY cust_name, order_num;
-- 方法二
SELECT cust_name, 
    order_num, ( 
    SELECT SUM(quantity*item_price)
    FROM orderitems
    WHERE Orders.order_num = OrderItems.order_num) 
    AS orderTotal 
FROM Customers, Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name, order_num;
# 3
SELECT cust_id, order_date
FROM Orders, OrderItems
WHERE Orders.order_num = OrderItems.order_num
    AND prod_id = 'BR01'
ORDER BY order_date;
# 4
SELECT cust_email
FROM Customers
INNER JOIN Orders 
ON Customers.cust_id = Orders.cust_id
INNER JOIN OrderItems 
ON Orders.order_num = OrderItems.order_num
WHERE prod_id = 'BR01';
# 5
-- 方法一
SELECT cust_name, 
    SUM(quantity*item_price) AS total_price
FROM Orders, OrderItems, Customers
WHERE Orders.order_num = OrderItems.order_num
    AND Orders.cust_id = Customers.cust_id
GROUP BY OrderItems.order_num
HAVING total_price >= 1000
ORDER BY cust_name;
-- 方法二
SELECT cust_name, 
    SUM(quantity*item_price) AS total_price
FROM Orders
INNER JOIN OrderItems
ON Orders.order_num = OrderItems.order_num
INNER JOIN Customers
ON Orders.cust_id = Customers.cust_id
GROUP BY OrderItems.order_num
HAVING total_price >= 1000
ORDER BY cust_name;