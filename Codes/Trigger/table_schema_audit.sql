drop table schema_audit;

CREATE TABLE schema_audit
(
ddl_date DATE,
ddl_user VARCHAR2(15),
object_created  VARCHAR2(15),
object_name VARCHAR2(15),
ddl_operation VARCHAR2(15)
);
