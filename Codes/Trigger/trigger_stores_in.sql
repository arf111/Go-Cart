CREATE OR REPLACE TRIGGER stores_in_insert
AFTER INSERT ON stores_in
FOR EACH ROW

DECLARE
   brn_id int;
BEGIN
   -- Insert record into audit table
    dbms_output.put_line('Inserted'); 
END;
/