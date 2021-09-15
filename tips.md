<!--
 * @Description: 
 * @Author: Tjg
 * @Date: 2021-09-13 19:46:41
 * @LastEditTime: 2021-09-15 17:20:10
 * @LastEditors: Please set LastEditors
-->
·SELECT子句顺序：
    SELECT
    DISTINCT
    AS
    FROM
    INNER JOIN/LEFT OUTER JOIN/RIGHT OUTER JOIN
    ON
    WHERE
    LIKE
    GROUP BY
    HAVING
    ORDER BY
    LIMIT OFFSET

·MySQL中特别的部分：
    无法使用[]通配符
    必须使用Concat函数，而不能使用+,||等符合拼接值
    字符串函数：
        子串：SUBSTRING()
    日期函数：
        获取当前日期：CURDATE()
        查找符合条件的日期：EXTRACT()
        提取年份：YEAR()
    联结：
        不支持FULL OUTER JOIN

·如何测试：
    SELECT语句去掉FROM后就是简单地访问和处理表达式，可以
根据需要，用SELECT进行测试。