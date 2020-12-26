create schema practise_lib;
use practise_lib;

create table book(
	bookId int,
    title varchar(20),
    pubName varchar(30),
    pub_year year,
    constraint pk_bk primary key(bookId)
);

create table publisher(
	pubId int,
    pubName varchar(30),
    address varchar(30),
    phone varchar(10),
    constraint pk_pub primary key (pubId)
);

create table book_author(
	bookId int,
    authorName varchar(20),
    constraint fk_ba foreign key (bookId) references book(bookId) on delete cascade on update cascade,
    constraint pk_ba primary key (bookId,authorName)
);

CREATE TABLE library_branch(
	bId int,
    bName varchar(20),
    bAddress varchar(30),
    constraint lib_br primary key(bId)
);

CREATE TABLE book_copies(
	bookId int,
    bId int, 
    no_copies int,
    constraint pk_bc primary key (bookId,bId)
);
ALTER TABLE book_copies
ADD CONSTRAINT fk_bc1 
FOREIGN KEY (bookId) REFERENCES book(bookId),
ADD CONSTRAINT fk_bc2
FOREIGN KEY (bId) REFERENCES library_branch(bId);

CREATE TABLE card(
	card_no int,
    constraint pk_cd primary key (card_no)
);

CREATE TABLE book_lending(
	bookId int,
    bId int,
    card_no int,
    date_out date,
    due_date date,
    constraint dateCheck check( due_date > date_out)
);
describe publisher;
insert into publisher  values
(456563635,"Pearson","#42th avenue 3rd main New York", "9982568324");
insert into publisher values
(89743895,"MCGraw HILL","#25th avenue 3rd", "9972568324");
insert into publisher  values
(897423895,"Tharub publications","#25th HBR 9th main", "9972998324");
insert into publisher  values
(34534534,"AM Padma Reddy","#32nd avenue road 3rd ", "9972598324");
insert into publisher  values
(89743335,"Balaji Publications ","#55 avenue", "9972563424");

insert into book values 
(0001, "AI",'Pearson','2020');
insert into book  values 
(0002, "Data structures" ,'Tharub publications','1999');
insert into book  values 
(0007, "Intro to C++" ,'AM Padma Reddy','1986');
insert into book  values 
(0009, "Levitin algorithms" ,'Balaji Publications ','2019');
insert into book values 
(0010, "Computer Networks" ,'Pearson','2017');

