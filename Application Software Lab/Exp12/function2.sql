DELIMITER #
DROP FUNCTION IF EXISTS function2#
CREATE FUNCTION function2(A int) RETURNS INT
BEGIN
DECLARE total int default 0;
DECLARE S int ;
DECLARE flag int default 0;

declare cur1 cursor for select SALARY from WORK WHERE DEPT_NO = A;
declare continue handler for not found set flag=1;

open cur1;
label:loop


fetch cur1 into s;
if(flag=1) then
  leave label;
end if;
set total=total+s;
end loop;
close cur1;

RETURN(total);
END #
DELIMITER ;
