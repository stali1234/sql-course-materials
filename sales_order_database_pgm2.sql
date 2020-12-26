create schema sales_ordr_database;
use sales_ordr_database;

create table salesman(
	sm_id int primary key,
    sm_name varchar(50),
    sm_city varchar(30),
    commission int
);

create table customer(
	c_id int primary key,
    c_name varchar(50),
    c_city varchar(30),
    c_grade int ,
    sm_id int,
    foreign key (sm_id) references salesman(sm_id) on delete cascade
);

create table order_details(
	or_no int primary key,
    purchase_amt int,
    or_date date,
    c_id int,
    sm_id int,
    foreign key (c_id) references customer(c_id) on delete cascade,
    foreign key (sm_id) references salesman(sm_id) on delete cascade
);
-- sales man entry
describe salesman;
insert into salesman values (1,'rayan', 'bangalore', 0.25);
insert into salesman values (2,'stalin', 'bangalore', 0.20);
insert into salesman values (3,'ghouse', 'bangalore', 0.15);
insert into salesman values (4,'ramesh', 'mysore', 0.10);

insert into salesman values (5,'raju', 'gulbarga', 0.20);

-- entering into customer table
describe customer;
insert into customer values (1,'rajesh', 'bangalore', 95, 1 );
insert into customer values (3,'manu', 'bangalore', 75, 5 );
insert into customer values (2,'murali', 'mysore', 95, 2 );
insert into customer values (4,'mojo', 'gulbarga', 95, 4 );
insert into customer values (9,'passive', 'mysore', 95, 3 );
insert into customer values (5,'ramu', 'bangalore', 55, 2 );
insert into customer values (6,'rajan', 'gokarna', 95, 1 );
insert into customer values (7,'shakuntala', 'hubli', 95, 1 );
insert into customer values (8,'avni', 'xyz', 95, 1 );
insert into customer values (10,'geeta', 'aaa', 95, 1 );

-- entering the values into order details table
describe order_details;
insert into order_details values (1, 2000, '2020-01-01', 2,3);
insert into order_details values (3, 2330, '2020-05-02', 4,2);
insert into order_details values (2, 5000, '2020-01-04', 9,1);
insert into order_details values (4, 4000, '2020-04-07', 2,5);
insert into order_details values (5, 2300, '2020-01-06', 4,3);
insert into order_details values (6, 2008, '2020-05-07', 1,4);
insert into order_details values (7, 3000, '2020-05-07', 5,2);

-- queries
-- 1 
select c_grade, count(distinct c_id) as 'customer above average'
from customer ,salesman
group by c_grade
having c_grade > (
select avg(c_grade) 
from customer 
where c_city = 'bangalore'
);

select avg(c_grade) as 'average customer grade in bangalore'
from customer 
where c_city = 'bangalore';

select sm_name as 'salesman name', sm_id as 'salesman id' 
from salesman a
where 1 > (
select count(*)  
from customer 
where a.sm_id = sm_id
);
--  query number two 
select s.sm_id as "salesman id ",s.sm_name as "salesman name",count(s.sm_name) as "customer count"
from customer as c, salesman as s 
where c.sm_id = s.sm_id
group by s.sm_id;

-- Query number three
select distinct s.sm_id , s.sm_name
from customer as c, salesman as s 
where c.sm_id = s.sm_id and c.c_city = s.sm_city;
select  distinct s.sm_id , sm_name
from customer as c, salesman as s 
where c.sm_id = s.sm_id and c.c_city != s.sm_city
order by sm_id;

select distinct s.sm_id, s.sm_name ,(case 
			when s.sm_city = c.c_city then "Yes"
            else "No"
            end) as "same city customer"
from customer as c , salesman as s
where s.sm_id = c.sm_id 
group by s.sm_id;

-- Query number 3

-- create view [Highest Sales] as 
create view bestsalesemp as
select or_date ,o.sm_id,s.sm_name, max(purchase_amt)
from order_details as o, salesman as s
where o.sm_id = s.sm_id
group by or_date;

select * from bestsalesemp;

-- query number 4
describe  salesman;
describe order_details;
insert into salesman values (1000,'Charan', 'bangalore',0.20);
insert into order_details values (12,2000,'2020-02-01',3,1000);

delete from salesman where sm_id = 1000;

-- Show the entire schema 

 



