/*创建和操纵表*/
/*
创建表的两种方式：
用DBMS的交互式创建和管理数据库表的工具
直接用SQL操纵
MySQL重命名表用RENAME
*/
# 用CREATE TABLE创建表
# 不能覆盖表，只能先删除，再创建
CREATE TABLE Products
(
    prod_id CHAR(10) NOT NULL,
    vend_id CHAR(10) NOT NULL,
    prod_name CHAR(254) NOT NULL,
    prod_price DECIMAL(8,2) NOT NULL,
    prod_desc VARCHAR(1000) NULL
);
# 为每列设置NULL或是NOT NULL
# 不指定的时候默认为NULL
CREATE TABLE Orders
(
    order_num INTEGER NOT NULL,
    order_date DATETIME NOT NULL,
    cust_id CHAR(10) NOT NULL
);
# 用DEFAULT指定默认值
# 默认值经常用于日期或时间，MySQL中的是CURRENT_DATE()
CREATE TABLE OrderItems
(
    order_num INTEGER NOT NULL,
    order_item INTEGER NOT NULL,
    prod_id CHAR(10) NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    item_price DECIMAL(8,2) NOT NULL
);
# 用ALTER TABLE配合ADD添加新的字段
ALTER TABLE Vendors
ADD vend_phone CHAR(20);
# 用ALTER TABLE配合DROP删除字段
ALTER TABLE Vendors
DROP COLUMN vend_phone;
# 用DROP直接删除表
DROP TABLE CustCopy;

/*挑战题*/
# 1
ALTER TABLE Vendors
ADD vend_web CHAR(100);
# 2
UPDATE Vendors
SET vend_web = 'https://google.com/'
WHERE vend_id = 'DLL01';