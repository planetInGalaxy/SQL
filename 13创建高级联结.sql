/*创建高级联结*/
# 给列起别名
SELECT RTRIM(vend_name) + ' (' 
    + RTRIM(vend_country) + ')'
    AS vend_title
FROM Vendors
ORDER BY vend_name;
# 给表起别名
SELECT cust_name, cust_contact
FROM Customers AS C,
    Orders AS O,
    OrderItems AS OI
WHERE C.cust_id = O.cust_id
    AND OI.order_num = O.order_num
    AND prod_id = 'RGAN01';
# 使用子查询
SELECT cust_id, cust_name, cust_contact
FROM Customers
WHERE cust_name = (
    SELECT cust_name
    FROM Customers
    WHERE cust_contact = 'Jim Jones');
# 使用联结
# 联结比子查询的速度快
SELECT c1.cust_id, c1.cust_name, c1.cust_contact
FROM Customers AS c1, Customers AS c2
WHERE c1.cust_name = c2.cust_name
    AND c2.cust_contact = 'Jim Jones';
# 自然联结的内联结（使每个列只返回一次）
# 对一个表使用*，对其他表的列指定明确的子集
SELECT C.*, O.order_num, O.order_date,
    OI.prod_id, OI.quantity, OI.item_price
FROM Customers AS C, Orders AS O, OrderItems AS OI
WHERE C.cust_id = O.cust_id
    AND OI.order_num = O.order_num
    AND prod_id = 'RGAN01';
# 一个简单的内联结
SELECT Customers.cust_id, Orders.order_num
FROM Customers
    INNER JOIN Orders
    ON Customers.cust_id = Orders.cust_id;
# 用LEFT OUTER表示外联结（左外联结）
# 外联结包含没有关联行的那些行
SELECT Customers.cust_id, Orders.order_num
FROM Customers
    LEFT OUTER JOIN Orders
    ON Customers.cust_id = Orders.cust_id;
# 用RIGHT指出包括FORM后右边表的所有行（右外联结）
SELECT Customers.cust_id, Orders.order_num
FROM Customers
    RIGHT OUTER JOIN Orders
    ON Customers.cust_id = Orders.cust_id;
# 用FULL指定全外联结
# MySQL不支持
SELECT Customers.cust_id, Orders.order_num
FROM Customers
    FULL OUTER JOIN Orders
    ON Customers.cust_id = Orders.cust_id;
# 带聚集函数的联结
SELECT Customers.cust_id,
    COUNT(Orders.order_num) AS num_ord
FROM Customers
    INNER JOIN Orders
    ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;
# 聚集函数与外联结一起使用
SELECT Customers.cust_id,
    COUNT(Orders.order_num) AS num_ord
FROM Customers
    LEFT OUTER JOIN Orders
    ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;

/*挑战题*/
# 1
SELECT cust_name, order_num
FROM Customers
    INNER JOIN Orders
    ON Customers.cust_id = Orders.cust_id;
# 2
SELECT cust_name, order_num
FROM Customers
    LEFT OUTER JOIN Orders
    ON Customers.cust_id = Orders.cust_id;
# 3
SELECT prod_name, order_num
FROM Products
    LEFT OUTER JOIN OrderItems
    ON Products.prod_id = OrderItems.prod_id
ORDER BY Products.prod_id;
# 4
SELECT prod_name, COUNT(order_num)
FROM Products
    LEFT OUTER JOIN OrderItems
    ON Products.prod_id = OrderItems.prod_id
GROUP BY prod_name
ORDER BY prod_name;
# 5
SELECT Vendors.vend_id, 
    COUNT(Products.prod_id)
FROM Vendors
    LEFT OUTER JOIN Products
    ON Vendors.vend_id = Products.vend_id
GROUP BY Vendors.vend_id