/*使用存储过程*/
/*
变量：内存中一个特定的位置，用来临时存储数据
MySQL中的变量都必须以@开始
*/
# 创建存储过程
DELIMITER //
CREATE PROCEDURE productpricing()
BEGIN
    SELECT Avg(prod_price) AS priceaverage
    FROM products;
END //
DELIMITER ;
# 调用上述存储过程
CALL productpricing();
# 删除存储过程
DROP PROCEDURE productpricing;
# 有输出变量的存储过程
DELIMITER //
CREATE PROCEDURE productpricing(
    OUT pl DECIMAL(8,2),
    OUT PH DECIMAL(8,2),
    OUT pa DECIMAL(8,2)
)
BEGAIN
    SELECT Min(prod_price)
    INTO p1
    FROM products;
    SELECT Max(prod_price)
    INTO ph
    FROM products;
    SELECT Avg(prod_price)
    INTO pa
    FROM products;
END //
DELIMITER ;
# 执行存储过程
# 必须指定三个变量名
CALL productpricing(
    @pricelow,
    @pricehigh,
    @priceaverage
);
# 显示检索出的平均价格
SELECT @priceaverage;
# 显示三个值
SELECT @pricelow, @pricehigh, @priceaverage;
# 有输入输出变量的存储过程
DELIMITER //
CREATE PROCEDURE ordertotal(
    IN onumber INT,
    OUT ototal DECIMAL(8,2)
)
BEGIN
SELECT Sum(item_price*quantity)
FROM orderitems
WHERE order_num = onumber
INTO ototal;
END //
DELIMITER ;
# 调用上述存储过程
CALL ordertotal(20005, @total);
SELECT @total;
# 另外一个订单的合计
CALL ordertotal(20009, @total);
# 显示
SELECT @total;
# 建立智能存储过程 略
# 检查存储过程
SHOW CREATE PROCEDURE ordertotal;