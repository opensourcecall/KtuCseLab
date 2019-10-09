delimiter #
drop procedure if exists cursor2#
create procedure cursor2()
begin
	declare s int;
	declare  n varchar(20);
	declare flag int;	
	declare bp int;

	declare cur cursor for select e1.ssn,name,basic_pay from emp_details as e1, employee as e2 where e1.ssn=e2.ssn order by gross_salary desc limit 5;
	declare continue handler for not found set flag = 1;
	
	open cur;
	label : loop
		fetch cur into s,n,bp;
		if flag = 1 then
			leave label;
		end if;
		insert into emp1 values (s,n,bp);
	end loop;	
	close cur;
	select * from emp1;
end #
delimiter ;
