create database School;
use School;
 create table student (
 Roll_No int auto_increment primary key,
 Name varchar(100),
 Marks float,
 Grade char(1)
 );
 
 -- DATA INSERTION
 insert into student 
(roll_no,name,marks,Grade)
values
(1, 'Aby', 49, 'A'),
(2, 'Beena', 28 , 'C'),
(3, 'Clad', 41 , 'B'),
(4, 'Jack', 25 , 'C'),
(5, 'Roy', 18 , 'D');

-- DISPLAY TABLE-(BY SELECT COMMAND)
select * from student;

-- ADDING A COLUMN NAMED CONTACT TO STUDENT TABLE
alter table student
add column Contact varchar(25);

-- REMOVING GRADE COLOUMN FROM STUDENT TABLE
alter table student
drop column Grade;

-- RENAMING THE TABLE AS CLASS_TEN
rename table student to Class_Ten;

-- DELETING ALL ROWS FROM TABLE CLASS_TEN
truncate table class_ten;

-- REMOVING THE TABLE FROM DATABASE NAMED SCHOOL
drop table class_ten;