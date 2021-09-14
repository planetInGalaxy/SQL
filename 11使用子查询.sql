/*使用子查询*/
/*
查询：任何SQL语句都是查询，但一般指SELECT语句
SELECT后面的字段是SELECT子查询，可以类比为for循环嵌套
*/
# 根据产品检索订单编号
SELECT order_num
FROM OrderItems
WHERE prod_id = 'RGAN01';
# 根据订单编号检索顾客ID
SELECT cust_id
FROM Orders
WHERE order_num IN (20007, 20008);
# 结合前面两个查询语句
# 子查询总是由内向外处理
# 作为子查询的SELECT只能查询单个列
SELECT cust_id
FROM Orders
WHERE order_num IN (
    SELECT order_num
    FROM OrderItems
    WHERE prod_id = 'RGAN01');
# 根据顾客ID查找顾客姓名和联系方式
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (1000000004, 1000000005);
# 组合三个查询语句
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (
    SELECT cust_id
    FROM Orders
    WHERE order_num IN (
        SELECT order_num
        FROM OrderItems
        WHERE prod_id = 'RGAN01'));
# 针对固定顾客ID进行订单数目查询
SELECT COUNT(*) AS orders
FROM Orders
WHERE cust_id = 1000000001;
# 对每个顾客进行订单数目查询
# 使用.表示完全限定列名
SELECT cust_name, cust_state, 
    (SELECT COUNT(*)
    FROM Orders
    WHERE orders.cust_id = Customers.cust_id) AS orders
FROM Customers
ORDER BY cust_name;
# 不使用完全限定列名会导致错误
SELECT cust_name, cust_state, 
    (SELECT COUNT(*)
    FROM Orders
    WHERE cust_id = cust_id) AS orders
FROM Customers
ORDER BY cust_name;

/*挑战题*/
# 1
SELECT cust_id
FROM Orders
WHERE order_num IN (
    SELECT DISTINCT order_num
    FROM OrderItems
    WHERE item_price >= 10);
# 2
SELECT cust_id, order_date
FROM Orders
WHERE order_num IN (
    SELECT order_num
    FROM OrderItems
    WHERE prod_id = 'BR01')
ORDER BY order_date;
# 3
SELECT cust_email
FROM Customers
WHERE cust_id IN (
    SELECT cust_id 
    FROM Orders
    WHERE order_num IN (
        SELECT order_num
        FROM OrderItems
        WHERE prod_id = 'BR01'));
# 4
SELECT cust_id, 
    (SELECT SUM(quantity*item_price)
    FROM OrderItems
    WHERE Orders.order_num = OrderItems.order_num) 
    AS total_ordered
FROM Orders
ORDER BY total_ordered DESC;
# 5
SELECT prod_name,
    (SELECT SUM(quantity)
    FROM OrderItems
    WHERE OrderItems.prod_id = Products.prod_id)
    AS quant_sold
FROM Products;
