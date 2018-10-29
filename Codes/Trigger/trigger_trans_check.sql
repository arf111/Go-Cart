DECLARE   
   total_rows number(2);  
BEGIN  
   UPDATE  transaction  
   SET total_price = total_price + 100 where t_id = 1;  
   IF sql%notfound THEN  
      dbms_output.put_line('transaction unchange');  
   ELSIF sql%found THEN  
      total_rows := sql%rowcount;  
      dbms_output.put_line( total_rows || ' transaction updated ');  
   END IF;   
END;  
/ 