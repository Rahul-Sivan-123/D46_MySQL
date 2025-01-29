Create database country_population;
use country_population;

create table Country(
Country_Id int primary key not null,
Country_name varchar(50) ,
Population bigint ,
Area float
);

create table Persons(
Id int primary key not null,
Fname varchar(50),
Lname varchar(50),
Population bigint not null,
Rating float,
Country_Id int not null,
Country_name varchar(50) not null
);

desc Country;
desc Persons;

insert into Country
values
(1, 'Qatar', 2780000, 11586), 
(2, 'India', 1380004385, 3287263), 
(3, 'United States', 331002651, 9833517), 
(4, 'Brazil', 212559417, 8515767), 
(5, 'Russia', 145934462, 17098242), 
(6, 'Japan', 126476461, 377975), 
(7, 'Germany', 83783942, 357386), 
(8, 'France', 65273511, 551695), 
(9, 'United Kingdom', 67886011, 243610), 
(10, 'Australia', 25499884, 7692024);

insert into Persons (Id, Fname, Lname, Population, Rating, Country_id, Country_name)
values
(1, 'John', 'Doe', 331002651, 4.3, 1, 'USA'), 
(2, 'Jane', 'Smith', 37742154, 3.9, 2, 'Canada'), 
(3, 'Alice', 'John', 67886011, 4.7, 3, 'UK'), 
(4, 'Chris', 'Brown', 25499884, 2.8, 4, 'Australia'), 
(5, 'Steve', 'Davis', 1380004385, 4.2, 5, 'India'), 
(6, 'Emma', 'Watson', 83783942, 4.1, 6, 'Germany'), 
(7, 'Frank', 'Wil', 65273511, 3.5, 7, 'France'), 
(8, 'Grace', 'Moore', 60461826, 4.6, 8, 'Italy'),
(9, 'Laura', 'Wilson', 65273511, 4.3, 8, 'China'),
(10, 'Hank', 'Martin', 1100, 3.6, 10, 'Nigeria');

select * from Country;
select * from persons;

-- 1.Find the number of persons in each country.
select country.country_name,count(*) as num_of_persons from persons
join Country 
on persons.Country_Id = Country.Country_Id
group by Country_name;

-- 2. Find the number of persons in each country sorted from high to low.
select country.country_name,count(*) as num_of_persons from persons
join Country 
on persons.Country_Id = Country.Country_Id
group by Country_name
order by num_of_persons desc;

-- 3.Find out an average rating for Persons in respective countries if the average is greater than 3.0
select country.country_name,avg(rating) as Avg_rating from persons
join Country 
on persons.Country_Id = Country.Country_Id
group by Country_name
having Avg_rating>3.0;

-- 4.Find the countries with the same rating as the USA. (Use Subqueries) 
select Country_name 
from persons 
where Rating = (select Rating from persons where country_id= 1);

-- 5.Select all countries whose population is greater than the average population of all nations.
select Country_name
from country
where population > (select avg(population) from country);

-- Create a Database named Product 
create database Product;
use Product;

-- Create Customer table
create table Customer (
    Customer_Id int auto_increment primary key,
    First_name varchar(100) not null,
    Last_name varchar(100) not null,
    Email varchar(100) not null,
    Phone_no varchar(20),
    Address varchar(200),
    City varchar(100),
    State varchar(100),
    Zip_code varchar(20),
    Country varchar(100)
);

-- Insert sample data into Customer table
INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) 
VALUES
('Lucy', 'Doe', 'lucydoe@example.com', '555-1234', '123 Main St', 'Los Angeles', 'California', '90001', 'USA'),
('Jane', 'Smith', 'janesmith@example.com', '555-5678', '456 Oak St', 'San Francisco', 'California', '94101', 'USA'),
('Steve', 'Bird', 'steve@example.com', '555-9876', '789 Pine St', 'Miami', 'Florida', '33101', 'USA'),
('Anna', 'shah', 'anna@example.com', '555-3456', '321 Maple St', 'Berlin', 'Berlin', '10115', 'Germany'),
('Ravi', 'Kumar', 'ravi@example.com', '555-6543', '654 Elm St', 'Mumbai', 'Maharashtra', '400001', 'India'),
('Oliver', 'Brown', 'oliver@example.com', '555-8765', '987 Cedar St', 'London', 'England', 'E1 6AN', 'UK'),
('Katie', 'perrie', 'pierre@example.com', '555-4321', '321 Birch St', 'Paris', 'Île-de-France', '75001', 'France');

-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view
create view customer_info as 
select concat(First_name,' ',Last_name) as Full_name, Email from customer;

-- 2. Create a view named US_Customers that displays customers located in the US.
create view US_Customers as
select * from customer where country='USA';
select * from US_Customers;

-- 3.Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.
create view customer_details as 
select concat(First_name,' ',Last_name) as Full_name, Email, Phone_no, State from customer;
select * from customer_details;

-- 4. Update phone numbers of customers who live in California for Customer_details view.
update Customer
set Phone_no= '505-2341'
where State='California';
select * from customer_details;

-- 5. Count the number of customers in each state and show only states with more than 5 customers.
select state, count(*) as num_of_customers 
from Customer 
group by State
having count(*)>5;

-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.
select state, count(*) as num_of_customers 
from customer_details
group by State;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.

select * from customer_details
order by State desc;

