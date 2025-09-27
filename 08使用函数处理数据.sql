/*使用含税处理数据*/
/*
常用的文本处理函数：
LEFT() 返回字符串左边的字符
RIGHT() 返回字符串右边的字符
LENGTH()/DATELENGTH()/LEN() 返回字符串的长度
LOWER() 返回字符串的小写形式
UPPER() 返回字符串的大写形式
LTRIM() 返回字符串去掉左边空格的部分
RTRIM() 返回字符串去掉右边空格的部分
SUBSTR()/SUBSTRING() 返回子字符串
SOUNDEX() 返回字符串的SOUNDEX值（字符串发音算法）
常用的数值处理函数：
ABS() 返回一个数的绝对值
SIN() 返回一个角度的正弦
COS() 返回一个角度的余弦
TAN() 返回一个角度的正切
EXP() 返回一个数的指数值
PI() 返回圆周率pi的值
SQRT() 返回一个数的平方根
*/
# UPPER函数将文本转换为大写,LOWER函数将文本转换为小写
SELECT vend_name, 
    UPPER(vend_name) AS vend_name_upcase
FROM Vendors
ORDER BY vend_name;
# LENGTH函数计算文本的长度
SELECT vend_name, 
    LENGTH(vend_name) AS vend_name_length
FROM Vendors
ORDER BY vend_name_length;
# LEFT函数返回字符串左边的字符 RIGHT函数返回字符串右边的字符
SELECT vend_name, 
    LEFT(vend_name, 2) AS vend_name_left
FROM Vendors
ORDER BY vend_name_left;
# Oracle,MySQL中的日期查找函数
SELECT order_num
FROM Orders
WHERE EXTRACT(year FROM order_date) = 2020;
# MySQL中的YEAR函数，提取年份
SELECT order_num
FROM Orders
WHERE YEAR(order_date) = '2020';

# 用DATEPART查找符合某一条件的日期
# MySQL不支持
SELECT order_num
FROM Orders
WHERE DATEPART(yy, order_date) = 2020;
# 也可以用BETWEEN操作符完成上述的日期匹配
# MySQL，SQL Server不支持to_date
SELECT order_num
FROM Orders
WHERE order_date 
BETWEEN to_date('2020-01-02', 'yyyy-mm-dd')
AND to_date('2020-12-31', 'yyyy-mm-dd');
# SQLite中的小技巧
SELECT order_num
FROM Orders
WHERE strftime('%Y', order_date) = '2020';
# 不用SOUNDEX函数查找顾客
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_contact = 'Michael Green';
# 用SOUNDEX函数找到发音相近的顾客
SELECT cust_name, cust_contact
FROM Customers
WHERE SOUNDEX(cust_contact) = SOUNDEX('Michael Green');

/*挑战题*/
# 1
-- MySQL
SELECT cust_id, cust_name,
        CONCAT(UPPER(LEFT(cust_contact, 2)), 
        UPPER(LEFT(cust_city, 3))) AS user_login
FROM customers;
-- DB2, PostgreSQL
SELECT cust_id, cust_name,
        UPPER(LEFT(cust_contact, 2)) 
        || UPPER(LEFT(cust_city, 3)) AS user_login
FROM customers;
-- Oracle, SQLite
SELECT cust_id, cust_name,
        UPPER(SUBSTR(cust_contact, 1, 2)) 
        || UPPER(SUBSTR(cust_city, 1, 3)) 
        AS user_login
 FROM customers;
-- SQL Server
SELECT cust_id, cust_name,
        UPPER(LEFT(cust_contact, 2)) 
        + UPPER(LEFT(cust_city, 3)) AS user_login
FROM customers;
# 2
-- MySQL, DB2, MariaDB
SELECT order_num, order_date
FROM Orders
WHERE YEAR(order_date) = 2020 
    AND MONTH(order_date) = 1
ORDER BY order_date;
-- Oracle, PostgreSQL
SELECT order_num, order_date
FROM Orders
WHERE EXTRACT(year FROM order_date) = 2020 
    AND EXTRACT(month FROM order_date) = 1
ORDER BY order_date;
-- PostgreSQL
SELECT order_num, order_date
FROM Orders
WHERE DATE_PART('year', order_date) = 2020 
    AND DATE_PART('month', order_date) = 1
ORDER BY order_num;
-- SQL Server
SELECT order_num, order_date
FROM Orders
WHERE DATEPART(yy, order_date) = 2020 
    AND DATEPART(mm, order_date) = 1
ORDER BY order_date;
-- SQLite
SELECT order_num
FROM Orders
WHERE strftime('%Y', order_date) = '2020' 
    AND strftime('%m', order_date) = '01';
