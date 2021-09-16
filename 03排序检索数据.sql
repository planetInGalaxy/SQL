/*排序检索数据*/
# ORDER BY 应放在最后，可以用非检索列来排序
# 默认升序（ASC）
# 通常不区分大小写
SELECT prod_name
FROM Products
ORDER BY prod_name;
# 用多个列进行排序
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price, prod_name;
# 用数字指定列的位置（而不是名称）来排序
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY 2, 3;
# DESC 指定排序方向是降序（默认是升序ASC）
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price DESC;
# 部分升序，部分降序（DESC只应用到前面的列名）
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price DESC, prod_name;

/*挑战题*/
# 1
SELECT cust_name
FROM Customers
ORDER BY cust_name DESC;
# 2
SELECT cust_id, order_num
FROM Orders
ORDER BY cust_id, order_date DESC; 
# 3
SELECT order_num, item_price
FROM OrderItems
ORDER BY order_num DESC, item_price DESC;
# 4
# There should not be a comma after vend_name 
# (a comma is only used to separate multiple 
# columns), and BY is missing after ORDER.
SELECT vend_name
FROM Vendors
ORDER BY vend_name DESC;