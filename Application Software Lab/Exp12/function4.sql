DELIMITER #
DROP FUNCTION IF EXISTS function4#
CREATE FUNCTION function4(A int) RETURNS varchar(15)
BEGIN
DECLARE lvl varchar(15);
DECLARE l int;

select CREDIT_LIMIT INTO l FROM customer WHERE CUST_NO=A;


if(l>50000) then
SET lvl='PLATINUM';
elseif(l>10000) then
SET lvl='GOLD';
else
SET lvl='SILVER';

end if;
return(lvl);
END #
DELIMITER ;
