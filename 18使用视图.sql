/*使用视图*/
/*
视图是虚拟的表，本身不包含数据，是查看存储在别处数据的方式
视图作用：
重用SQL语句
简化复杂的SQL操作
使用表的一部分而不是整个表
保护数据
更改数据格式和表示
*/
# 用SELECT需要从三个表中检索
SELECT cust_name, cust_contact
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
    AND OrderItems.order_num = Orders.order_num
    AND prod_id = 'RGAN01';

# 创建视图以简化复杂联结
CREATE VIEW ProductCustomers AS
SELECT cust_name, cust_contact, prod_id
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
    AND OrderItems.order_num = Orders.order_num;
# 用视图取代三个表进行检索
# 视图内和传递给视图的WHERE将自动合并
SELECT cust_name, cust_contact
FROM ProductCustomers
WHERE prod_id = 'RGAN01';
# 组合计算(MySQl格式)
SELECT CONCAT(RTRIM(vend_name), ' (', 
    RTRIM(vend_country), ')') 
    AS vend_title
FROM Vendors
ORDER BY vend_name;
# 创建视图，将检索出来的数据格式化为视图(MySQl格式)
CREATE VIEW VendorLocations AS 
SELECT CONCAT(RTRIM(vend_name), ' (', 
    RTRIM(vend_country), ')')
FROM vendors;
# 直接从视图中检索
SELECT * FROM VendorLocations;
# 用视图过滤不想要的数据
CREATE ViEW CustomerEMailList AS
SELECT cust_id, cust_name, cust_email
FROM Customers
WHERE cust_email IS NOT NULL;
# 直接从视图中检索
SELECT * FROM CustomerEMailList;
# 计算字段
SELECT prod_id
    quantity,
    item_price,
    quantity*item_price AS expanded_price
FROM OrderItems
WHERE order_num = 20008;
# 创建计算字段视图
CREATE VIEW OrderItemsExpanded AS
SELECT order_num,
    prod_id,
    quantity,
    item_price,
    quantity*item_price AS expanded_price
FROM OrderItems;
# 直接从视图中检索
SELECT * 
FROM OrderItemsExpanded 
WHERE order_num = 20008;

/*挑战题*/
# 1
CREATE VIEW CustomersWithOrders AS
SELECT Customers.cust_id,
       Customers.cust_name,
       Customers.cust_address,
       Customers.cust_city,
       Customers.cust_state,
       Customers.cust_zip,
       Customers.cust_country,
       Customers.cust_contact,
       Customers.cust_email
FROM Customers
JOIN Orders ON Customers.cust_id = Orders.cust_id;
SELECT * FROM CustomersWithOrders;
# 2
# 视图中不允许 ORDER BY。视图就像表一样使用，
# 如果需要排序数据，需要在从视图中检索数据的 SELECT 
# 中使用 ORDER BY。
CREATE VIEW OrderItemsExpanded AS
SELECT order_num,
    prod_id,
    quantity,
    item_price,
    quantity*item_price AS expanded_price
FROM OrderItems;