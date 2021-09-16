/*高级数据过滤*/
# 用AND操作符组合过滤子句（逻辑中的与）
SELECT prod_id, prod_price, prod_name
FROM Products
WHERE vend_id = 'DLL01' AND prod_price <= 4;
# 用OR操作符组合过滤子句（逻辑中的或）
SELECT prod_id, prod_price, prod_name
FROM Products
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01';
# 混合使用AND和OR 
# 优先级：AND > OR
# ()能改变优先级
SELECT prod_name, prod_price
FROM Products
WHERE (vend_id = 'DLL01' or vend_id = 'BRS01')
    AND prod_price >= 10;
# 用IN操作符匹配括号内所有的条件
# IN内可以包含其他SELECT语句
SELECT prod_name, prod_price
FROM Products
WHERE vend_id IN ('DLL01', 'BRS01')
ORDER BY prod_name;
# NOT操作符与其他操作符组合使用，用于否定操作符
SELECT prod_name
FROM Products
WHERE NOT vend_id = 'DLL01'
ORDER BY prod_name;
# 上述的等价写法
SELECT prod_name
FROM Products
WHERE vend_id <> 'DLL01'
ORDER BY prod_name;

/*挑战题*/
# 1
SELECT vend_name
FROM Vendors
WHERE vend_country = 'USA' AND vend_state = 'CA';
# 2
SELECT order_num, prod_id, quantity
FROM OrderItems
WHERE prod_id IN ('BR01', 'BR02', 'BR03')
    AND quantity >= 100;
# 3
SELECT prod_name, prod_price
FROM Products
WHERE  prod_price >= 3 AND prod_price <= 6
ORDER BY prod_price;
# 4
# ORDER BY must came after any WHERE clause.
SELECT vend_name
FROM Vendors
WHERE vend_country = 'USA' AND vend_state = 'CA'
ORDER BY vend_name