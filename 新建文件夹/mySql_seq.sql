DROP TABLE IF EXISTS sequence; 
CREATE TABLE sequence ( 
     name VARCHAR(50) NOT NULL, 
     current_value INT NOT NULL, 
     increment INT NOT NULL DEFAULT 1, 
     PRIMARY KEY (name) 
) ENGINE=InnoDB; 

 
DROP FUNCTION IF EXISTS currval; 
DELIMITER $ 
CREATE FUNCTION currval (seq_name VARCHAR(50)) 
     RETURNS INTEGER
     LANGUAGE SQL 
     DETERMINISTIC 
     CONTAINS SQL 
     SQL SECURITY DEFINER 
     COMMENT ''
BEGIN
     DECLARE value INTEGER; 
     SET value = 0; 
     SELECT current_value INTO value 
          FROM sequence
          WHERE name = seq_name; 
     RETURN value; 
END
$ 
DELIMITER ; 
 DROP FUNCTION IF EXISTS nextval; 
DELIMITER $ 
CREATE FUNCTION nextval (seq_name VARCHAR(50)) 
     RETURNS INTEGER
     LANGUAGE SQL 
     DETERMINISTIC 
     CONTAINS SQL 
     SQL SECURITY DEFINER 
     COMMENT ''
BEGIN
     UPDATE sequence
          SET current_value = current_value + increment 
          WHERE name = seq_name; 
     RETURN currval(seq_name); 
END
$ 
DELIMITER ; 
DROP FUNCTION IF EXISTS setval; 
DELIMITER $ 
CREATE FUNCTION setval (seq_name VARCHAR(50), value INTEGER) 
     RETURNS INTEGER
     LANGUAGE SQL 
     DETERMINISTIC 
     CONTAINS SQL 
     SQL SECURITY DEFINER 
     COMMENT ''
BEGIN
     UPDATE sequence
          SET current_value = value 
          WHERE name = seq_name; 
     RETURN currval(seq_name); 
END
$ 
DELIMITER ; 




1.INSERT INTO sequence VALUES ('TestSeq', 0, 1);----添加一个sequence名称和初始值，以及自增幅度
2.SELECT SETVAL('TestSeq', 10);---设置指定sequence的初始值
3.SELECT CURRVAL('TestSeq');--查询指定sequence的当前值
4.SELECT NEXTVAL('TestSeq');--查询指定sequence的下一个值
