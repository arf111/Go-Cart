CREATE OR REPLACE TRIGGER hr_audit_tr 
AFTER DDL ON SCHEMA

BEGIN
INSERT INTO schema_audit VALUES 
(
sysdate,
sys_context('USERENV','CURRENT_USER'),
ora_dict_obj_type, 
ora_dict_obj_name,
ora_sysevent);
END;
/