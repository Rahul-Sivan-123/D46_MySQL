create database Schooldb;
use Schooldb;
-- 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 
create table teachers(
	id int primary key not null,
	name varchar(50),
	subject varchar(50),
	experience decimal(5,2),
	salary decimal(10,2)
);
insert into teachers(id,name,subject,experience,salary)
values
(1,'John Doe', 'Math', 5, 50000),
(2,'Jane Smith', 'Science', 8, 55000),
(3,'David Brown', 'History', 3, 40000),
(4,'Emily White', 'English', 12, 60000),
(5,'Michael Green', 'Geography', 15, 65000),
(6,'Sophia Black', 'Chemistry', 6, 52000),
(7,'James Blue', 'Physics', 9, 58000),
(8,'Olivia Gray', 'Biology', 2, 45000);

select * from teachers;

-- 2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero.
delimiter //
create trigger before_insert_teacher
before insert on teachers
for each row
begin
	if new.salary < 0 then
	signal sqlstate '45000'
	set message_text = 'salary cannot be negative';
	end if;
end //
delimiter ;

-- 3.Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted.

create table teacher_log(
teacher_id int,
action varchar(50),
timestamp timestamp default current_timestamp
);
delimiter //
create trigger after_insert_teacher
after insert on teachers
for each row
begin
	insert into teacher_log (teacher_id,action,timestamp)
    values(new.id,'insert',now());
end //
delimiter ;

-- 4.Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years.
delimiter //
create trigger before_delete_teacher
before delete on teachers
for each row
begin
	if old.experience > 10 then
	signal sqlstate '45000'
	set message_text = 'Cannot delete teachers with more than 10 years of experience';
	end if;
end //
delimiter ;

-- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
delimiter //
create trigger after_delete_teacher
after delete on teachers
for each row
begin
	insert into teacher_log (teacher_id,action,timestamp)
    values(old.id,'delete',now());
end //
delimiter ;


