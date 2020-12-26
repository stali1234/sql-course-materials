create schema college_database;
use college_database;
drop schema college_database;
CREATE TABLE students (
 usn VARCHAR(20) ,
 sname VARCHAR(20),
 address VARCHAR(20),
 phone VARCHAR(10),
 gender CHAR(1),
 PRIMARY KEY (usn)
);

CREATE TABLE semsec (
 ssid INT,
 sem INT,
 section CHAR(1),
 PRIMARY KEY (ssid)
);

CREATE TABLE class (
 usn VARCHAR(20),
 ssid INT,
 FOREIGN KEY (ssid)
 REFERENCES semsec (ssid)
 ON DELETE CASCADE,
 FOREIGN KEY (usn)
 REFERENCES students (usn)
 ON DELETE CASCADE,
 PRIMARY KEY (usn,ssid)
);
CREATE TABLE sub (
 subcode VARCHAR(20) PRIMARY KEY,
 title VARCHAR(30),
 sem INT,
 credits INT
);
CREATE TABLE iamarks (
 usn VARCHAR(20),
 subcode VARCHAR(20),
 ssid INT,
 test1 INT,
 test2 INT,
 test3 INT,
 final INT,
 PRIMARY KEY (usn , subcode , ssid),
 FOREIGN KEY (usn)
 REFERENCES students (usn)
 ON DELETE CASCADE,
 FOREIGN KEY (subcode)
 REFERENCES sub (subcode)
 ON DELETE CASCADE,
 FOREIGN KEY (ssid)
 REFERENCES semsec (ssid)
  ON DELETE CASCADE
);


insert into students (usn, sname, address, phone, gender) values
("1CR17IS01","Ajith","Bangalore",1010101010,'M'),
("1CR17IS02","Barat","Mysore",2020202020,'M'),
("1CR17IS03","Clara","Delhi",303030303,'F'),
("1CR17IS04","Denis","Pune",4040404040,'M'),
("1CR17IS05","Elisa","Patna",505050505,'F'),
("1CR17IS06","Franc","Mumbai",6060606060,'M'),
("1CR17IS07","Gaury","Bangalore",077777777,'F'),
("1CR17IS08","Harry","Kolkatta",88888870,'M'),
("1CR17IS09","Isaac","Dehradun",9090909090,'M'),
("1CR17IS010","Jay","Sikkim",111110000,'M');

insert into students(usn, sname, address, phone, gender) values
("1CR16IS41","Aman","Manipal",110110110,'M'),
("1CR16IS42","Barka","Hyderabad",1212121212,'F'),
("1CR16IS43","Chahana","Chennai",1313131313,'F'),
("1CR16IS44","Deepa","Coimbatore",1414141141,'F'),
("1CR16IS45","Emad","Mumbai",15151515,'M'),
("1CR16IS46","Faroq","Chennai",1616161616,'M'),
("1CR16IS47","Ganga","Coimbatore",17171717,'F'),
("1CR16IS48","Hemalatha","Hyderabad",1818181818,'F'),
("1CR16IS49","Inder","Bangalore",1919191919,'M'),
("1CR16IS50","Jamal","Patna",2202020202,'M');

insert into students(usn, sname, address, phone, gender) values
("1CR15IS61","Arti","Pune",2121212121,'F'),
("1CR15IS62","Barti","Delhi",2202202201,'F'),
("1CR15IS63","Ceaser","Mysore",212121212,'M'),
("1CR15IS64","Dia","Mysore",222222222,'F'),
("1CR15IS65","Elmsri","Bangalore",2323232323,'M'),
("1CR15IS67","Geetha","Bangalore",252525252,'F'),
("1CR15IS68","Harish","Bangalore",565656565,'M'),
("1CR15IS69","Iman","Bangalore",2929292929,'M'),
("1CR15IS70","Jibin","Mysore",990990909,'M'),
("1CR15IS71","Kruthi","Mysore",6767676767,'F'),
("1CR15IS72","Lara","Pune",3030303030,'F');


insert into students(usn, sname, address, phone, gender) values
("1CR14IS82", "Beema", "New Delhi", 3232323232, 'M'),
("1CR14IS83", "Chitra", "Pune",3333333333, 'F'),
("1CR14IS84", "Dipika", "Patna", 3434343434, 'F'),
("1CR14IS85", "Elizabeth", "Mumbai", 2353535355, 'F'),
("1CR14IS86", "Fakruddin", "Mumbai", 363663663, 'M'),
("1CR14IS87", "Gary", "Bangalore", 3737373737, 'M'),
("1CR14IS88", "Hema", "Kolkatta", 3838383838, 'M'),
("1CR14IS89", "Ishana", "Dehradun", 3939393939, 'F'),
("1CR14IS90", "Jason", "Manipal", 4040404040, 'M'),
("1CR14IS91", "Kirana", "Hyderabad", 4949494949, 'F'),
("1CR14IS92", "Lucky", "Chennai", 454545545, 'F');

