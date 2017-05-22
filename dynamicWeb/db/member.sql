USE mldn;
DROP TABLE IF EXISTS member;

CREATE TABLE member(
	mid 		VARCHAR(50) 	PRIMARY KEY,
	password	VARCHAR(32)		NOT NULL,
	name		VARCHAR(30)		NOT NULL
);

INSERT INTO member(mid, password, name) VALUES('admin', 'admin', '管理员');
INSERT INTO member(mid,password,name) VALUES('guest', 'guest', '游客');
INSERT INTO member(mid,password,name) VALUES('user', 'user', '普通用户');