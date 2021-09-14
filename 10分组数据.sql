/*分组数据*/
# 用WHERE子句分组
SELECT COUNT(*) AS num_prods
FROM Products
WHERE vend_id = 'DLL01';
# 用GROUP BY子句建立分组
SELECT vend_id, COUNT(*) AS num_prods
FROM Products
GROUP BY vend_id;
# HAVING过滤分组（功能等同于WHERE）
# WHERE在数据分组前过滤，HAVING在之后
SELECT cust_id, COUNT(*) AS orders
FROM Orders
GROUP BY cust_id
HAVING COUNT(*) >= 2;
# HAVING和WHERE联合使用
SELECT vend_id, COUNT(*) AS num_prods
FROM Products
WHERE prod_price >= 4
GROUP BY vend_id
HAVING COUNT(*) >= 2;
# 不用WHERE，与上述语句对比
SELECT vend_id, COUNT(*) AS num_prods
FROM Products
GROUP BY vend_id
HAVING COUNT(*) >= 2;
# 输出结果通常是有序的，但不是SQL规范
# 通常排序的时候不能仅依靠GROUP BY的自动排序功能
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3;
# GROUP BY配合ORDER BY使用
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY items, order_num;

/*挑战题*/
# 1
SELECT order_num, COUNT(*) AS order_lines
FROM OrderItems
GROUP BY order_num
ORDER BY order_lines;
# 2
SELECT vend_id, MIN(prod_price) AS cheapest_item
FROM Products
GROUP BY vend_id
ORDER BY cheapest_item;
# 3
SELECT order_num
FROM OrderItems
GROUP BY order_num
HAVING SUM(quantity) >= 100
ORDER BY order_num;
# 4
SELECT order_num, 
    SUM(item_price*quantity) AS total_price
FROM OrderItems
GROUP BY order_num
HAVING total_price >= 1000
ORDER BY order_num;
# 5
# GROUP BY 项不正确。 GROUP BY 必须是实际的列，
# 而不是用于执行聚合计算的列。
# GROUP BY order_num 将被允许。
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY items, order_num;