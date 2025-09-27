/*创建计算字段*/
/*
字段：概念与列基本相同，主要用于计算字段这一术语中
拼接：将值联结到一起（一个附加到另一个）构成单个值
由于存储在数据库表中的数据一般不是应用程序可以直接拿来
使用的格式，使用前需要先转换，计算或者格式化，这时候
需要用到计算字段
SQL中支持的算术操作符： + - * /
*/

# 用+完成拼接操作
# MySQL不支持
SELECT vend_name + '(' + vend_country + ')'
FROM Vendors
ORDER BY vend_name;
# 用||完成拼接操作
# MySQL不支持
SELECT vend_name || '(' || vend_country || ')'
FROM Vendors
ORDER BY vend_name;
# 用Concat函数完成拼接操作
### MySQL支持 
SELECT Concat(vend_name, ' (', vend_country, ')')
FROM Vendors
ORDER BY vend_name;
# 用RTRIM函数去除冗余的空格
SELECT RTRIM(vend_name) + ' (' 
    + RTRIM(vend_country) + ')'
FROM Vendors
ORDER BY vend_name;
# 同上，但使用的是||
SELECT RTRIM(vend_name) || ' (' 
    || RTRIM(vend_country) || ')'
FROM Vendors
ORDER BY vend_name;
# 用AS指定计算字段的别名
# 别名既可以是一个单词，也可以是一个字符串
# 别名也叫导出列
# 别名也可以用于区别混淆，以及消除不合法名称
SELECT RTRIM(vend_name) + ' (' 
    + RTRIM(vend_country) + ')'
AS vend_title
FROM Vendors
ORDER BY vend_name;
# 同上，但使用的是||
SELECT RTRIM(vend_name) || ' (' 
    || RTRIM(vend_country) || ')'
AS vend_title
FROM Vendors
ORDER BY vend_name;
### MySQL和MariaDB中的语法
SELECT Concat(LOWER(vend_name), ' (', 
    UPPER(vend_country), ')')
AS vend_title
FROM Vendors
ORDER BY vend_name;
# 仅检索
SELECT prod_id, quantity, item_price
FROM OrderItems
WHERE order_num = 20008;
# 检索出来并执行算术运算和取别名
SELECT prod_id, 
    quantity, 
    item_price,
    quantity*item_price AS expanded_price
FROM OrderItems
WHERE order_num = 20008;

/*挑战题*/
# 1
SELECT vend_id,
    vend_name AS vname,
    vend_address AS vaddress,
    vend_city AS vcity
FROM Vendors
ORDER BY vname;
# 2
SELECT prod_id, 
    prod_price, 
    prod_price*0.9 AS sale_price
FROM Products;