insert into students(usn, sname, address, phone, gender) values 
("11XX1234", "Rayan", "Bangalore", 454545545, 'M');
insert into semsec (ssid, sem,
section) values (1,2,'A'),
(2,2,'B'), (3,2,'C'), (4,4,'A'),
(5,4,'B'), (6,4,'C'), (7,6,'A'),
(8,6,'B'), (9,6,'C'), (10,8,'A'),
(11,8,'B'), (12,8,'C');

describe class;
insert into class(usn,ssid) values ("1CR17IS01",'1'), ("1CR17IS02",'1'), ("1CR17IS03",'1'),
("1CR17IS04",'2'),("1CR17IS05",'2'),("1CR17IS06",'2'),
("1CR17IS07",'3'),("1CR17IS08",'3'),("1CR17IS09",'3');
insert into class(usn,ssid) values ("1CR16IS41",'4'), ("1CR16IS42",'4'), ("1CR16IS43",'4'),
("1CR16IS44",'4'),("1CR16IS45",'5'),("1CR16IS46",'5'),("1CR16IS47",'6'),("1CR16IS48"
,'6'),("1CR16IS49",'6'),("1CR16IS50",'6');
insert into class(usn,ssid) values("1CR15IS62",'7');
insert into class(usn,ssid) values ("1CR15IS63",'7');
insert into class(usn,ssid) values
("1CR15IS64",'8');
insert into class(usn,ssid) values
("1CR15IS65",'8');
insert into class(usn,ssid) values("1CR15IS67",9),
insert into class(usn,ssid) values ("1CR15IS68",9);
insert into class(usn,ssid) values ("1CR15IS69",9);
insert into class(usn,ssid) values("1CR15IS70",9);
insert into class(usn,ssid) values("1CR15IS71",9);
insert into class(usn,ssid) values("1CR15IS72",9);
insert into class(usn,ssid) values("1CR14IS81",10);
insert into class(usn,ssid) values("1CR14IS82",10);
insert into class(usn,ssid) values("11XX1234",10);

insert into sub(subcode,title,sem,credits) values ("15PCD23","PCD",2,4),
("15CHE21","CHEM",2,4), ("15ELN22","Basic Electronics",2,4),
("15MAT24","Maths",2,4), ("15CS42","SE",4,4), ("15CS43","DAA",4,4),
("15CS44","MP",4,4), ("15CS46","DC",4,4), ("15CS61","Cryptography",6,4),
("15CS62","CGV",6,4), ("15CS63","SS",6,4), ("15CS64","OS",6,4),
("15CS81","IOT",8,4), ("15CS82","Big Data Analytics",8,4), ("15CS834","SMS",8,4),
("15CS86","Seminar",8,4);

insert into iamarks(usn,subcode,ssid,test1,test2,test3)values
("11XX1234","15CS834",10,15,16,20),("1CR14IS81","15CS86",10,20,19,18);

insert into iamarks(usn,subcode,ssid,test1,test2,test3)values
("11XX1234","15CHE21",1,11,12,13),("1CR17IS01","15ELN22",1,13,14,15),("1CR17IS01","15MAT24",1,16,17,18),("1CR16IS41","15CS42",4,19,20,19),("1CR16IS41","15CS43",4,20,20,20),("1CR16IS41","15CS44",4,7,9,10),("1CR16IS41","15CS46",4,10,15,20),("1CR15IS61","15CS61",7,8,12,16),("1CR15IS61","15CS62",7,9,13,17),("1CR15IS61","15CS63",7,10,14,18),("1CR15IS61","15CS64",7,11,15,19),("1CR14IS81","15CS81",10,16,14,20),("1CR14IS81","15CS82",10,20,12,13),("1CR14IS81","15CS834",10,15,16,20),("1CR14IS81","15CS86",10,20,19,18);
insert into
iamarks(usn,subcode,ssid,test1,test2,test3)values("1CR14IS82","15CS81",10,12,15,18),
("11XX1234","15CS82",10,13,20,12),("1CR14IS82","15CS834",10,15,16,10),("1CR14IS82","15CS86",10,12,9,8);

-- queries
select * 
from students join class using (usn) join semsec using (ssid)
where semsec.sem = 4 and semsec.section = "C";

select semsec.sem, semsec.section, students.gender, count(*)
from students join class using (usn) join semsec using (ssid)
group by semsec.sem , semsec.section , students.gender;


create view test_marks1 as 
select subcode , test1
from sub join iamarks using (subcode) join students using (usn)
where students.usn = '11XX1234';

CREATE TRIGGER `finaliamarks`
BEFORE INSERT
ON `iamarks`
FOR EACH ROW
set new.final=(((new.test1+new.test2+new.test3) -least(new.test1,new.test2,new.test3))/2);

SELECT
 i.usn,
 s.sem,
 s.section,
 i.subcode,
 CASE
 WHEN final >= 17 AND final <= 20 THEN 'Outstanding'
 WHEN final >= 12 AND final <= 16 THEN 'Average'
 ELSE 'Weak'
 END AS CAT
FROM
 iamarks i,
 class c,
 semsec s
WHERE
 i.usn = c.usn AND c.ssid = s.ssid
 AND s.sem = 8
 AND s.section IN ('A' , 'B', 'C');
