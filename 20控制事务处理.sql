/*控制事务处理*/
# 标识事务代码块
BRGIN TRANSACTION
...
COMMIT TRANSACTION
# MySQL的语法
START TRANSACTION
...
# PostgreSQL的语法
BEGIN
...
# 用ROLLBACK回退（撤销）SQL命令
DELETE FROM Orders;
ROLLBACK;
# 用COMMIT显式提交事务
BEGIN TRANSACTION
DELETE OrderItems WHERE order_num = 12345
DELETE orders WHERE order_num = 12345
COMMIT TRANSACTION;
# Oracle语法
SET TRANSACTION
DELETE OrderItems WHERE order_num = 12345
DELETE orders WHERE order_num = 12345
COMMIT;
# 用SAVEPOINT创建占位符（保留点）
SAVEPOINT delete1;
# SQLServer语法
SAVE TRANSACTION delete1;
# 回退到保留点(SQLServer)
ROLLBACK TRANSACTION delete;
# MySQL
ROLLBACK TO delete1;
# 完整的SQLServer例子
BEGIN TRANSACTION
INSERT INTO Customers(cust_id,cust_name)
VALUES(10000000010, 'Toys Emporium')
SAVE TRANSACTION StartOrder
INSERT INTO Orders(order_num, order_date, cust_id)
VALUES(20100, '2001/12/1', 10000000010)
IF @@ERROR <> 0 ROLLBACK TRANSACTION StartOrder
INSERT INTO OrderItems(order_num, order_item,
    prod_id, quantity, item_price)
VALUES(20100, 1, 'BR01', 100, 5.49)
IF @@ERROR <> 0 ROLLBACK TRANSACTION StartOrder
INSERT INTO OrderItems(order_num, order_item,
    prod_id, quantity, item_price)
VALUES(20100, 2, 'BR03', 100, 10.99)
IF @@ERROR <> 0 ROLLBACK TRANSACTION StartOrder
COMMIT TRANSACTION;