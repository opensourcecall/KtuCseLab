delimiter #
drop procedure if exists cursor1#
create procedure cursor1()
begin
	declare r int;
	declare m1 int;
	declare m2 int;	
	declare m3 int;
	declare m4 int;
	
	declare sum1 int;
	declare avg1 int;
	declare flag int;	

	declare cur cursor for select rnum,s1,s2,s3,s4 from student;
	declare continue handler for not found set flag =1;
	open cur;
	label: loop
		fetch cur into r,m1,m2,m3,m4;
		if flag =1 then
			leave label;
		end if;
		set sum1=m1+m2+m3+m4;
		set avg1=sum1/4;
		update student set total = sum1 where rnum=r;
		update student set percentage = avg1 where rnum=r;
	end loop;
	close cur;
	end #
delimiter ;
