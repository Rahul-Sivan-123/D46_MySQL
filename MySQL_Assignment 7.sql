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

-- 1.Add a new column called DOB in Persons table with data type as Date
alter table persons
add DOB date;

-- 2.Write a user-defined function to calculate age using DOB.
delimiter //
create function Calculate_Age (DOB date)
returns int
deterministic
no sql
begin
return timestampdiff(year, DOB, curdate());
end //
delimiter ;

-- 3.Write a select query to fetch the Age of all persons using the function that has been created.
-- Update table
update persons set DOB ='2001-06-08'where Id=1;
update persons set DOB='2005-08-10' where Id=2;
update persons set DOB='1995-08-28' where Id=3;
update persons set DOB='2003-09-06'where Id=4;
update persons set DOB='1991-09-05' where Id=5;
update persons set DOB='2005-08-18' where Id=6;
update persons set DOB='2008-09-14' where Id=7;
update persons set DOB='1990-06-15' where Id=8;
update persons set DOB ='2001-07-09' where Id=9;
update persons set DOB='2004-09-28' where Id=10;

select Id, Fname, Lname, DOB, Calculate_Age(DOB) as Age from persons;

-- 4. Find the length of each country name in the Country table.
select Country_name, length(Country_name) as country_name_length from country;

-- 5. Extract the first three characters of each country's name in the Country table.
select Country_id, Country_name, left(Country_name,3) as Three_letters_country_name from country;

-- 6.  Convert all country names to uppercase and lowercase in the Country table.
 select Country_id, Country_name, upper(Country_name) as upper_countryname, lower(Country_name) as lower_countryname from country;
