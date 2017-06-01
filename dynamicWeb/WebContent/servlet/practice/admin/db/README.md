# SQL语法问题
[参考链接](http://www.w3school.com.cn/sql/sql_foreignkey.asp)

[TOC]

## FOREIGN KEY语法
### 建表时指定未命名FOREIGN KEY约束
*未指定名称时会自动命名`contraint name`。*  
- Oracle语法:
*在MySQL中执行时不会报错，但是外键约束没有设置成功。*
```
CREATE TABLE admin_admingroup(
	adminid VARCHAR(50) FOREIGN KEY REFERENCES admin(adminid) ON DELETE CASCADE,
	groupid INT FOREIGN KEY	REFERENCES 	admingroup(groupid) ON DELETE CASCADE
);
```
- MySQL语法：
```
CREATE TABLE admin_admingroup(
	adminid VARCHAR(50),
	groupid INT ,
	FOREIGN KEY (adminid) REFERENCES admin(adminid) ON DELETE CASCADE,
	FOREIGN KEY (groupid) REFERENCES admingroup(groupid) ON DELETE CASCADE
);
```
### 建表时指定命名FOREIGN KEY约束
Oracle与MySQL语法相同：  
使用`CONSTRAINT`关键字指定外键约束名称
```
CREATE TABLE admin_admingroup(
	adminid VARCHAR(50),
	groupid INT 	,
	CONSTRAINT fk_perAdminid FOREIGN KEY (adminid) REFERENCES admin(adminid) ON DELETE CASCADE,
	CONSTRAINT fk_perGroupid FOREIGN KEY (groupid) REFERENCES admingroup(groupid) ON DELETE CASCADE
);
```
### 在已建表创建FOREIGN KEY约束
- 不指定外键约束名：  
ALTER TABLE admin_admingroup ADD FOREIGN KEY(adminid) REFERENCES admin(adminid) ON DELETE CASCADE;`  
- 指定外键约束名：  
ALTER TABLE admin_admingroup ADD CONSTRAINT fk_perAdminid FOREIGN KEY(adminid) REFERENCES admin(adminid) ON DELETE CASCADE;`

### 删除FOREIGN KEY约束
*删除时需要指定外键约束名*  
`ALTER TABLE admin_admingroup DROP FOREIGN KEY fk_perAdminid;`
