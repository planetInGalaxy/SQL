/*管理用户*/
/*
访问权限层次：
整个服务器：GRANT ALL 和REVOKE ALL
整个数据库： ON <数据库名>.*
特定的表： ON <数据库名>.<表名>
特定的列
特定的存储过程
*/

# 显示用户账号列表
USE mysql;
SELECT user FROM user;
# 创建一个新用户账号
CREATE USER ben IDENTIFIED BY 'p@$$wOrd';
# 重命名用户账号
RENAME USER ben TO bforta;
# 查看访问权限
SHOW GRANTS FOR bforta;
# 用GRANT赋予其在c数据库所有表上的检索权限
GRANT SELECT ON crashcourse.* TO bforta;
# 用REVOKE撤销撤销特定的权限
REVOKE SELECT ON crashcourse.* FROM bforta;
# 更改用户口令
SET PASSWORD FOR bforta = Password('n3w p@$$wOrd');
# 设置自己的口令
SET PASSWORD = Password('admin123456');
# 删除用户
DROP USER bforta;