create schema moview_database;
use moview_database;

create table actor(
	act_id int primary key,
    act_name varchar(50),
    act_gender varchar(6)
);
create table director(
	dir_id int primary key,
    dir_name varchar(50),
    dir_phone varchar(11)
);
create table movie(
	mov_id int primary key,
    movie_title varchar(50),
    movie_year year,
    movie_lang varchar(30),
    dir_id int ,
    foreign key (dir_id) references director(dir_id)
);
create table movie_cast(
	act_id int,
    mov_id int,
    role varchar(30),
    foreign key (act_id) references actor(act_id),
    foreign key (mov_id) references movie(mov_id),
    primary key (act_id,mov_id)
);
create table rating(
	mov_id int,
	foreign key (mov_id) references movie(mov_id),
    rating tinyint
);
-- Entering values into the database
describe actor;
insert into actor values 
		(1,'XYZ','M'),
        (2,'stalin', 'M'),
        (3, 'PQR', 'F'),
        (4,'RTE','F'),
        (5,'TET','F');

DESCRIBE DIRECTOR;
INSERT INTO DIRECTOR VALUES 
		(1,'ABCD','9972568324'),
        (2,'GHDHV','7338150025'),
        (3,'SKFKE','9901953900'),
        (4,'WJSDF','7852649632'),
        (5,'APOAR','7788994455');
insert into director values 
	(6,'XYZ','7788552214');

DESCRIBE MOVIE;
INSERT INTO MOVIE VALUES
	(1,'DFG SDF','2000','HINDI','1');
INSERT INTO MOVIE VALUES 
	(2,'SDHF ASDFJ','2001','KANNADA','2'),
    (3,'SDFKJL SDF','2002','TAMIL','1'),
    (4,'SDFKL SDLKF','2000','MALAYALAM','3'),
    (5,'SD SDF GSD','2012','ENGLISH','4');

insert into movie values 
	(6,'CONJURING','1990','ENGLISH',5),
    (7,'2012','2022','ENLISH',1);
    
insert into movie values 
	(8,'SDF FSD ','1994','HINDI',6);
 

SELECT ACT_NAME, MOVIE_YEAR
FROM MOVIE_CAST JOIN ACTOR USING (ACT_ID) JOIN MOVIE USING (MOV_ID)
WHERE MOVIE_YEAR < 2000 ;
    
DESCRIBE MOVIE_CAST;
INSERT INTO MOVIE_CAST VALUES 
	(1,1,'HERO'),
    (3,1,'LEAD ACTRESS'),
    (2,3,'SUPPORT ROLE'),
    (4,2,'LEAD ACTRESS'),
    (5,4,'SUPPORT ROLE');
    
insert into movie_cast values 
	(5,8,'LEAD');
    
insert into movie_cast values 
	(2,6,'HERO'),
    (1,7,'DOUBLE');
INSERT INTO RATING VALUES 
	(1,'4'),
    (2,'5'),
    (3,'2'),
    (4,'4'),
    (5,'3');
    
insert into rating values
	(1,3),
    (2,5),
    (3,4);

INSERT INTO RATING
VALUES (8,0);
    
-- Queries
-- SELECT ALL THE MOVIES THAT ARE DIRECTED BY ABCD
SELECT movie_title
from movie join director using (dir_id)
where dir_name = 'ABCD';

-- q2 find the movies where one more actors acted in more than one movies
select act_name ,ACT_ID, COUNT(*) AS 'number of movies'
FROM MOVIE_CAST JOIN ACTOR USING (ACT_ID)
GROUP BY ACT_ID
HAVING COUNT(*) > 1;

-- q3 LIST ALL THE ACTORS WHO ACTED IN MOVIES BEFORE 2000 AND AFTER 2015 USING UNION OPERATION
SELECT ACT_NAME, MOVIE_YEAR
FROM MOVIE_CAST JOIN ACTOR USING (ACT_ID) JOIN MOVIE USING (MOV_ID)
WHERE MOVIE_YEAR < 2000 
UNION
SELECT ACT_NAME, MOVIE_YEAR
FROM MOVIE_CAST JOIN ACTOR USING (ACT_ID) JOIN MOVIE USING (MOV_ID)
WHERE MOVIE_YEAR > 2015;

-- q4 
select movie_title,mov_id,max(rating) AS "maximum rating"
from rating join movie using (mov_id)
where rating > 1
group by mov_id
order by movie_title;

-- q5 
update rating 
set rating = 5
where mov_id = (SELECT mov_id
				from movie join director using (dir_id)
                where dir_name = 'XYZ');
SELECT * 
FROM RATING;