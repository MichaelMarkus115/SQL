--table for all the different kinds of animals (QUESION 1)
CREATE TABLE
    animals (
        id bigserial, --to create a realtional connection between the 2 tables
        type_of_animal varchar(50) --to describe the type of animal it is (name)
    );

--Creating INSERT statements to load sample data into the animals table (QUESTION 2)
INSERT INTO
    animals (id, type_of_animal)
VALUES
    (1, 'Lion'),
    (2, 'Eagle'),
    (3, 'Elephant'),
    (4, 'Shark'),
    (5, 'Monkey');

--table for the specifics of each animal (QUESTION 1)
CREATE TABLE
    specifics (
        id bigserial, --to create a realtional connection between the 2 tables
        species varchar(50) --to specify the species that the animal is in the first table
    );

--Creating INSERT statements to load sample data into the animals table(QUESTION 2)
INSERT INTO
    specifics (id, species)
VALUES
    (1, 'Cat'),
    (2, 'Bird'),
    (3, 'Mammal'),
    (4, 'Fish'),
    (5, 'Mammal');


--VIEW DATA

--Right click the table you want to view and select "View/Edit Data" -> "All rows"
--OR
--"SELECT * FROM table_name"

--ERROR MSG
-- ERROR:  syntax error at or near "("
-- LINE 8:     (5, 'Monkey');
--             ^ 

-- SQL state: 42601
-- Character: 130

--Yes this ERROR MSG would help me find the problem because of how specific it was