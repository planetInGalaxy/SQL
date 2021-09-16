/*使用存储过程*/
/*
存储过程是为以后使用而保存的一条或多条SQL语句，可视为批文件
存储过程和函数区别：
函数必须有返回值，而存储过程可以没有
存储过程实现的功能要复杂一点，而函数的实现的功能针对性比较强
对于存储过程来说可以返回参数，如记录集，而函数只能返回值或者表对象
存储过程一般是作为一个独立的部分来执行（ EXECUTE 语句执行），
而函数可以作为查询语句的一个部分来调用（SELECT调用）
*/
# 执行存储过程
EXECUTE AddNewProduct(
    'JTS01',
    'stuffed Eiffel Tower',
    6.49,
    'plush ...'
# 创建存储过程
CREATE PROCEDURE MailingListCount(
    ListCount OUT INTEGER
)
IS
v_rows INTEGER
BEGIN 
    SELECT COUNT(*) INTO v_rows
    FROM Customers
    WHERE NOT cust_email IS NULL
    ListCount := v_rows
END;
);
# 调用存储过程
var ReturnValue NUMBER
EXEC MailingListCount(:ReturnValue)
SELECT ReturnValue;
# 略