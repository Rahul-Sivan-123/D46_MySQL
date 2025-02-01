create database library;
use library;
create table Branch(
Branch_no int primary key not null,
Manager_Id int,
Branch_address varchar(200),
Contact_no int);

alter table Branch
modify Contact_no bigint;
desc Branch;

insert into Branch (Branch_no, Manager_Id, Branch_address, Contact_no) 
values
(1, 101, '123 Main St, City', '9876543210'),
(2, 102, 'Brooklyn, Town', '9876543211'),
(3, 103, '45 Jiddah, Town', '9837239023'),
(4, 107, '23 Qatif St, Town', '8877843211'),
(5, 108, '21 Albert St, City', '1176545611'),
(6, 110, '4 Boy St, City', '0976543345');

create table Employee(
Emp_id int primary key not null,
Emp_name varchar(50),
Position varchar(100),
Salary decimal(10,2),
Branch_no int,
foreign key (Branch_no) references Branch (Branch_no));

insert into Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) 
values 
(1, 'John Doe', 'Manager', 60000, 1),
(2, 'Jane Smith', 'Assistant', 40000, 1),
(3, 'Alice Brown', 'Manager', 70000, 2),
(4, 'Steve Bird', 'Assitant', 45000, 3),
(5, 'Katy Perry', 'Manager', 68000, 4),
(6, 'Derek Grim', 'Assitant', 75000, 1),
(7, 'Pete Brisk', 'Clerk', 69000, 1),
(8, 'Peter Brown', 'Clerk', 70000, 1);

update Employee
set Branch_no=1
where Emp_Id=5;
Select * from Employee;

create table Books(
ISBN varchar(13) primary key,
Book_title varchar(255),
Category varchar(100),
Rental_Price decimal(10, 2),
Status enum('yes', 'no'),
Author varchar(255),
Publisher varchar(255));

insert into Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) 
values 
('123-456-789', 'History of the World', 'History', 30.00, 'yes', 'John Smith', 'XYZ'),
('987-654-321', 'Learn SQL', 'Education', 20.00, 'no', 'Jane Doe', 'ABC'),
('345-654-211', 'Harry Potter', 'Fiction', 35.00, 'yes', 'Steve Bird', 'OXFORD'),
('555-879-091', 'Magic Spell', 'Thriller', 20.00, 'no', 'Jane Doe', 'ABC'),
('345-612-251', 'Sherlock Holmes', 'Thriller', 30.00, 'Yes', 'Jane Doe', 'ABC');

create table Customer(
Customer_Id int primary key,
Customer_name varchar(255),
Customer_address varchar(255),
Reg_date date);

insert into Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
values 
(1, 'Charlie Johnson', '789 Oak St, City', '2021-05-12'),
(2, 'Sophie Lee', '123 Pine St, Town', '2023-02-15'),
(3, 'John Wick', '435 Pine St, City', '2022-05-11'),
(4, 'George Thomas', '71 Pearl St, Town', '2023-06-21'),
(5, 'Brian Johnson', '333 Oasis St, City', '2024-05-08'),
(6, 'Peter Haris', '456 Khat St, City', '2024-08-12');

create table Issuestatus(
Issue_Id int primary key,
Issued_cust int,
Issued_book_name varchar(200),
Issue_date date,
ISBN_book varchar(13),
foreign key (Issued_cust) references Customer(Customer_Id),
foreign key (ISBN_book) references Books(ISBN));

insert into IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, ISBN_book) 
values
(21, 1, 'History of the World', '2023-01-10', '123-456-789'),
(22, 2, 'Harry Potter', '2022-06-12', '345-654-211'),
(23, 3, 'Learn SQL', '2023-01-10', '987-654-321'),
(24, 2, 'Magic Spell', '2023-01-10', '555-879-091'),
(25, 4, 'Sherlock Holmes', '2023-06-10', '345-612-251');

create table Returnstatus(
Return_Id int primary key,
Return_cust int,
Return_book_name varchar(250),
Return_date date,
ISBN_book2 varchar(13),
foreign key (Return_cust) references Customer(Customer_Id),
foreign key (ISBN_book2) references Books(ISBN));

insert into ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, ISBN_book2) 
values
(11, 1, 'History of the World', '2023-02-10', '123-456-789'),
(12, 2, 'Harry Potter', '2023-02-10', '345-654-211'),
(13, 3, 'Learn SQL', '2023-02-10', '987-654-321'),
(14, 2, 'Magic Spell', '2023-02-10', '555-879-091'),
(15, 4, 'Sherlock Holmes', '2023-02-10', '345-612-251');

-- 1.Retrieve the book title, category, and rental price of all available books.
select Book_title,Category,Rental_price from books where Status='yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
select Emp_name, Salary from Employee order by salary desc;

-- 3.Retrieve the book titles and the corresponding customers who have issued those books.
select b.Book_title, c.Customer_name
from Issuestatus i 
inner join Books b on i.ISBN_book=b.ISBN
inner join Customer c on i.Issued_cust=c.Customer_Id;

-- 4.Display the total count of books in each category.
select Category, count(*) as Book_Count from books group by Category;

-- 5.Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
select Emp_name, position from Employee where salary > 50000;

-- 6.List the customer names who registered before 2022-01-01 and have not issued any books yet.
select C.Customer_name
from Customer C
left join IssueStatus i on C.Customer_Id = i.Issued_cust and i.Issue_Id is null
where C.Reg_date < '2022-01-01';

-- 7.Display the branch numbers and the total count of employees in each branch. 
select branch_no, count(*) as TotalEmployee_Count from Branch group by branch_no;

-- 8.Display the names of customers who have issued books in the month of June 2023.
select distinct C.Customer_name
from Customer C
join IssueStatus i on C.Customer_Id = i.Issued_cust
where month(i.Issue_date) = 6 and year(i.Issue_date) = 2023;

-- 9.Retrieve book_title from book table containing history.
select book_title from books where book_title like'%history%';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
select branch_no,count(*) as employee_count from employee group by branch_no having employee_count>5;

-- 11.Retrieve the names of employees who manage branches and their respective branch addresses.
select E.emp_name, B.branch_address from Employee E 
join Branch B on E.Branch_no = B.Branch_no
where E.Position = 'Manager';

-- 12.Display the names of customers who have issued books with a rental price higher than Rs. 25.
select distinct C.Customer_name
from Customer C
join IssueStatus i on C.Customer_Id = i.Issued_cust
join Books B on i.ISBN_book = B.ISBN
where B.Rental_Price > 25;