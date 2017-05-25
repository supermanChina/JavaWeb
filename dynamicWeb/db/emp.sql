USE mldn;
DROP TABLE IF EXISTS emp;
CREATE TABLE emp(
	empno 		INT(4) PRIMARY KEY,
	ename		VARCHAR(10),
	job			VARCHAR(9),
	hiredate	DATE,
	sal			FLOAT(7,2)
);

INSERT INTO emp(empno,ename,job,hiredate,sal) VALUES(6060, '李', '经理', '2017-04-01', 2000.30);
INSERT INTO emp(empno,ename,job,hiredate,sal) VALUES(7369, '董', '销售', '2015-06-01', 1500.40);
INSERT INTO emp(empno,ename,job,hiredate,sal) VALUES(7556, '张', '销售', '2016-02-07', 800);
INSERT INTO emp(empno,ename,job,hiredate,sal) VALUES(7766, '刘', '销售', '2015-08-23', 1000);
INSERT INTO emp(empno,ename,job,hiredate,sal) VALUES(7689, '杨', '分析员', '2013-05-18', 2500);
INSERT INTO emp(empno,ename,job,hiredate,sal) VALUES(7368, '王', '经理', '2012-02-08', 2500);
INSERT INTO emp(empno,ename,job,hiredate,sal) VALUES(7833, '李', '分析员', '2011-06-17', 3000);