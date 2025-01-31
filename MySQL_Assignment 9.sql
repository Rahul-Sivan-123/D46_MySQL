create database workerdb;
use workerdb;

create table Worker (
    Worker_Id int primary key,
    FirstName char(25),
    LastName char(25),
    Salary int,
    JoiningDate datetime,
    Department char(25)
);
 
 -- 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call. 
 delimiter //
 create procedure Addworker(
 in p_worker_id int,
 in p_Firstname char(25),
 in p_Lastname char(25),
 in p_Salary int,
 in p_JoiningDate datetime,
 in p_Department char(25)
 )
  begin
   insert into Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
   values (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
  end //
delimiter ;
 call AddWorker (1, 'Jamie', 'Lever', 50000, '2023-01-01 09:00:00', 'HR');
 select * from worker;
 
  -- 2.Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call. 
delimiter //
 create procedure workerid_salary(
 in p_worker_id int,
 out p_Salary int)
 begin
 select salary into p_Salary 
 from worker
 where worker_id=p_worker_id;
 end //
 delimiter ;
 call workerid_salary (1,@Salary);
 select @salary;
 
 -- 3.Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call. 
 Delimiter //
 create procedure workerid_Department(
 in p_worker_id int,
 in p_Department char(25)
 )
 begin
 update worker
 set Department=p_Department
 where worker_id=p_worker_id;
 end //
 delimiter ;
 call workerid_Department (1, 'HR');
 
 -- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 
 Delimiter //
 create procedure Department_workercount(
 in p_Department char(25),
 out p_workercount int
 )
 begin
select count(*) into  p_workercount
from worker
where department=p_Department;
end //
 delimiter ;
 call Department_workercount('FINANCE', @p_workercount);
 select @p_workercount;
 
 -- 5.Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.
 Delimiter //
 create procedure Department_avgsalary(
 in p_Department char(25),
 out p_avgsalary decimal(10,2)
 )
 begin
 select avg(salary) into p_avgsalary
 from worker
 where department=p_Department;
 end //
 delimiter ;
 call Department_avgsalary('HR', @p_avgsalary);
 select @p_avgsalary;

 