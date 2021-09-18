/*使用触发器*/
/*
触发器的种类
每条INSERT，UPDATE和DELETE的之前和之后
BEFORE通常用于数据验证和净化
BEFORE失败将不执行语句
BEFORE或语句失败将不执行AFTER触发器
*/
# 创建触发器(5以后的版本不支持直接返回结果集，
# 需要存放在变量中)
CREATE TRIGGER newproduct 
    AFTER INSERT ON products FOR EACH ROW 
    SELECT 'product added' into @a ;
# 删除触发器
DROP TRIGGER newproduct;
# 返回新的自增值
# INSERT触发器可以访问NEW虚拟表
CREATE TRIGGER neworder 
    AFTER INSERT ON orders FOR EACH ROW
    SELECT NEW.order_num into @b ;
# 将要删除的值保存到另一个表中 略
# 删除触发器可以访问OLD虚拟表
# 保证列的值具有同一的格式 略
# UPDATE触发器可以访问NEW和OLD虚拟表