DECLARE   
   p_id int;
   p_quan int;
   b_id int;  
BEGIN
   p_id := 10005;
   p_quan := 2;
   b_id := 3;
   INSERT INTO stores_in (P_ID, P_Quantity, Branch_ID) VALUES (p_id, p_quan, b_id);   
   IF sql%notfound THEN  
      dbms_output.put_line('Not Inserted');  
   ELSIF sql%found THEN       
     dbms_output.put_line('Inserted');  
   END IF;   
END;  
/ 