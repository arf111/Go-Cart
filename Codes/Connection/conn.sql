
drop database link site1;
drop database link site2;

create database link site1
 connect to system identified by "1234"
 using 'SITE1'
;  

create database link site2
 connect to system identified by "1234"
 using 'SITE2'
;  
