/*MySQL syntax`orders`*/
USE w3cschool;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
	customerId	INT 		AUTO_INCREMENT,
	customerName	VARCHAR(50)	NOT NULL,
	contactName  	VARCHAR(50),
	country		VARCHAR(50),
	PRIMARY KEY (customerId)
);


CREATE TABLE orders(
	orderid	INTEGER NOT NULL,
	customerIdRef INTEGER NOT NULL,
	orderDate DATE NOT NULL,
	PRIMARY KEY (orderid),
	FOREIGN KEY (customerIdRef) REFERENCES customers(customerId)
);

INSERT INTO customers(customerName,contactName,country) VALUES('Alfreds Futterkiste','Maria Anders','Germany');
INSERT INTO customers(customerName,contactName,country) VALUES('Ana Trujillo Emparedados y helados','Ana Trujillo','Mexico');
INSERT INTO customers(customerName,contactName,country) VALUES('Antonio Moreno Taquería','Antonio Moreno','Mexico');
INSERT INTO customers(customerName,contactName,country) VALUES('Tommy','Tommy High','American');

INSERT INTO orders VALUES(10308, 1, '1996-09-18');
INSERT INTO orders VALUES(10309, 2, '1996-09-19');
INSERT INTO orders VALUES(10310, 3, '1996-09-20');