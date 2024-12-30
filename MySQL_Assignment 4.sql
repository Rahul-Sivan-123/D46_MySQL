create database Population_database;
use Population_database;

create table Country(
Id int auto_increment primary key not null,
Country_name varchar(50) not null,
Population bigint not null,
Area bigint not null
);

create table Persons(
Id int auto_increment primary key not null,
Fname varchar(50) not null,
Lname varchar(50) not null,
Population bigint not null,
Rating decimal(3, 1),
Country_Id int not null,
Country_name varchar(50) not null
);

insert into Country (Country_name, Population, Area)
values
('USA', 331002651, 9833520),
('Canada', 37742154, 9984670),
('UK', 67886011, 243610),
('Australia', 25499884, 7692024), 
('India', 1380004385, 3287263), 
('Germany', 83783942, 357022), 
('France', 65273511, 551695),
('Italy', 60461826, 301340);

select * from Country;

insert into Persons (Fname, Lname, Population, Rating, Country_Id, Country_name)
values
('John', 'Doe', 331002651, 4.3, 1, 'USA'), 
('Jane', 'Smith', 37742154, 3.9, 2, 'Canada'), 
('Alice', 'John', 67886011, 4.7, 3, 'UK'), 
('Chris', 'Brown', 25499884, 2.8, 4, 'Australia'), 
('Steve', 'Davis', 1380004385, 4.2, 5, 'India'), 
('Emma', 'Watson', 83783942, 4.1, 6, 'Germany'), 
('Frank', 'Wil', 65273511, 3.5, 7, 'France'), 
('Grace', 'Moore', 60461826, 4.6, 8, 'Italy');

select * from Persons;

--  List the distinct country names from the Persons table
select Country_name from Persons;

-- Select first names and last names from the Persons table with aliases.
select Fname as First_name,Lname as Last_name from Persons;

-- Find all persons with a rating greater than 4.0.
select * from Persons where rating>4;

-- Find countries with a population greater than 10 lakhs.
select * from Country where population>1000000;

-- Find persons who are from 'USA' or have a rating greater than 4.5.
select * from Persons where country_name ='USA' or rating>4.5;

-- Find all persons where the country name is NULL.
select * from persons where country_name is null;

-- Find all persons from the countries 'USA', 'Canada', and 'UK'. 
select * from Persons where country_name in('USA', 'Canada', 'UK');

-- Find all persons not from the countries 'India' and 'Australia'.
select * from Persons where country_name not in('India', 'Australia');

-- Find all countries with a population between 5 lakhs and 20 lakhs.
select * from Country where population between 500000 and 2000000;

-- Find all countries whose names do not start with 'C'.
select * from Country where country_name not like 'C%';