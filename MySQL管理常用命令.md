<!--

 * @Description: 
 * @Author: Tjg
 * @Date: 2021-09-16 20:48:53
 * @LastEditTime: 2021-09-17 15:39:43
 * @LastEditors: Please set LastEditors
-->

## MySQL常用命令

- 登录
   - mysql -u root -p
- 列出数据库
   - show databases
- 选择数据库
   - use <数据库名>
- 查看表
   - show tables
- 查看表列
   - show columns from <表名>
   - describe <表名>
- 查看创建视图的语句
   - show create view <视图名>
- 显示服务器状态信息
   - show status
- 显示所有用户账号
   - use mysql; select user from user
