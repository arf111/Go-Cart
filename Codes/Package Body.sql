create or replace package body proc_package as

/* check membership type(With join)*/
procedure check_membership_withjoin(id in int) is

v_type varchar(20);

begin 

select m.type into v_type from membership m inner join customer c on m.m_id = c.m_id where c.c_id = id;

dbms_output.put_line('Join operation:');
dbms_output.put_line('---------------');
DBMS_OUTPUT.PUT_LINE(v_type);
dbms_output.put_line(chr(10));
 
end check_membership_withjoin;

/* check membership type(With Semi-join)*/
procedure check_membership_withoutjoin(id in int) is

v_type varchar(20);

begin 

With member_semijoin as (select * from membership where exists ( select m_id from customer c where membership.m_id = c.m_id))

select m.type into v_type from member_semijoin m inner join customer c on m.m_id = c.m_id where c.c_id = id;

dbms_output.put_line('Semi-Join operation:');
dbms_output.put_line('---------------');   
DBMS_OUTPUT.PUT_LINE(v_type);
 
end check_membership_withoutjoin;

/* top selling */
procedure top_selling(fromDate date, toDate date, cat_name varchar)
  is
  p_name varchar(20);
  
begin
  SELECT p.P_Name into p_name FROM product p INNER JOIN goes_in g on g.P_ID = p.P_ID INNER JOIN category c on c.C_ID = p.C_ID INNER JOIN transaction t on t.T_ID = g.T_ID WHERE t.T_Date between fromDate AND toDate AND c.C_Name = cat_name AND ROWNUM <= 1 GROUP BY p.P_Name ORDER BY sum(g.Quantity) DESC;

  DBMS_OUTPUT.PUT_LINE('Top Selling ' || p_name);

end top_selling;

/* sales report */
   procedure sales_report(fromDate date, toDate date) 
  is
  tot_cost number;
  tot_sold number;
  rpt number;
  
begin 
  SELECT SUM(Buying_Price) into tot_cost from warehouse where s_date between fromDate and toDate;
  select sum(total_price) into tot_sold from transaction where t_date between fromDate and toDate;
  
  rpt := tot_cost - tot_sold;
  
  DBMS_OUTPUT.PUT_LINE('Total Cost');
  DBMS_OUTPUT.PUT_LINE(tot_cost);
  
  DBMS_OUTPUT.PUT_LINE('Total Sold');
  DBMS_OUTPUT.PUT_LINE(tot_sold);
  
  DBMS_OUTPUT.PUT_LINE('Report');
  DBMS_OUTPUT.PUT_LINE(rpt);
  
end sales_report;

/* product search(Without canonical expression) */
   procedure product_av_withoutcanon(search_av varchar) is

prod_name product.p_name%TYPE;
  p_quan stores_in.p_quantity%TYPE; 
  b_loc branch.location%type;  
  b_phone branch.phone%type;
  
begin 
  SELECT p.p_name into prod_name from product p inner join stores_in st on p.p_id = st.p_id where p.p_name LIKE search_av;
  
  SELECT st.p_quantity into p_quan from product p inner join stores_in st on p.p_id = st.p_id where p.p_name LIKE search_av;
  
  SELECT b.location into b_loc from product p inner join stores_in st on p.p_id = st.p_id inner join branch b on b.branch_id = st.branch_id where p.p_name LIKE search_av;

  DBMS_OUTPUT.PUT_LINE('Without Canonical Expression:');
  DBMS_OUTPUT.PUT_LINE('-----------------------------');
  DBMS_OUTPUT.PUT_LINE('Product' || '                '|| 'Quantity' || '   ' || 'Location');
  DBMS_OUTPUT.PUT_LINE(prod_name || '  ' || p_quan || '       ' || b_loc);
  DBMS_OUTPUT.PUT_LINE(chr(10));

end product_av_withoutcanon;

/* product search(With canonical expression) */
   procedure product_av_withcanon(search_av varchar) is
  prod_name product.p_name%TYPE;
  p_quan stores_in.p_quantity%TYPE; 
  b_loc branch.location%type;  
  b_phone branch.phone%type;

