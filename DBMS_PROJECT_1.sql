/*
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |  _________   | || |      __      | || |   ______     | || |   _____      | || |  _________   | || |    _______   | |
| | |  _   _  |  | || |     /  \     | || |  |_   _ \    | || |  |_   _|     | || | |_   ___  |  | || |   /  ___  |  | |
| | |_/ | | \_|  | || |    / /\ \    | || |    | |_) |   | || |    | |       | || |   | |_  \_|  | || |  |  (__ \_|  | |
| |     | |      | || |   / ____ \   | || |    |  __'.   | || |    | |   _   | || |   |  _|  _   | || |   '.___`-.   | |
| |    _| |_     | || | _/ /    \ \_ | || |   _| |__) |  | || |   _| |__/ |  | || |  _| |___/ |  | || |  |`\____) |  | |
| |   |_____|    | || ||____|  |____|| || |  |_______/   | || |  |________|  | || | |_________|  | || |  |_______.'  | |
| |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 
*/

CREATE TABLE production
(
no_of_movies int,
established int,
production_name varchar(255),
primary key(production_name)
);

CREATE TABLE director
(
director_name varchar(255),
age int,
production_name VARCHAR(255),
pay int,
tenure int,
primary key(director_name),
foreign key(production_name) REFERENCES production(production_name)
);

CREATE TABLE film
(
movie_id int,
release_date date,
lengthh float,
movie_name varchar(255),
certificatee varchar(255),
country varchar(255),
director_name varchar(255),
production_name varchar(255),
primary key(movie_id),
FOREIGN KEY (director_name) REFERENCES director(director_name),
FOREIGN KEY (production_name) REFERENCES production(production_name)
);

CREATE TABLE actors
(
actor_name varchar(255),
movie_id int,
pay int,
gender varchar(255),
DOB int,
director_name varchar(255),
primary key(actor_name),
foreign key(movie_id) REFERENCES film(movie_id),
foreign key(director_name) REFERENCES director(director_name)
);

CREATE TABLE rating
(
organisation_name varchar(255),
movie_id int,
scale int,
marks_given int,
primary key(organisation_name,movie_id),
foreign key(movie_id) REFERENCES film(movie_id)
);

CREATE TABLE languagee
(
lang varchar(255),
movie_id int,
primary key(lang,movie_id),
foreign key(movie_id) REFERENCES film(movie_id)
);

CREATE TABLE genre
(
genre_type varchar(255),
movie_id int,
adoption VARCHAR(255),
primary key(genre_type,movie_id),
foreign key(movie_id) REFERENCES film(movie_id)
);

CREATE TABLE award
(
award_name varchar(255),
category varchar(255),
primary key(award_name)
);

CREATE TABLE achieved
(
director_name varchar(255),
actor_name varchar(255),
movie_id int,
award_name VARCHAR(255),
foreign key(director_name) REFERENCES director(director_name),
foreign key(actor_name) REFERENCES actors(actor_name),
foreign key(movie_id) REFERENCES film(movie_id),
foreign key(award_name) REFERENCES award(award_name)
);

/*
 ▄               ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄            ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄ 
▐░▌             ▐░▌▐░░░░░░░░░░░▌▐░▌          ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
 ▐░▌           ▐░▌ ▐░█▀▀▀▀▀▀▀█░▌▐░▌          ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀ 
  ▐░▌         ▐░▌  ▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌          ▐░▌          
   ▐░▌       ▐░▌   ▐░█▄▄▄▄▄▄▄█░▌▐░▌          ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄ 
    ▐░▌     ▐░▌    ▐░░░░░░░░░░░▌▐░▌          ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
     ▐░▌   ▐░▌     ▐░█▀▀▀▀▀▀▀█░▌▐░▌          ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀█░▌
      ▐░▌ ▐░▌      ▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌                    ▐░▌
       ▐░▐░▌       ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄█░▌
        ▐░▌        ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌
         ▀          ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀ 
                                                                                 
*/

INSERT INTO film VALUES( 1,'2019-05-07', 2.5,'RRR','U','India','Rajamouli','Great arts');
INSERT INTO film VALUES( 2,'2004-03-03', 3,'Avatar','U','USA','James Cameron','TSG entertainment');
INSERT INTO film VALUES( 3,'1998-05-06', 2,'Titanic','A','UK','James Cameron','Paramount pictures');
INSERT INTO film VALUES( 4,'2024-07-07', 2.5,'Mad','U','India','Krishna Ramulu','aarathi pictures');
INSERT INTO film VALUES( 5,'2008-08-08', 3.5,'Salaar','A','India','Prashanth Neel','Hombale productions');

