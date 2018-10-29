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
  select * from stores_in where Branch_ID = 2;
  
  cursor branchcursor is 
  select * from branch where Branch_ID = 2;
     
  cursor transaccursor is 
  select * from transaction where Branch_ID = 2;

BEGIN
  delete from stores_in2@site2;
  delete from branch2@site2;
  delete from transaction2@site2;
    
  open stcursor;
  
  loop
    fetch stcursor into pid,pquan,bid;
    exit when stcursor%notfound;    
    insert into stores_in2@site2 values(pid,pquan,bid);
  end loop;  
  
  close stcursor;
  
  open branchcursor;
    
  loop      
    fetch branchcursor into bid,loc,phn;
    exit when branchcursor%notfound;
    insert into branch2@site2 values(bid,loc,phn);
  end loop;     
  
  close branchcursor;
  
  open transaccursor;

  loop      
    fetch transaccursor into tid,cid,bid,totprice,tdate;
    exit when transaccursor%notfound;
    insert into transaction2@site2 values(tid,cid,bid,totprice,tdate);
  end loop;     
  
  close transaccursor;
  
  commit;
end;
/
    
      
       