begin
  with stores_injoin as (select * from stores_in1@site1 union select * from stores_in2@site2)  
  SELECT p.p_name into prod_name from product p inner join stores_injoin st on p.p_id = st.p_id where p.p_name LIKE search_av;
  
  with stores_injoin as (select * from stores_in1@site1 union select * from stores_in2@site2)
  SELECT st.p_quantity into p_quan from product p inner join stores_injoin st on p.p_id = st.p_id where p.p_name LIKE search_av;
  
  with stores_injoin as (select * from stores_in1@site1 union select * from stores_in2@site2)
  SELECT b.location into b_loc from product p inner join stores_injoin st on p.p_id = st.p_id inner join branch b on b.branch_id = st.branch_id where p.p_name LIKE search_av;
  
  DBMS_OUTPUT.PUT_LINE('With Canonical Expression:');
  DBMS_OUTPUT.PUT_LINE('--------------------------');
  DBMS_OUTPUT.PUT_LINE('Product' || '                '|| 'Quantity' || '   ' || 'Location');
  DBMS_OUTPUT.PUT_LINE(prod_name || '  ' || p_quan || '       ' || b_loc);

end product_av_withcanon;

/* warehouse distribution */
  procedure warehouse_dis(pro_name varchar , pro_quan int, branch_name varchar) is
pid int;
bid int;

begin 

select p_id into pid from product where p_name = pro_name;

select branch_id into bid from branch where location = branch_name;

insert into stores_in values(pid,pro_quan,bid);

if (bid = 1)
    then
    insert into stores_in1@site1 values(pid,pro_quan,bid);
else 
    insert into stores_in2@site2 values(pid,pro_quan,bid);
end if;
     
    DBMS_OUTPUT.PUT_LINE('Inserted Successfully '|| pro_name);

commit;

end warehouse_dis; 

/* machine learning */
procedure linear_reg(month in int) is

temp_x number;
temp_y number;
sum_month_x number;
sum_sales_y number;
mul_xy number;
month_x2 number;
sales_y2 number;
a number;
b number;
cnt number;
result number;

cursor sales_cur is select month,sales from sales;

begin
	sum_month_x := 0;
	sum_sales_y := 0;
	mul_xy := 0;
	month_x2 := 0;
	sales_y2 := 0;
  cnt := 0;

	open sales_cur;

	loop
		fetch sales_cur into temp_x,temp_y;
		exit when sales_cur%notfound;
		
		cnt := cnt + 1;
		sum_month_x := sum_month_x + temp_x;
                sum_sales_y := sum_sales_y + temp_y;
		mul_xy := mul_xy + (temp_x * temp_y);
		month_x2 :=  month_x2 + (temp_x * temp_x);
		sales_y2 := sales_y2 + (temp_y * temp_y);
		
	end loop;
	
	close sales_cur;  
        
        /*formula for a and b */  
	a := (sum_sales_y * month_x2) - (sum_month_x * mul_xy);
        a := a /( (cnt * month_x2) - (sum_month_x * sum_month_x) );

   	b := (cnt * mul_xy) - (sum_month_x * sum_sales_y); 
	b := b/( (cnt * month_x2) - (sum_month_x * sum_month_x) );
        /*formula for a and b */
 	
	result := a + (b * month); /* y = a + bx */
	DBMS_OUTPUT.PUT_LINE('Predicted Sales for Month = '||month||' is '|| result);
	
end linear_reg;

/*
Effect of update. Does update on product quantity and location from site1 to site2
*/
PROCEDURE update_stores_in
         (pid in int, pquan in int,bid in int)
       IS
       p_id int;    
       p_quan int;
       b_id int;

BEGIN
   select P_ID,P_Quantity into p_id,p_quan from stores_in1@site1 where P_ID = pid;
   
   delete from stores_in1@site1 where P_ID = pid;
   
   insert into stores_in2@site2 values(p_id,pquan,bid);
   
   commit;
   
   dbms_output.put_line(Update done);

end update_stores_in;

end proc_package;  
/