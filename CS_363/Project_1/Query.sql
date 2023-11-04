select students.snum, students.ssn
from students
where students.name = 'Becky';

select major.name, major.level
from major, students
where students.snum = major.snum and students.ssn = 123097834;

select courses.name
from courses, departments
where courses.department_code = departments.code and departments.name = 'Computer Science';

select degree.name, degree.level
from degree, departments
where degree.department_code = departments.code and departments.name = 'Computer Science';

select students.name
from minor, students
where minor.snum = students.snum;

select count(*)
from minor;

select students.name, students.snum
from students, courses, register 
where students.snum = register.snum  and courses.number=register.course_number and courses.name = 'Algorithm' ;

select students.name, students.snum
from students
where students.dob in (select MIN(students.dob) from students);

select students.name, students.snum
from students
where students.dob in (select MAX(students.dob) from students);


select students.name, students.snum, students.ssn
from students
where students.name like '%n%' or '%N%';

select students.name, students.snum, students.ssn
from students
where students.name not like '%n%' or '%N%';

select courses.number, courses.name, count(register.course_number)
from courses
left join register ON courses.number = register.course_number
group by courses.number,courses.name;

select students.name
from students, register
where students.snum = register.snum and register.regtime = 'Fall2020';

select courses.number, courses.name
from courses, departments
where courses.department_code = departments.code and departments.name = 'Computer Science';

select courses.number, courses.name
from courses, departments
where courses.department_code = departments.code and (departments.name = 'Computer Science' or departments.name = 'Landscape Architect');







