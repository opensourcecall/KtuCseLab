delimiter #
drop procedure if exists cursor3#
create procedure cursor3(in n int)
begin
	declare flag int;	
	declare gs decimal;

	declare cur cursor for select gross_salary from employee where 1 order by gross_salary desc limit n;
	declare continue handler for not found set flag = 1;
	
	open cur;
	label : loop
		fetch cur into gs;
		if flag = 1 then
			leave label;
		end if;
		insert into emp2 values (gs);
	end loop;	
	close cur;
	select sum(grosspay) from emp2	;
      truncate emp2;
	
end #
delimiter ;
