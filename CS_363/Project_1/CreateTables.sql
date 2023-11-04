drop database project1a;
create database if not exists project1a;
use project1a;

drop table if exists students;
drop table if exists departments;
drop table if exists degree;
drop table if exists courses;
drop table if exists register;
drop table if exists major;
drop table if exists minor;


create table students(
	snum integer UNIQUE, 
    ssn integer PRIMARY KEY,
    name varchar(10),
    gender varchar(1), 
    dob datetime, 
    c_addr varchar(20), 
    c_phone varchar(10), 
    p_addr varchar(20),
    p_phone varchar(10)
);

create table departments(
	code integer PRIMARY KEY, 
    name varchar(50) UNIQUE,
    phone varchar(10),
    college varchar(20)
);

create table degree(
	name varchar(50),
	level varchar(5),
    department_code integer,
    primary key(name, level),
    foreign key(department_code) references departments(code)
);

create table courses(
	number integer PRIMARY KEY,
    name varchar(50) UNIQUE,
    description varchar(50),
    credithours integer, 
    level varchar(20), 
    department_code integer,
    foreign key(department_code) references departments(code)
    ON DELETE CASCADE
);

create table register(
	snum integer, 
    course_number integer, 
    regtime varchar(20), 
    grade integer,
    primary key(snum, course_number),
    foreign key(snum) references students(snum), 
    foreign key(course_number) references courses(number)
);

create table major(
	snum integer,
    name varchar(50),
    level varchar(5),
    primary key(name, level, snum),
    foreign key (name, level) references degree(name, level),
    foreign key(snum) references students(snum)
);

create table minor(
	snum integer,
    name varchar(50),
    level varchar(5),
    primary key(name, level, snum),
    foreign key(name, level) references degree(name, level),
    foreign key(snum) references students(snum)
);

