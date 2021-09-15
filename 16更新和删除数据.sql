/*更新和删除数据*/
/*
更新的两种方式：
更新表中的特定行
更新表中的所有行
删除的两种方式：
从表中删去特定行
从表中删去所有行
更新和删除的指导原则：
尽量不使用不带WHERE的UPDATE和DELETE语句
保证每个表都有主键
在执行操作前，先用SELECT保证过滤的是正确的记录
使用强制实施引用完整性的数据库，防止删除与其他表关联的行
使用防止执行不带WHERE子句的UPDATE和DELETE语句的约束
*/
# 用UPDATE和SET更新表中的特定行
UPDATE Customers
SET cust_email = 'kim@therystore.com'
WHERE cust_id = 1000000005;
# 更新多个列
UPDATE Customers
SET cust_contact = 'Sam Roberts',
    cust_email = 'sam@toyland.com'
WHERE cust_id = 1000000006;
# 删除某个值可以把它设为NULL
UPDATE Customers
SET cust_email = NULL
WHERE cust_id = 1000000005;
# 用DELETE删除一行数据
# FROM关键字是可选的
# 如果是删除表中所有行，用TRUNCATE TABLE
DELETE FROM Customers
WHERE cust_id = 1000000006;

/*挑战题*/
# 1
UPDATE Vendors
SET vend_state = UPPER(vend_state)
WHERE vend_country = 'USA';
UPDATE Customers
SET cust_state = UPPER(cust_state)
WHERE cust_country = 'USA';
# 2
-- First test the WHERE to make sure it selects only what you want to delete
SELECT * FROM Customers
WHERE cust_id = 1000000007;
-- Then do it!
DELETE FROM Customers
WHERE cust_id = 1000000007;