USE mldn;
DROP TABLE IF EXISTS user;
CREATE TABLE user(
	userid		VARCHAR(30)	PRIMARY KEY,
	name		VARCHAR(30) NOT NULL,
	password	VARCHAR(32) NOT NULL
);

INSERT INTO user(userid,name,password) VALUES('admin','管理员','admin');
