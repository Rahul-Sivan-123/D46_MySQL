create database Manager_Database;
use Manager_Database;
create table Managers(
Manager_id int auto_increment unique primary key,
First_name varchar(50) not null,
Last_name varchar(50) not null,
DOB date not null,
Age int check (Age > 0),
Last_update timestamp,
Gender varchar(10) not null,
Department varchar(50) not null,
Salary float not null
);
desc Managers;

-- INSERTING 10 ROWS
insert into Managers(First_name, Last_name, DOB, Age, Last_update, Gender, Department, Salary)
values
('Mia', 'Khan', '1991-06-15', 33, current_timestamp(), 'F', 'Finance',50000),
('Sean', 'Paul', '1985-05-11', 44, current_timestamp(), 'M', 'HR',60000),
('John', 'Doe', '1970-08-10', 54, current_timestamp(), 'M', 'Marketing',35000),
('Kelly', 'Smith', '1990-07-08', 34, current_timestamp(), 'F', 'HR', 55000),
('Steve', 'Bird', '1980-06-13', 35, current_timestamp(), 'M', 'Engineering',80000),
('Derek', 'P', '1988-08-08', 36, current_timestamp(), 'M', 'IT', 60000),
('Lin', 'Cooper', '1993-03-03', 31, current_timestamp(), 'F', 'Sales', 650000),
('Arathy', 'Rahul', '1996-08-11', 28, current_timestamp(), 'F', 'IT', 25000),
('Nina', 'Philip', '1995-09-18', 29, current_timestamp(), 'M', 'Marketing', 71000),
('jacob', 'Thomas', '1972-10-11', 52, current_timestamp(), 'M', 'Finance', 42000);
select * from Managers;

-- QUERY TO RETRIVE NAME & DOB OF MANAGER WITH MANAGER_ID 1.
select First_name, Last_name, DOB from managers where Manager_id=1;

-- QUERY TO DISPLAY THE ANNUAL INCOME OF ALL MANAGERS.
select Manager_id, First_name, Last_name, Salary*12 as Annual_Income from Managers;

-- QUERY TO DISPLAY RECORS OF ALL MANAGERS EXCEPT 'AALIYA'. 
select * from Managers where First_name != 'Aaliya';

-- QUERY TO DISPLAY DETAILS OF MANAGERS WHOSE DEPARTMENT IS IT AND EARNS MORE THAN 25000 PER MONTH.
select * from Managers where Department='IT' and Salary>25000;

-- QUERY TO DISPLAY DETAILS OF MANAGERS WHOSE SALARY IS BETWEEN 10000 AND 35000.
select * from Managers where Salary between 10000 and 35000;