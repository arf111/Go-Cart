DECLARE
  pid stores_in.P_ID%TYPE;
  pquan stores_in.P_Quantity%TYPE;
  bid stores_in.Branch_ID%TYPE;
  loc branch.Location%TYPE;
  phn branch.Phone%TYPE;
  tid transaction.T_ID%TYPE;
  cid transaction.Cust_ID%TYPE;
  totprice transaction.Total_Price%TYPE;
  tdate transaction.T_Date%TYPE;   

  cursor stcursor is 
  select * from stores_in where Branch_ID = 1;
  
  cursor branchcursor is 
  select * from branch where Branch_ID = 1;
     
  cursor transaccursor is 
  select * from transaction where Branch_ID = 1;

BEGIN
  delete from stores_in1@site1;
  delete from branch1@site1;
  delete from transaction1@site1;
    
  open stcursor;
  
  loop
    fetch stcursor into pid,pquan,bid;
    exit when stcursor%notfound;    
    insert into stores_in1@site1 values(pid,pquan,bid);
  end loop;  
  
  close stcursor;
  
  open branchcursor;
    
  loop      
    fetch branchcursor into bid,loc,phn;
    exit when branchcursor%notfound;
    insert into branch1@site1 values(bid,loc,phn);
  end loop;     
  
  close branchcursor;
  
  open transaccursor;

  loop      
    fetch transaccursor into tid,cid,bid,totprice,tdate;
    exit when transaccursor%notfound;
    insert into transaction1@site1 values(tid,cid,bid,totprice,tdate);
  end loop;     
  
  close transaccursor;
  
  commit;
end;
/
    
      
       
