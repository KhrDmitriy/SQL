CREATE DATABASE human_friends;
USE human_friends;

CREATE TABLE type_animal
(
	id INT PRIMARY KEY,
	type_name VARCHAR(20) NOT NULL
);

CREATE TABLE category_animal
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	categ_name VARCHAR(20) NOT NULL,
    type_id INT NOT NULL,
    FOREIGN KEY (type_id) REFERENCES type_animal(id)
);

CREATE TABLE dog
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
    bd DATE NOT NULL,
    categ_id INT NOT NULL DEFAULT 1,
    FOREIGN KEY (categ_id) REFERENCES category_animal(id)
);

CREATE TABLE cat
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
    bd DATE NOT NULL,
    categ_id INT NOT NULL DEFAULT 2,
    FOREIGN KEY (categ_id) REFERENCES category_animal(id)
);

CREATE TABLE hamster
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
    bd DATE NOT NULL,
    categ_id INT NOT NULL DEFAULT 3,
    FOREIGN KEY (categ_id) REFERENCES category_animal(id)
);

CREATE TABLE horse
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
    bd DATE NOT NULL,
    categ_id INT NOT NULL DEFAULT 4,
    FOREIGN KEY (categ_id) REFERENCES category_animal(id)
);

CREATE TABLE camel
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
    bd DATE NOT NULL,
    categ_id INT NOT NULL DEFAULT 5,
    FOREIGN KEY (categ_id) REFERENCES category_animal(id)
);

CREATE TABLE donkey
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL,
    bd DATE NOT NULL,
    categ_id INT NOT NULL DEFAULT 6,
    FOREIGN KEY (categ_id) REFERENCES category_animal(id)
);
-----------------------------------------------------------------------

INSERT INTO type_animal (id, type_name)
VALUES
(1, 'pet'),
(2, 'pack');

INSERT INTO category_animal (id, categ_name, type_id)
VALUES
(1, 'dog', 1),
(2, 'cat', 1),
(3, 'hamster', 1),
(4, 'horse', 2),
(5, 'camel', 2),
(6, 'donkey', 2);

INSERT INTO dog (name, bd, categ_id)
VALUES
-- dog
('Bob', '2018-12-15', 1),
('Bobik', '2015-03-20', 1),
('Muhtar', '2020-05-01', 1),
('Polkan', '2016-04-07', 1),
('Rich', '2019-05-01', 1),
('Tyson', '2017-04-01', 1),
('Nika', '2020-05-01', 1),
('Pushka', '2023-02-17', 1);

INSERT INTO cat (name, bd, categ_id)
VALUES
-- cat
('Murzik', '2016-06-12', 2),
('Murka', '2012-05-20', 2),
('Belka', '2020-10-11', 2),
('Markiz', '2019-05-05', 2),
('Pushok', '2022-01-01', 2),
('Pushka', '2022-02-02', 2);

INSERT INTO hamster (name, bd, categ_id)
VALUES
-- hamster
('Homka', '2022-03-07', 3),
('Buffy', '2022-03-03', 3);

INSERT INTO horse (name, bd, categ_id)
VALUES
-- horse
('Varyag', '2015-03-19', 4),
('Dunkan', '2017-10-10', 4);

INSERT INTO camel (name, bd, categ_id)
VALUES
-- camel
('Goga', '2021-08-22', 5),
('Old Joe', '2010-11-11', 5);

INSERT INTO donkey (name, bd, categ_id)
VALUES
-- donkey
('Ishaak', '2015-09-04', 6),
('Moisey', '2019-10-13', 6);

CREATE TABLE animals
(
    select * from dog
	union
	select * from cat
	union
	select * from hamster
	union
	select * from horse
	union
	select * from donkey
);

ALTER TABLE animals
ADD COLUMN key_id INT PRIMARY KEY AUTO_INCREMENT;

CREATE TABLE skill
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	skill_name VARCHAR(30) NOT NULL
);

CREATE TABLE animal_skill
(
	id INT NOT NULL,
	skill_id INT NOT NULL,
    FOREIGN KEY (skill_id) REFERENCES skill(id),
    FOREIGN KEY (id) REFERENCES animals(key_id)
);

INSERT INTO skill (skill_name)
VALUES
('sit'),
('lie'),
('stand'),
('stop'),
('voice'),
('aport'),
('dance'),
('trot'),
('gallop'),
('jump'),
('sniff'),
('catch'),
('climb'),
('kick'),
('spit'),
('give a paw'),
('crawl'),
('come here'),
('snake'),
('spin');

INSERT INTO animal_skill (id, skill_id)
VALUES
-- dog 1-8
(1, 1),
(1, 2),
(1, 3),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 16),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 18),
(4, 6),
(4, 10),
(5, 1),
(5, 16),
(6, 18),
(6, 17),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 11),
(6, 18),
(6, 19),
(7, 10),
(7, 6),
(7, 18),
-- cat 9-14
(9, 10),
(9, 18),
(10, 12),
(10, 20),
(11, 6),
(12, 19),
(13, 18),
(14, 13),
-- hamster 15-16
(16, 20),
-- horse 17-18
(17, 9),
(17, 8),
(18, 8),
(18, 9),
(18, 10),
-- donkey 19-20
(19, 14),
(20, 20),
(20, 18)
;

select *
from
(	select 
	*,
    current_date(),
	(select date_format(from_days(to_days(now()) - to_days(bd)), '%Y') + 0) as age,
	(select timestampdiff(MONTH, a.bd, current_date()) % 12) as monthes
	from animals a
) t
where t.age >= 1 AND age < 4;

