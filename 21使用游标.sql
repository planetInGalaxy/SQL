/*使用游标*/
/*
游标是一个存储字啊DBMS服务器上的数据库查询，
而不是SELECt语句，而是杯盖语句检索出的结果集。
结果集：SQL查询所检索出的结果
*/

# 创建游标(MySQL)
DECLARE CustCursor CURSOR
FOR
SELECT * FROM Customers
WHERE cust_email IS NULL;
# Oracle版本
DECLARE CURSOR CustCursor
IS
SELECT * FROM Customers
WHERE cust_email IS NULL;
# 打开游标
OPEN CURSOR CustCursor;
# 一个完整的例子，在游标中检索第一行（Oracle）
# FETCH指出从何处检索并放到后面的声明变量中
DECLARE TYPE CustCusor IS REF CURSOR
    RETURN Customers%ROWTYPE
DECLARE CustRecord Customers%ROWTYPE
BEGIN
    OPEN CustCursor
    FETCH CustCursor INTO CustRecord
    CLOSE CustCursor
END;
# 用游标对检索出的数据进行遍历
DECLARE TYPE CustCusor IS REF CURSOR
    RETURN CUStomer%ROWTYPE
DECLARE CustRecord Customers%ROWTYPE
BEGIN
    OPEN CustCursor
    LOOP
    FETCH CustCursor INTO CustRecord
    EXIT WHEN CustCursor%NOTFOUND
    ...
    END LOOP
    CLOSE CustCursor
END;
# SQLServer的例子 略

# 关闭游标
CLOSE CustCursor;
# SQLServer版本
CLOSE CustCursor
DEALLOCATE CURSOR CustCursor;