INSERT INTO director VALUES( 'Rajamouli',55 ,null,null ,null );
INSERT INTO director VALUES( 'James Cameron',60 ,'TSG entertainment',5000000 , 5);
INSERT INTO director VALUES( 'Krishna Ramulu',42 ,'aarathi pictures', 500000,5 );
INSERT INTO director VALUES( 'Prashanth Neel',51 ,'Hombale productions',4000000 ,5 );

INSERT INTO genre VALUES('historic',1,'historic records');
INSERT INTO genre VALUES('fiction',2,null);
INSERT INTO genre VALUES('romantic',3,'historic records');
INSERT INTO genre VALUES('comedy',4,null);
INSERT INTO genre VALUES('fiction',5,null);

INSERT INTO languagee VALUES('hindi',1);
INSERT INTO languagee VALUES('english',2);
INSERT INTO languagee VALUES('english',3);
INSERT INTO languagee VALUES('telugu',4);
INSERT INTO languagee VALUES('kanadda',5);

INSERT INTO rating VALUES('imdb', 1,10 ,9 );
INSERT INTO rating VALUES('imdb', 2,10 , 8.9);
INSERT INTO rating VALUES('rotten tomato',3 ,5 ,9.4 );
INSERT INTO rating VALUES('rotten tomato',4 ,5 , 8.2);
INSERT INTO rating VALUES('rotten tomato',5 ,5 ,8.7 );

INSERT INTO production VALUES( 10, 2019,'Great arts');
INSERT INTO production VALUES( 15,2015 ,'TSG entertainment');
INSERT INTO production VALUES( 92,1991 ,'Paramount pictures');
INSERT INTO production VALUES( 12,2020 ,'aarathi pictures');
INSERT INTO production VALUES( 6, 2021,'Hombale productions');

INSERT INTO actors VALUES('NTR', 1,50000000 ,'M',1984 ,'Rajamouli');
INSERT INTO actors VALUES('Ram',1 ,50000000 ,'M',1988 ,'Rajamouli');
INSERT INTO actors VALUES('Jack', 2, 100000000,'M',1980 ,'James Cameron');
INSERT INTO actors VALUES('Emily',2 ,180000000 ,'F',1977 ,'James Cameron');
INSERT INTO actors VALUES('Leonardo Di Caprio', 3,120000000 ,'M',1972 ,'James Cameron');
INSERT INTO actors VALUES('Rose',3 ,80000000 ,'F',1971 ,'James Cameron');
INSERT INTO actors VALUES('Siddarth',4 ,20000000 ,'M',1995 ,'Krishna Ramulu');
INSERT INTO actors VALUES('Prabhas', 5,120000000 ,'M',1972 ,'Prashanth Neel');

INSERT INTO achieved VALUES('James Cameron',null, 2,'Best Director');
INSERT INTO achieved VALUES(null,'Leonardo Di Caprio',2 ,'Best male actor');
INSERT INTO achieved VALUES(null,null, 3,'Best VFX');
INSERT INTO achieved VALUES(null,null,5 ,'Best action award');

INSERT INTO award VALUES('Best Director','Director');
INSERT INTO award VALUES('Best male actor','actor');
INSERT INTO award VALUES('Best VFX','Animation');
INSERT INTO award VALUES('Best action award','Cinematography');


/* 
 ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░░▒▓█▓▒░▒▓████████▓▒░░▒▓███████▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░        
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░        
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░ ░▒▓███████▓▒░░▒▓█▓▒░▒▓██████▓▒░  ░▒▓██████▓▒░  
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░             ░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░             ░▒▓█▓▒░ 
 ░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░  
   ░▒▓█▓▒░                                                                            
    ░▒▓██▓▒░                                                                          
 */

select count(genre_type) 
from genre 
WHERE genre_type='fiction';


select film.movie_id 
from languagee INNER JOIN film
on languagee.movie_id=film.movie_id
where languagee.lang='english'; 


select movie_id 
FROM rating
where organisation_name='rotten tomato' and marks_given>8;


select production_name
from production
where no_of_movies = ( SELECT max(no_of_movies) from production );


select achieved.actor_name , actors.DOB
from achieved INNER JOIN actors
on achieved.actor_name=actors.actor_name
where achieved.award_name='Best male actor';

