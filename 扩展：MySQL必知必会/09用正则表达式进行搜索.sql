/*用正则表达式进行搜索*/
/*
LIKE与REGEXP的区别：
LIKE匹配整个列，REGEXP在列值内匹配
*/
#基本字符匹配
SELECT prod_name
FROM products
WHERE prod_name REGEXP '1000'
ORDER BY prod_name;
# .匹配任意一个字符
SELECT prod_name
FROM products
WHERE prod_name REGEXP '.000'
ORDER BY prod_name;
# 用|进行OR匹配
SELECT prod_name
FROM products
WHERE prod_name REGEXP '1000|2000';
# 用集合[]匹配几个字符之一
SELECT prod_name
FROM products
WHERE prod_name REGEXP '[123] Ton'
ORDER BY prod_name;
# 用集合定义匹配范围
SELECT prod_name
FROM products
WHERE prod_name REGEXP '[1-5] Ton'
ORDER BY prod_name;
# 匹配特殊字符失败的情况
SELECT vend_name
FROM vendors
WHERE vend_name REGEXP '.'
ORDER BY vend_name;
# 用转义字符\\匹配特殊字符
SELECT vend_name
FROM vendors
WHERE vend_name REGEXP '\\.'
ORDER BY vend_name;
# 用?匹配0或1个实例
SELECT prod_name
FROM products
WHERE prod_name REGEXP '\\([0-9] sticks?\\)'
ORDER BY prod_name;
# 用{n}匹配n个实例
SELECT prod_name
FROM products
WHERE prod_name REGEXP '[[:digit:]]{4}'
ORDER BY prod_name;
# 另一种写法
SELECT prod_name
FROM products
WHERE prod_name REGEXP '[0-9][0-9][0-9][0-9]'
ORDER BY prod_name;
# ^和$定位符表示一行（或文本）的开头和结尾
SELECT prod_name
FROM products
WHERE prod_name REGEXP '^[0-9\\.]'
ORDER BY prod_name;
