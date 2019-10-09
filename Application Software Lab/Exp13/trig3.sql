create trigger trig3
after insert on Admission17
for each row
update Vacancies17
set no_of_vacancies=no_of_vacancies-1
where new.branch=branch_name;
