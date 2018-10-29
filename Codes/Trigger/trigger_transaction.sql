SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER display_price_changes 
BEFORE DELETE OR INSERT OR UPDATE ON transaction 
FOR EACH ROW 
WHEN (NEW.T_ID > 0) 
DECLARE 
   tot_price_diff number; 
BEGIN 
   tot_price_diff := :NEW.total_price  - :OLD.total_price; 
   dbms_output.put_line('Old Price: ' || :OLD.total_price); 
   dbms_output.put_line('New Price: ' || :NEW.total_price); 
   dbms_output.put_line('Difference: ' || tot_price_diff); 
END; 
/