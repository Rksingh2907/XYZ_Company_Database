
USE SQLTutorial;

Create Table Department(
	dept_id int primary key,
    dept_name varchar(30) unique,
    hod varchar(30));
-- Constraints in department table
-- 1. dept_is is primary key
-- 2. dept_name must be unique
    

Create Table Employees(
emp_id int primary key,
emp_name varchar(50),
salary int check (salary>=1000),
dept_id int ,
date_of_join date,
desg varchar(20),
foreign key(dept_id)
references Department(dept_id)
);

-- Constraints in employee table
-- 1. emp_id is primary key
-- 2. salary must be >=1000
-- 3. dept_id is foreign key referencing dept_id of department table.


create table leaves(
leave_type char(2) primary key,
leave_name varchar(20),
num_leaves int check(num_leaves <=20));

-- Constraints in leave table
-- 1.leave_type is primary key
-- 2. num_leaves must be <=20 

create table emp_leaves(
emp_id int,
leave_type char(2) not null,
st_date date,
end_date date,
primary key (emp_id,st_date),
foreign key(emp_id)
references Employees(emp_id),
foreign key(leave_type)
references leaves(leave_type),
CONSTRAINT EMP_LEAVES_DATES_CHK CHECK (st_date<=end_date)
);

-- Constraints in emp_leaves table
-- 1. emp_id + stdate is primary key
-- 2. leave_type is not null
-- 3. emp_id is foreign key referencing emp_id is employees tables
-- 4. leavetype is foreign key referencing leavetype in leaves table.
-- 5. stdate must be <= enddate


Show tables;

INSERT INTO LEAVES VALUES
('S','SICK',15),
('C','CASUAL',15),
('E','EARNING',5),
('O','OVERTIME',5);



INSERT INTO Department Values(1,'MAINFRAME','GEORGE'),
(2,'CLIENT/SERVER','BILL'),
(3,'SYSTEMS','GARRY'),
(4,'INTERNET','PAUL'),
(5,'ACCOUNTS','ANDY');


INSERT INTO Employees VALUES(101,'GEORGE',12000,1,'2001-07-12','PM'),
(102,'BILL',12000,2,'2001-07-14','PM'),
(103,'GARRY',15000,3,'2001-07-1','PM'),
(104,'PAUL',11000,4,'2001-07-2','PL'),
(105,'ANDY',7000,5,'2001-06-25','AM'),
(106,'KEATS',10000,1,'2001-07-17','SA'),
(107,'JOEL',8000,2,'2001-07-15','SP'),
(108,'ROBERTS',7500,2,'2001-07-15','PRO'),
(109,'HERBERT',8000,4,'2001-07-22','SA'),
(110,'MICHEAL',6000,4,'2001-07-22','PRO');


INSERT INTO EMP_LEAVES VALUES(102,'S','2001-07-23','2001-07-25'),
(104,'C','2001-07-24','2001-07-25'),
(104,'S','2001-07-28','2001-07-29'),
(101,'C','2001-07-27','2001-07-28'),
(106,'O','2001-07-28','2001-07-29'),
(109,'C','2001-08-1','2001-08-2'),
(103,'C','2001-08-2','2001-08-5'),
(105,'S','2001-08-17',NULL),
(108,'S','2001-08-23',NULL);

select * from emp_leaves;
select * from Department;
select * from Employees;
select * from leaves;
