use project1a;

select * from students where ssn = '746897816';
update students set name = 'Scott' where ssn = '746897816';

SET SQL_SAFE_UPDATES=0;
select snum from students where ssn = '746897816';
update major set name = 'Computer Science';
update major set level = 'MS';


select * from register where regtime = 'Spring2020';
delete from register where regtime = 'Spring2020';


