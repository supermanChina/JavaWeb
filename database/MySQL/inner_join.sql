USE w3cschool;

SELECT orders.orderid, customers.customerName FROM orders,customers WHERE orders.customerIdRef=customers.customerId;

/* INNER JOIN */
SELECT orders.`orderid` ,customers.`customerName` FROM orders INNER JOIN customers ON orders.`customerIdRef`=customers.`customerId`

SELECT orders.orderid, customers.customerName, orders.orderDate FROM orders INNER JOIN customers ON orders.customerIdRef=customers.customerId
/*符合条件的所有orders和customers列都被列出 */
SELECT * FROM orders INNER JOIN customers ON orders.`customerIdRef`=customers.`customerId`

/* 左连接从左表(A)产生一套完整的记录,与匹配的记录(右表(B)) .如果没有匹配,右侧将包含null。 */
SELECT * FROM orders LEFT JOIN customers ON orders.`customerIdRef`=customers.`customerId`
