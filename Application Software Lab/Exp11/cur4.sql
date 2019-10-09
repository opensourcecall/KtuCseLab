delimiter #
drop procedure if exists cursor4#
create procedure cursor4()
begin
	declare flag int default 0;	
	declare s int default 0;
	declare egs int default 0;
	declare new int default 0;
	
	declare cur cursor for select ssn,gross_salary from employee where gross_salary < (select avg(gross_salary) from employee);
	declare continue handler for not found set flag = 1;
	
	open cur;
	label : loop
		fetch cur into s,egs;
		if flag = 1 then
			leave label;
		end if;
		set new=egs+1599;
		insert into emp3 values (s,now(),new);
	end loop;	
	close cur;
	select * from emp3;
      truncate emp3;
end #
delimiter ;
