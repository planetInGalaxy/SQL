/*管理事务处理*/
# 事务开始和回退
# 不能回退SELECT,CREATE,DROP
SELECT * FROM ordertotals
START TRANSACTION
DELETE FROM ordertotals
SELECT * FROM ordertotals
ROLLBACK
SELECT * FROM ordertotals;
# 用COMMIT明确提交事务
# 当ROLLBACK和COMMIT语句执行后，事务自动关闭
START TRANSACTION
DELETE FROM orderitems WHERE order_num = 20010
DELETE FROM orders WHERE order_num = 20010
COMMIT;
# 使用保留点
# 保留点在事务处理完成后自动释放
# 也可以使用RELEASE SAVEPOINT明确释放
SAVEPOINT delete1;
ROLLBACK TO delete1;
# 更改默认的提交行为，使其不自动提交
SET autocommit=0;