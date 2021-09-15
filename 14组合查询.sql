/*组合查询*/
/*
需要用到组合查询的两种情况:
在一个查询中，从不同的表返回数据结构
对一个表执行多次查询，按一个查询返回数据
UNION规则：
必须由两条或两条以上的SELECT语句组成，之间用UNION隔开
每个查询必须包含相同的列，表达式或聚集函数
（不同则返回第一个）
列数据类型必须兼容（类型不必完全相同，但要可转换）
*/
# 单条查询语句
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI');
# 单条查询语句
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';
# 用UNION组合多条查询
# 自动筛掉重复的行
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';
# 用UNION ALL取消筛选
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION ALL
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';
# 使用UNION的时候，ORDER BY必须放在最后且只能使用一次
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All'
ORDER BY cust_name, cust_contact;

/*挑战题*/
# 1
SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100
UNION
SELECT prod_id, quantity
FROM OrderItems
WHERE prod_id LIKE 'BNBG%'
ORDER BY prod_id;
# 2
SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100 OR prod_id LIKE 'BNBG%'
ORDER BY prod_id;
# 3
SELECT prod_name
FROM Products
UNION
SELECT cust_name
FROM Customers
ORDER BY prod_name;
# 4
# ；在第一个 SELECT 语句，但不应该在那里，
# 它正在终止该语句。此外，如果排序 SELECT 语句与 
# UNION 结合，则只能使用一个 ORDER BY，并且它必须
# 在最后一个 SELECT 之后。
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state  = 'MI'
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state = 'IL'
ORDER BY cust_name;