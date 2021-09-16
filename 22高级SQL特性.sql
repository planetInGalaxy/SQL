/*高级SQL特性*/
/*
约束（constraint）：管理如何插入或处理数据库数据的规则
主键：主键是种特殊的约束，用来保证一（组）列中的值是唯一的
主键条件：
任意两行的主键值不同
每行都有一个主键值（不允许NULL）
包含主键值的列从不修改或更新
外键：外键是表中的一列，其值必须在另一个表的主键中,
外键可以保证引用完整性，防止意外删除（级联删除除外）
唯一约束：用来保证一（组）列中的数据是唯一的，类似主键
与主键的区别：
表可包含多个唯一约束，但每个表值允许一个主键
唯一约束列可包含NULL值
唯一约束列可修改或更新
唯一约束列可重复使用
唯一约束不能用来定义外键
索引：用来排序数据以加快搜索和排序操作的速度，
主键数据总是排序的，因此按主键检索行很高效，
其他列通常不是有序的，需要建立索引
索引特点：
索引改善检索操作的性能，但降低了数据插入，修改和删除的性能
索引数据可能要占用大量的存储空间
并非所有数据都适合做索引（值不多的）
索引用于数据过滤和数据排序
可以在索引中定义多个列
索引必须唯一命名
触发器：是种特殊的存储过程，在特定的数据库活动发生时自动执行
触发器和特定表上的INSERT，UPDATE，DELETE（组合）操作相关联
常见用途：
保证数据格式一致
基于某个表的变动，在其它表上执行活动
进行额外的验证并根据需要回退数据
计算计算列的值或更新时间戳
*/
# 定义主键（创建表时定义）
CREATE TABLE Vendors
(
    vend_id CHAR(10) NOT NULL PRIMARY KEY,
    vend_name CHAR(50) NOT NULL,
    vend_address CHAR(50) DEFAULT NULL,
    vend_city CHAR(50) DEFAULT NULL,
    vend_state CHAR(5) DEFAULT NULL,
    vend_zip CHAR(10) DEFAULT NULL,
    vend_country CHAR(50) DEFAULT NULL,
    vend_web CHAR(100) DEFAULT NULL
);
# 定义主键（用CONSTRAINT给某列添加主键）
ALTER TABLE Vendors
ADD CONSTRAINT PRIMARY KEY (vend_id);
# 定义外键（创建表时定义）
CREATE TABLE Orders
(
    order_num INTEGER NOT NULL PRIMARY KEY,
    order_date DATATIME NOT NULL,
    cust_id CHAR(10) NOT NULL 
        REFERENCES Customers(cust_id)
);
# 定义外键（用CONSTRAINT给某列添加外键）
ALTER TABLE Orders
ADD CONSTRAINT
FOREIGN KEY (cust_id) REFERENCES Customers (cust_id);
# 定义检查约束（创建表时定义）
CREATE TABLE OrderItems
(
    order_num INTEGER NOT NULL,
    order_item INTEGER NOT NULL,
    prod_id CHAR(10) NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 10),
    item_price MONEY NOT NULL
);
# 定义检查约束（用CONSTRAINT给某列添加外键）
ALTER TABLE Table
ADD CONSTRAINT CHECK (gender LIKE '[MF]');
# 创建索引
CREATE INDEX prod_name_id
ON Products (prod_name);
# 创建触发器（SQLServer）
CREATE TRIGGER customer_state
ON Customers
FOR INSERT, UPDATE
AS
UPDATE Customers
SET cust_state = Upper(cust_state)
WHERE Customers.cust_id = inserted.cust_id;
# 创建触发器（Oracle）
CREATE TRIGGER customer_state
AFTER INSERT OR UPDATE
FOR EACH ROW
BEGIN
UPDATE Customers
SET cust_state = Upper(cust_state)
WHERE Customers.cust_id = inserted.cust_id
END;
