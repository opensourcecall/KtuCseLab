delimiter #
drop procedure if exists cursor5	#
create procedure cursor5()
begin
	declare flag int default 0;	
	declare s int default 0;
	declare egs int default 0;
	declare new int default 0;
	
	declare cur cursor for select e1.ssn,year_of_exp from employee as e1,emp_details as e2 where e1.ssn=e2.ssn and e2.year_of_exp < 2;
	declare continue handler for not found set flag = 1;
	
	open cur;
	label : loop
		fetch cur into s,egs;
		if flag = 1 then
			leave label;
		end if;
		delete from emp_details,employee using emp_details inner join employee where emp_details.ssn=employee.ssn and emp_details.year_of_exp < 2; 
	end loop;	
	close cur;
end #
delimiter ;
