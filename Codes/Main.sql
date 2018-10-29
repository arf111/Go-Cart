SET SERVEROUTPUT ON;

declare
    c number;

begin
   proc_package.top_selling('02-JAN-2018','02-FEB-2018','Electronics');
   
   /* Join, Semi-join operation */
   proc_package.check_membership_withjoin(1001);
   proc_package.check_membership_withoutjoin(1001);
   
   proc_package.sales_report('01-JAN-2018','01-FEB-2018');
   proc_package.warehouse_dis('Sunsilk Shampoo 500ml',30,'Mohammadpur');
   
   /* Operator Tree without and with canonical expression */
   proc_package.product_av_withoutcanon('Sunsilk Shampoo 500ml');
   proc_package.product_av_withcanon('Sunsilk Shampoo 500ml');
   
   /* Machine learning */
   proc_package.linear_reg(1);
   
   /* Effect of update. Does update on product quantity and location from site1 to site2 */
   proc_package.update_stores_in(10001,3,2);

end;
/