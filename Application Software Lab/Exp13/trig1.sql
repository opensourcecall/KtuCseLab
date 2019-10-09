create trigger trig1
before insert on department
for each row
set new.dept_name=upper(new.dept_name);
