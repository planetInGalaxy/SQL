/*索引*/
# 创建索引
CREATE INDEX indexName ON table_name (column_name)
# 修改表结构（添加索引）
ALTER table tableName ADD INDEX indexName(columnName)
# 创建表的时候直接指定
CREATE TABLE mytable(  
    ID INT NOT NULL,   
    username VARCHAR(16) NOT NULL,  
    INDEX [indexName] (username(length))  
);  
# 删除索引
DROP INDEX [indexName] ON mytable; 

# test
SELECT * FROM products
WHERE prod_id = 'FB';
SELECT * FROM products
WHERE prod_name = 'Bird Seed';
ALTER TABLE 