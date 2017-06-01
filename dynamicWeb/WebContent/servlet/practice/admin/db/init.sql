USE mldn;
DROP TABLE IF EXISTS admin_admingroup;
DROP TABLE IF EXISTS admingroup_privilege;
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS admingroup;
DROP TABLE IF EXISTS privilege;

-- MySQL不支持SEQUENCE关键字，使用AUTO_INCREMENT来实现序列
/*
DROP SEQUENCE groseq;
DROP SEQUENCE priseq;

CREATE SEQUENCE groseq;
CREATE SEQUENCE priseq;
*/
-- ORACLE语法，MySQL不支持
-- PURGE RECYCLEBIN;

CREATE TABLE admin(
	adminid 	VARCHAR(50)		PRIMARY KEY,	
	PASSWORD 	VARCHAR(32)		NOT NULL,	
	note	 	VARCHAR(200)	NOT NULL,
	adminflag	INT				DEFAULT 1
);

CREATE TABLE admingroup(
	groupid	INT 	PRIMARY KEY AUTO_INCREMENT,
	NAME 	VARCHAR(50) NOT NULL,
	note	VARCHAR(200) 
);

CREATE TABLE privilege(
	pid	INT PRIMARY KEY AUTO_INCREMENT,
	NAME 	VARCHAR(50)	NOT NULL,
	note	VARCHAR(200)
);

CREATE TABLE admin_admingroup(
	adminid VARCHAR(50),
	groupid INT 	,
	CONSTRAINT fk_perAdminid FOREIGN KEY (adminid) REFERENCES admin(adminid) ON DELETE CASCADE,
	CONSTRAINT fk_perGroupid FOREIGN KEY (groupid) REFERENCES admingroup(groupid) ON DELETE CASCADE
);

CREATE TABLE admingroup_privilege(
	pid 	INT ,
	groupid INT ,
	FOREIGN KEY (pid) REFERENCES privilege(pid) ON DELETE CASCADE,
	FOREIGN KEY (groupid) REFERENCES admingroup(groupid) ON DELETE CASCADE
);

INSERT INTO admin(adminid,PASSWORD, note,adminflag) VALUES ('admin0','123456','超级管理员',0);
INSERT INTO admin(adminid,PASSWORD, note,adminflag) VALUES ('admin1','123456','普通管理员',1);

INSERT INTO privilege(NAME,note) VALUES ('增加管理员', '-');
INSERT INTO privilege(NAME,note) VALUES ('更新管理员', '-');
INSERT INTO privilege(NAME,note) VALUES ('删除管理员', '-');
INSERT INTO privilege(NAME,note) VALUES ('查看管理员', '-');
INSERT INTO privilege(NAME,note) VALUES ('添加商品', '-');
INSERT INTO privilege(NAME,note) VALUES ('查看商品', '-');
INSERT INTO privilege(NAME,note) VALUES ('修改商品', '-');
INSERT INTO privilege(NAME,note) VALUES ('更新商品', '-');
INSERT INTO privilege(NAME,note) VALUES ('添加新闻', '-');
INSERT INTO privilege(NAME,note) VALUES ('更新新闻', '-');
INSERT INTO privilege(NAME,note) VALUES ('查看新闻', '-');
INSERT INTO privilege(NAME,note) VALUES ('删除新闻', '-');
INSERT INTO privilege(NAME,note) VALUES ('增加部门', '-');
INSERT INTO privilege(NAME,note) VALUES ('删除部门', '-');
INSERT INTO privilege(NAME,note) VALUES ('查看部门', '-');
INSERT INTO privilege(NAME,note) VALUES ('修改部门', '-');
INSERT INTO privilege(NAME,note) VALUES ('增加雇员', '-');
INSERT INTO privilege(NAME,note) VALUES ('查看雇员', '-');
INSERT INTO privilege(NAME,note) VALUES ('删除雇员', '-');
INSERT INTO privilege(NAME,note) VALUES ('修改雇员', '-');

INSERT INTO admingroup(NAME,note) VALUES('系统管理员组','-');
INSERT INTO admingroup(NAME,note) VALUES('信息管理员组','-');

INSERT INTO admin_admingroup(adminid,groupid) VALUES ('admin0',1);
INSERT INTO admin_admingroup(adminid,groupid) VALUES ('admin0',2);
INSERT INTO admin_admingroup(adminid,groupid) VALUES ('admin1',2);

INSERT INTO admingroup_privilege(pid,groupid) VALUES (1,1);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (2,1);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (3,1);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (4,1);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (5,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (6,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (7,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (8,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (9,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (10,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (11,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (12,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (13,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (14,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (15,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (16,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (17,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (18,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (19,2);
INSERT INTO admingroup_privilege(pid,groupid) VALUES (20,2);

COMMIT;