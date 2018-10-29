DECLARE   
   total_rows number(2);  
BEGIN
   delete from branch where branch_id = 4;
   IF sql%notfound THEN  
      dbms_output.put_line('Not Deleted');  
   ELSIF sql%found THEN       
     dbms_output.put_line('Deleted');  
   END IF;   
END;  
/ 