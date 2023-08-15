CREATE DATABASE temp;

USE temp;

CREATE TABLE person_cs(
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    address TEXT,
    age INT,
	stateId INT
) ENGINE=ColumnStore;

CREATE TABLE person_inno(
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    address TEXT,
    age INT,
	stateId INT
) engine=InnoDB;

CREATE TABLE states_inno (
    id INT NOT NULL,
    state TEXT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE states_cs (
    id INT NOT NULL,
    state TEXT NOT NULL
) ENGINE = ColumnStore;

LOAD DATA INFILE '/tmp/states.csv'
INTO TABLE states_inno
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, state);

LOAD DATA INFILE '/tmp/states.csv'
INTO TABLE states_cs
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, state);

/*
LOAD DATA INFILE '/tmp/entries.csv'
INTO TABLE person_cs
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(firstName, lastName, address, age, stateId);

LOAD DATA INFILE '/tmp/entries.csv'
INTO TABLE person_inno
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(firstName, lastName, address, age, stateId);

select count(*), age from person_cs group by age having age > 12 order by age asc;

select count(*), age from person_inno group by age having age > 12 order by age asc;

INSERT INTO person_cs (firstName, lastName, address, age) VALUES ('John', 'Doe', '123 Main St', 30);

INSERT INTO person_cs (firstName, lastName, address, age)
VALUES
    ('John', 'Doe', '123 Main St', 30),
    ('Jane', 'Smith', '456 Elm St', 25),
    ('Michael', 'Johnson', '789 Oak St', 40),
    ('Emily', 'Williams', '567 Pine St', 28),
    ('David', 'Brown', '987 Maple St', 32),
    ('Sarah', 'Jones', '654 Birch St', 29),
    ('Robert', 'Taylor', '876 Cedar St', 35),
    ('Linda', 'Miller', '432 Walnut St', 42),
    ('Christopher', 'Anderson', '987 Birch St', 27),
    ('Mary', 'White', '765 Oak St', 31);

INSERT INTO person_inno (firstName, lastName, address, age) VALUES ('John', 'Doe', '123 Main St', 30);

INSERT INTO person_inno (firstName, lastName, address, age)
VALUES
    ('John', 'Doe', '123 Main St', 30),
    ('Jane', 'Smith', '456 Elm St', 25),
    ('Michael', 'Johnson', '789 Oak St', 40),
    ('Emily', 'Williams', '567 Pine St', 28),
    ('David', 'Brown', '987 Maple St', 32),
    ('Sarah', 'Jones', '654 Birch St', 29),
    ('Robert', 'Taylor', '876 Cedar St', 35),
    ('Linda', 'Miller', '432 Walnut St', 42),
    ('Christopher', 'Anderson', '987 Birch St', 27),
    ('Mary', 'White', '765 Oak St', 31);

CREATE INDEX idx_age ON person_inno(age);
CREATE INDEX idx_state_id ON person_inno(stateId);
CREATE INDEX idx_first_name ON person_inno(firstName);

select count(*), age from person_inno group by age having age > 12 order by age asc;

select count(*), state from person_inno p join states_inno s on p.stateId = s.id where p.age > 31 group by s.state order by s.state desc;
select count(*), state from person_cs p join states_cs s on p.stateId = s.id where p.age > 31 group by s.state order by s.state desc;

select count(*), state from person_cs p join states_cs s on p.stateId = s.id where p.age > 31 and firstName like '%o%' group by s.state order by s.state desc;
select count(*), state from person_inno p join states_inno s on p.stateId = s.id where p.age > 31 and firstName like '%o%' group by s.state order by s.state desc;

*/