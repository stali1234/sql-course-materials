create schema company_database;
use company_database;

drop table employee;

create table employee(
	ssn int primary key,
    emp_name varchar(50),
    address varchar(100),
    sex varchar(2),
    salary int,
    superssn int,
    dno int,
    foreign key (superssn) references employee(ssn) on delete cascade
);

create table department(
	dno int primary key,
    dname varchar(30),
    mgrssn int,
    mgrstartdate date
    -- foreign key (mgrssn) references employee(ssn)
);
alter table department 
add constraint foreign key (mgrssn) references employee(ssn);



alter table employee
add constraint foreign key (dno) references department(dno);

create table d_location(
	dno int,
    dloc varchar(100),
	constraint dno_location foreign key (dno) references department(dno),
    primary key(dno,dloc)
);

create table project(
	pno int primary key,
    pname varchar(50),
    plocation varchar(100),
    dno int,
    foreign key (dno) references department(dno)
);

create table works_on(
	pno int,
    ssn int,
    hours int,
    foreign key (pno) references project(pno),
    foreign key (ssn) references employee(ssn),
    primary key (ssn,pno,hours)
);

-- Entering the data 
describe department;
insert into department (dno,dname,mgrstartdate) values (
	0,'Accounts','2020-01-02'
);
insert into department (dno,dname,mgrstartdate) values (1,'Medical','2020-02-01'),
							(2,'Engineering','2010-09-09'),
                            (3,'Cooking','2020-01-02'),
                            (4,'Cleaning','2020-04-03'),
                            (5,'Washing','2019-12-12');
                            
describe employee;                            
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values (
	0,'James Scott','711-2880 Nulla St.
Mankato Mississippi 96522','M', 200000,1);
describe employee;
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values (
	1,'Iris Watson','P.O. Box 283 8562 Fusce Rd.
Frederick Nebraska 20620','F', 300000, 1);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(2,'Celeste Slater','606-3727 Ullamcorper. Street
Roseville NH 11523','M', 500000,2);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(3,'Theodore Lowe','Ap #867-859 Sit Rd.
Azusa New York 3953','F', 1000000, 0);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(4,'Calista Wise','7292 Dictum Av.
San Antonio MI 47096','F', 900000, 4);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(5,'Kyla Olsen','Ap #651-8679 Sodales Av.
Tamuning PA 10855','F', 800000, 1);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(6,'Forrest Ray','191-103 Integer Rd.
Corona New Mexico 08219','F', 600000, 1);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(7,'Hiroko Potter','P.O. Box 887 2508 Dolor. Av.
Muskegon KY 12482','F', 200000, 1);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(8,'Nyssa Vazquez','511-5762 At Rd.
Chelsea MI 67708
(947) 278-5929','F', 800000,1);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(9,'Lawrence Moreno','935-9940 Tortor. Street
Santa Rosa MN 98804
','F', 560000, 2);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(10,'Ina Moran','P.O. Box 929 4189 Nunc Road
Lebanon KY 69409','M', 1000000, 3);
insert into employee (ssn ,emp_name,address,sex ,salary ,dno ) values
(11,'Aaron Hawkins','5587 Nunc. Avenue
Erie Rhode Island 24975','F', 300000, 4);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(16,'rayan Sailani','Ap #696-3279 Viverra. Avenue
Latrobe DE 38100','M', 1030000, 0);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(13,'Ramesh','Ap #696-3279 Viverra. Avenue
Latrobe DE 38100','M', 30000, 1);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(14,'Rajesh','Ap #696-3279 Viverra. Avenue
Latrobe DE 38100','M', 10000, 0);
insert into employee(ssn ,emp_name,address,sex ,salary ,dno ) values
(15,'Stalin','Ap #696-3279 Viverra. Avenue
Latrobe DE 38100','M', 120000, 0);

update employee set superssn = 1 where ssn= 2;
update employee set superssn = 2 where ssn= 0;
update employee set superssn = 3 where ssn= 1;
update employee set superssn = 5 where ssn= 3;
update employee set superssn = 6 where ssn= 4;
update employee set superssn = 1 where ssn= 5;
update employee set superssn = 7 where ssn= 6;
update employee set superssn = 3 where ssn= 7;
update employee set superssn = 7 where ssn= 8;
update employee set superssn = 2 where ssn= 9;
update employee set superssn = 7 where ssn= 10;
update employee set superssn = 12 where ssn= 11;
update employee set superssn = 3 where ssn= 12;

update department set mgrssn = 0 where dno = 1;
update department set mgrssn = 1 where dno = 0;
update department set mgrssn = 4 where dno = 2;
update department set mgrssn = 4 where dno = 3;
update department set mgrssn = 9 where dno = 4;
update department set mgrssn = 12 where dno = 5;


insert into d_location values (0,"New York");
insert into d_location values (1,"Armania");
insert into d_location values (2,"Seattle");
insert into d_location values (3,"Austria");
insert into d_location values (4,"Wisconsin");
insert into d_location values (5,"London");

describe project;
insert into project values (0,'producta','Australia',1);
insert into project values (1,'productb','Middle East',2);
insert into project values (2,'productc','England',3);
insert into project values (3,'productd','Morocco',4);
insert into project values (4,'producte','Maldives',5);
insert into project values (5,'productf','Barcalona',0);

describe works_on;
insert into works_on values (0,1,12);
insert into works_on values (1,2,14);
insert into works_on values (2,3,11);
insert into works_on values (3,4,9);
insert into works_on values (4,5,14);
insert into works_on values (5,6,7);	
insert into works_on values (5,7,15);
insert into works_on values (0,8,12);
insert into works_on values (1,9,12);
insert into works_on values (3,10,16);
insert into works_on values (5,11,18);
insert into works_on values (5,12,15);
insert into works_on values (1,0,14);
insert into works_on values (4,0,11);
insert into works_on values (2,0,19);

-- queries 1
-- 1 Make a list of all project numbers for projects that involve an employee whose last name is ‘Scott’, either as a worker or as a manager of the department that controls the project.
select pno, emp_name
from employee join works_on using (ssn)
where emp_name like '%Scott'
union
select pno, emp_name 
from project, employee, department
where project.dno = department.dno
and department.mgrssn = employee.ssn 
and emp_name like "%Scott";


update project set pname = "Iot" where pno = 2;

select project.pno, emp_name, salary*1.1 as "Increased salary" 
from project join works_on using (pno) join employee using (ssn)
where project.pname = 'Iot';

select sum(salary), max(salary), min(salary)
from employee join department using (dno)
where department.dname = "Accounts";

SELECT e.emp_name
FROM employee as e
WHERE
 NOT EXISTS( SELECT DISTINCT
 *
 FROM
 project p,
 works_on w
 WHERE
 w.pno = p.pno AND p.dno = 5
 AND NOT EXISTS( SELECT *
 FROM works_on w1
 WHERE e.ssn = w1.ssn AND w1.pno = w.pno));							
                            
select dno , count(*) as "Employee that earn more than 6,00,000"
from department join employee using (dno)
where employee.salary  > 600000 and  department.dno in (select dno from employee group by dno having count(*) > 5) 
group by dno;
