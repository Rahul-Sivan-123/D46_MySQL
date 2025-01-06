Create database country_population;
use country_population;

create table Country(
Country_Id int primary key not null,
Country_name varchar(50) ,
Population bigint not null,
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

-- 1.Perform Inner Join, Left Join, and Right Join on the tables:
-- Inner Join
select * from country c inner join persons p on c.Country_id = p.Country_id;
-- Left Join
select * from country c left join persons p on c.Country_id = p.Country_id;
-- Right Join
select * from country c right join persons p on c.Country_id = p.Country_id;

-- 2.List all distinct country names from both the Country and Persons tables
select distinct Country_name from country
union
select distinct  Country_name from persons;

-- 3.List all country names from both the Country and Persons tables, including duplicates
select Country_name from country
union all
select Country_name from persons;

-- 4.Round the ratings of all persons to the nearest integer in the Persons table
update Persons
set rating = round(rating);
