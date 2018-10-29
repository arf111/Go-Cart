CREATE OR REPLACE TRIGGER branch_delete
BEFORE DELETE ON branch
FOR EACH ROW

DECLARE
   v_username varchar2(10);

BEGIN
   -- Insert record into audit table
    dbms_output.put_line('Deleted'); 
END;
/