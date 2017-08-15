# MySQL Join
## INNER Join(交集)
内连接(等值连接)：在表中存在至少一个匹配时返回行。  
*INNER JOIN与JOIN相同*  
```
SELECT column_name(s)
FROM table1
INNER JOIN table2
 ON table1.column_name=table2.column_name;
```

## LEFT Join
左连接：从左表（table1）返回所有的行，即使右表（table2）中没有匹配。如果右表中没有匹配，则结果为 NULL。  
*某些数据库中使用LEFT OUTER JOIN与此LEFT JOIN语义相同*  
```
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name=table2.column_name;
```
## RIGHT Join
右连接：从右表（table2）返回所有的行，即使左表（table1）中没有匹配。如果左表中没有匹配，则结果为 NULL。  
*某些数据库中使用RIGHT OUTER JOIN与此RIGHT JOIN语义相同*  
```
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name=table2.column_name;
```
## FULL Join
全连接：只要其中一个表中存在匹配，则返回行  
*注：MySQL不支持FULL Join，不过可以通过UNION关键字来合并LEFT JOIN和RIGHT JOIN结果来模拟FULL JOIN。*