/*使用游标*/
# 在函数和存储过程中使用游标
DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
    # 创建游标
    DECLARE ordernumbers CURSOR
    FOR
    SELECT order_num FROM orders;
    # 打开游标
    OPEN ordernumbers;
    # 关闭游标
    CLOSE ordernumbers;
END //
DELIMITER ;

# 从游标中检索单个行
DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
    # 声明一个本地变量
    DECLARE o INT;
    # 创建游标
    DECLARE ordernumbers CURSOR
    FOR
    SELECT order_num FROM orders;
    # 打开游标
    OPEN ordernumbers;
    # 用游标获取单个行
    FETCH ordernumbers INTO o;
    # 关闭游标
    CLOSE ordernumbers;
END //
DELIMITER ;

# 从游标中循环检索数据
DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
    # 声明两个本地变量
    DECLARE done BOOLEAN DEFAULT 0;
    DECLARE o INT;
    # 创建游标
    DECLARE ordernumbers CURSOR
    FOR
    SELECT order_num FROM orders;
    # 声明一个循环控制器(SQLSTATE出现时循环结束)
    DECLARE CONTINUE HANDLER FOR 
        SQLSTATE '02000' SET done=1; 
    # 打开游标
    OPEN ordernumbers;
    # 用REPEAT执行循环
    REPEAT
        # 用游标获取单个行
        FETCH ordernumbers INTO o;
    # 循环结束
    UNTIL done END REPEAT;
    # 关闭游标
    CLOSE ordernumbers;

END //
DELIMITER ;

# 完整样例
DELIMITER //
CREATE PROCEDURE processorders()
BEGIN
    # 声明两个本地变量
    DECLARE done BOOLEAN DEFAULT 0;
    DECLARE o INT;
    DECLARE t DECIMAL(8, 2);
    # 创建游标
    DECLARE ordernumbers CURSOR
    FOR
    SELECT order_num FROM orders;
    # 声明一个循环控制器(SQLSTATE出现时循环结束)
    DECLARE CONTINUE HANDLER FOR 
        SQLSTATE '02000' SET done=1; 
    # 创建一个新表
    CREATE TABLE IF NOT EXISIT ordertotals
        (order_num INT, total DECIMAL(8,2));
    # 打开游标
    OPEN ordernumbers;
    # 用REPEAT执行循环
    REPEAT
        # 用游标获取单个行并存到变量o中
        FETCH ordernumbers INTO o;
        # 略
    # 循环结束
    UNTIL done END REPEAT;
    # 关闭游标
    CLOSE ordernumbers;
END //
DELIMITER ;