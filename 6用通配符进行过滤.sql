/*用通配符进行过滤*/
/*
通配符：用来匹配值的一部分的特殊字符
搜索模式：由字面值，通配符或两者组合构成的搜索条件
可以利用通配符创建比较特定数据的搜索模式
不应过度使用通配符，使用时尽量不要放在前面
*/

# %通配符表示任何字符出现任意次(包括0次)
# 需要使用LIKE谓词来连接
# 不能匹配NULL
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE 'FISH%';
# 两端都用%的情况
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE '%bean bag%';
# %在中间的情况
SELECT prod_name
FROM Products
WHERE prod_name LIKE 'F%Y';
# _通配符匹配单个字符
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE '__ inch teddy bear';
# %与_的区别
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE '% inch teddy bear';
# []通配符
# MySQL不支持
SELECT cust_contact
FROM Customers
WHERE cust_contact LIKE '[JM]%'
ORDER BY cust_contact;
# 用^通配符来否定[]通配符
SELECT cust_contact
FROM Customers
WHERE cust_contact LIKE '[^JM]%'
ORDER BY cust_contact;
# 上述语句的等价写法
SELECT cust_contact
FROM Customers
WHERE NOT cust_contact LIKE '[JM]%'
ORDER BY cust_contact;

/*挑战题*/
# 1
SELECT prod_name, prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%';
# 2
SELECT prod_name, prod_desc
FROM Products
WHERE NOT prod_desc LIKE '%toy%'
ORDER BY prod_name;
# 3
SELECT prod_name, prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%' 
    AND prod_desc LIKE '%carrots%';
# 4
SELECT prod_name, prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%carrots%';