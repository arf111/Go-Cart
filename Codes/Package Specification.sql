create or replace package proc_package as
    procedure check_membership_withjoin(id int);

    procedure check_membership_withoutjoin(id in int);    

    procedure top_selling(fromDate date, toDate date, cat_name varchar);

    procedure sales_report(fromDate date, toDate date);
   
    procedure warehouse_dis(pro_name varchar , pro_quan int, branch_name varchar);

    procedure product_av_withoutcanon(search_av varchar);
    
    procedure product_av_withcanon(search_av varchar);
        
    procedure linear_reg(month int);
    
    procedure update_stores_in(pid int, pquan int,bid int);
        
end proc_package; 
/