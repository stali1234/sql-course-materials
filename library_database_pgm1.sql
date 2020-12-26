

create schema library_database;
use library_database;
-- since publisher doesn't refer to anything else it needs to be created first
create table publisher(
	pub_id int not null unique auto_increment,
    pub_name varchar(255) not null,
    address varchar(255),
    phone varchar(10),
    primary key (pub_name)
);
create table book(
	book_id int primary key,
    title varchar(255),
    pub_name varchar(255),
    pub_yr varchar(10),
    foreign key (pub_name) references publisher(pub_name) on delete cascade
);
-- since author refers to book id it needs  to be created after a book has been creadted
create table book_author(
	author_name varchar(255),
    book_id int,
    foreign key (book_id) references book(book_id) on delete cascade,
    primary key (book_id, author_name)
);

create table library_branch(
	branch_id int primary key,
    branch_name varchar(255),
    address varchar(255)
);
create table book_copies(
	book_id int,
    branch_id int,
    no_copies int,
    foreign key (book_id) references book(book_id) on delete cascade,
    foreign key (branch_id) references library_branch(branch_id) on delete cascade,
    primary key (book_id, branch_id)
);
create table card(
	card_no int primary key
);
create table book_lending(
	book_id int,
    branch_id int,
    card_no int,
    date_out date,
    due_date date,
    foreign key (book_id) references book(book_id) on delete cascade,
    foreign key (branch_id) references library_branch(branch_id) on delete cascade,
    foreign key (card_no) references card(card_no) on delete cascade,
    primary key (book_id, branch_id,card_no)
);
insert into publisher (pub_id , pub_name, address ,phone ) values
(456563635,"Pearson","#42th avenue 3rd main New York", "9982568324");
insert into publisher (pub_id , pub_name, address ,phone ) values
(89743895,"MCGraw HILL","#25th avenue 3rd main wall street", "9972568324");
insert into publisher (pub_id , pub_name, address ,phone ) values
(897423895,"Tharub publications","#25th HBR 9th main shivajinagar", "9972998324");
insert into publisher (pub_id , pub_name, address ,phone ) values
(34534534,"AM Padma Reddy","#32nd avenue road 3rd main bangalore", "9972598324");
insert into publisher (pub_id , pub_name, address ,phone ) values
(89743335,"Balaji Publications ","#55 avenue 4th hebbal kempapura", "9972563424");
describe book;
-- inserting book values 
insert into book (book_id, title, pub_name, pub_yr) values 
(0001, "AI",'Pearson','mar-2020');
insert into book (book_id, title, pub_name, pub_yr) values 
(0002, "Data structures" ,'Tharub publications','jan-1999');
insert into book (book_id, title, pub_name, pub_yr) values 
(0007, "Intro to C++" ,'AM Padma Reddy','feb-1986');
insert into book (book_id, title, pub_name, pub_yr) values 
(0009, "Levitin algorithms" ,'Balaji Publications ','jan-2019');
insert into book (book_id, title, pub_name, pub_yr) values 
(0010, "Computer Networks" ,'Pearson','jan-2017');

describe book_author;
-- entering book authors
insert into book_author (author_name, book_id) values 
("Rayan Sailani", 0001);
insert into book_author (author_name, book_id) values 
("Anne Frank", 0002);
insert into book_author (author_name, book_id) values 
("Elmasri Navathe", 0007);
insert into book_author (author_name, book_id) values 
("Stalin Sangeetharaj", 0009);
insert into book_author (author_name, book_id) values 
("Staurt Dhas", 0010);

-- entering lib branch
describe library_branch;
insert into library_branch(branch_id, branch_name, address) values
(001, "international library", "#25 3rd main hebbal kempapura");
insert into library_branch(branch_id, branch_name, address) values
(002, "national library", "#25 4th chelur");
insert into library_branch(branch_id, branch_name, address) values
(003, "valued library", "#25 4th avenue road");
insert into library_branch(branch_id, branch_name, address) values
(004, "armour enclave", "#25 4th mysore");
-- inserting book copies values 
describe book_copies;

insert into book_copies (book_id, branch_id, no_copies) values 
(0002, 001, 3);
insert into book_copies (book_id, branch_id, no_copies) values 
(0001, 001, 5);
insert into book_copies (book_id, branch_id, no_copies) values 
(0009, 003, 10);
insert into book_copies (book_id, branch_id, no_copies) values 
(0010, 004, 7);
insert into book_copies (book_id, branch_id, no_copies) values 
(0002, 003, 3);
insert into book_copies (book_id, branch_id, no_copies) values 
(0007, 001, 11);


-- inserting values in table card
insert into card (card_no) values 
(1);
insert into card (card_no) values 
(2);
insert into card (card_no) values 
(3);
insert into card (card_no) values 
(4);
insert into card (card_no) values 
(5);

-- inserting into lending 
describe book_lending;
insert into book_lending (book_id, branch_id, card_no, date_out, due_date) values 
(0001,001,1,'2017-01-01', '2017-10-05');
insert into book_lending (book_id, branch_id, card_no, date_out, due_date) values 
(0001,001,2,'2017-02-10', '2018-03-05');
insert into book_lending (book_id, branch_id, card_no, date_out, due_date) values 
(0001,002,1,'2017-04-01', '2017-09-05');
insert into book_lending (book_id, branch_id, card_no, date_out, due_date) values 
(0001,003,1,'2017-04-09', '2017-09-24');
insert into book_lending (book_id, branch_id, card_no, date_out, due_date) values 
(0001,004,1,'2017-04-09', '2017-10-05');

insert into book_lending (book_id, branch_id, card_no, date_out, due_date) values 
(0010,003,5,'2017-09-01', '2018-12-07');


-- NOW COMES THE FUN PART
select b.book_id,b.title,b.pub_name, a.author_name, c.no_copies,br.branch_name
from book b, book_author a, book_copies c, library_branch br
where b.book_id = a.book_id and
	c.book_id = b.book_id and 
    br.branch_id = c.book_id;
    
select book.book_id, book.title , publisher.pub_name, book_author.author_name,library_branch.branch_name, book_copies.no_copies
from book join publisher on (book.pub_name = publisher.pub_name) join book_author using (book_id) join book_copies using (book_id) join library_branch using (branch_id);
    
    
select card_no
from book_lending
where date_out between '2017-01-01' and '2017-07-01' 
group by card_no
having count(*) > 3;

select card_no 
from book_lending join card using (card_no)
where date_out between '2017-01-01' and '2017-06-01' 
group by card_no
having count(*) > 3;

delete from book
where book_id = 0009;
select * 
from book;


create view view_as as select
pub_yr, book_id
from book
order by pub_yr;

describe v_publication;

create view all_books as select
b.book_id , b.title, c.no_copies
from book b, book_copies c, library_branch br
where b.book_id = c.book_id 
and c.branch_id = br.branch_id;

select *
from all_books;

create view books_details as
select title, sum(no_copies)
from book join book_copies using (book_id)
group by title;

drop view books_details;
select * from books_details;
