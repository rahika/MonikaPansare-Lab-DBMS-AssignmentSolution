
#Query 9 : 	Create a stored procedure to display the Rating for a Supplier if any along with 
			#the Verdict on that rating if any like if rating >4 then 
			#“Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”.
            
select supplier.SUPP_ID, supplier.SUPP_NAME, rating.rat_ratstars, 
case 
	when rating.rat_ratstars > 4 then 'genuine supplier'
    when rating.rat_ratstars > 2 then 'average supplier'
   else 'supplier should not be considered'
end 
	as verdict from rating inner join supplier on supplier.SUPP_ID = rating.SUPP_ID;
    
Delimiter $$
	create procedure proc1()
    begin 
    select supplier.SUPP_ID, supplier.SUPP_NAME, rating.rat_ratstars, 
case 
	when rating.rat_ratstars > 4 then 'genuine supplier'
    when rating.rat_ratstars > 2 then 'average supplier'
    else 'supplier should not be considered'
end 
	as verdict from rating inner join supplier on supplier.SUPP_ID = rating.SUPP_ID;
end $$

call proc1;