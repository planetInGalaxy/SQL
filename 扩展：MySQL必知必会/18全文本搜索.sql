/*全文本搜索*/
/*
InnoDB不支持全文本搜索，MyISAM支持
全文本操作符：
+ 包含，词必须存在
- 排除，词必须不出现
> 包含，且增加等级值
< 包含，且减少等级值
() 把词组成子表达式（允许这些子表达式作为一个组被包含，
排除，排列等）
~ 取消一个词的排序值
* 词尾的通配符
"" 定义一个短语
*/
# 启用全文本搜索支持
CREATE TABLE productnotes
(
    note_id int NOT NULL AUTO_INCREMENT,
    prod_id char(10) NOT NULL,
    note_date datetime NOT NULL,
    note_text text NULL,
    PRIMARY KEY(note_id),
    FULLTEXT(note_text)
) ENGINE=MyISAM;
# 进行全文本搜索
# 除非使用BINARY方式，否则不区分大小写
SELECT note_text
From productnotes
WHERE Match(note_text) Against('rabbit');
# LIKE写法
SELECT note_text
FROM productnotes
WHERE note_text LIKE '%rabbit%';
# 全文本搜索根据优先级排序
SELECT note_text,
    Match(note_text) Against('rabbit') AS rank
FROM productnotes;
# 没有查询扩展的全文本搜索
SELECT note_text
FROM productnotes
WHERE Match(note_text) Against('anvils');
# 使用了查询扩展的全文本搜索
SELECT note_text
FROM productnotes
WHERE Match(note_text) 
    Against('anvils' WITH QUERY EXPANSION);
# 布尔文本搜索（未使用操作符和普通文本搜索一样）
SELECT note_text
FROM productnotes
WHERE Match(note_text) 
    Against('heavy' IN BOOLEAN MODE);
# 布尔文本搜索
SELECT note_text
FROM productnotes
WHERE Match(note_text) 
    Against('+rabbit +bait' IN BOOLEAN MODE);
# 略
