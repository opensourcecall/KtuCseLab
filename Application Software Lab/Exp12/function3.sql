DELIMITER #
DROP FUNCTION IF EXISTS function3#
CREATE FUNCTION function3(A int) RETURNS INT
BEGIN
DECLARE highest int default 0;
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
if(s>highest) then
set highest=s;
end if;
end loop;
close cur1;

RETURN(highest);
END #
DELIMITER ;
