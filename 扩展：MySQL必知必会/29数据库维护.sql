/*数据库维护*/
/*
备份数据
数据库维护
诊断启动问题
查看日志文件
*/
# 检查表键是否正确
ANALYZE TABLE orders;
# 对表检查，发现和修复问题
CHECK TABLE orders, orderitems;