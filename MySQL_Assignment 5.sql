Create database country_population;
use country_population;

create table Country(
Id int primary key not null,
Country_name varchar(50) not null,
Population bigint not null,
Area float
);

create table Persons(
Id int primary key not null,
Fname varchar(50) not null,
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

Select * from Country;

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

Select * from Persons;

-- 1.Print the first three characters of Country_name from the Country table
select left(Country_name,3) as First_Three_Chars from Country;

-- 2.Concatenate first name and last name from Persons table:
select concat(Fname,' ', Lname) as Full_name from Persons;

-- 3.Count the number of unique country names from Persons table
select count(distinct Country_name) as Unique_Country_Name from Persons;

-- 4.Print the maximum population from the Country table
select  max(population) as max_population from Country;

-- 5.Print the minimum population from Persons table
select min(population) as min_population from Persons;

-- 6.Insert 2 new rows to the Persons table making the Lname NULL and count Lname
insert into Persons (Id, Fname, Lname, Population, Rating, Country_id, Country_name)
values
(11, 'Isaac', NULL, 900, 3.5, 1, 'India'), 
(12, 'Jack', NULL, 800, 3.4, 2, 'Australia');

select count(Lname) as Count_Lname from Persons;

-- 7.Find the number of rows in the Persons table
select count(*) as Row_numbers from Persons;

-- 8.Show the population of the Country table for the first 3 rows
select population as Population from Country limit 3; 

-- 9.Print 3 random rows of countries
select * from country order by rand() limit 3;

-- 10.List all persons ordered by their rating in descending order
select * from Persons order by rating desc;

-- 11.Find the total population for each country in the Persons table
select Country_name, sum(population) as Total_Population from Persons group by Country_name;

-- 12.Find countries in the Persons table with a total population greater than 50,000
select Country_name from Persons group by country_name having sum(population)>50000;

-- 13.List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order
select country_name, count(*) as Total_Persons, avg(Rating) as Avg_Rating
from Persons group by  country_name having count(*) >2 order by avg(Rating) asc;

