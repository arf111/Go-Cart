set serveroutput on;
set verify off;

declare
	cursor cur is 
	select object_name from dba_objects
	where object_type = 'TABLE'
	and owner = 'SYSTEM'
	and created > '3-oct-18';
    type namesarray IS VARRAY(12) OF VARCHAR2(16); 
    names namesarray;
    tab varchar2(30);
    cnt integer;
    profile integer;
    total integer;
    sze integer;
begin
	names := namesarray('branch', 'category', 'membership', 'product', 'customer', 'transaction', 'goes_in', 'occurs_in','proceed','stores_in','warehouse','sales'); 
	
	total := names.count;
	
	for i in 1..total
	loop
  	select count(*) into cnt from names(i);/* Names(i) returns inverted comma. Tried trim() function still doesn't work. Tried with cursor but the inverted comma is not accepted in names array. If it could've worked we might've shown the database estimation of each table */

	select sum(data_length) into sze from user_tab_columns where table_name = ''||names(i)||'';
	profile := cnt * sze * 8;
	dbms_output.put_line('Table 1'||tab||': Row_count - '|| cnt ||' Size - '||sze||' profile Size - '||profile);
	end loop;
	
 	commit;
end;
/

  	
