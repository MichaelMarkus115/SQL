--1. Write a WITH statement to include with COPY to handle the import 
--of an imaginary text file whose first couple of rows look like this:
imaginary text file whose first couple of rows look like this
CREATE TABLE
    movie (id integer, movie varchar(50), actor varchar(50));

INSERT INTO
    movie (movie, actor)
VALUES
    ('Mission Impossible', 'Tom Cruise');

--copy to text file.
COPY (
    SELECT
        CONCAT (id, ':#', movie, '#:', actor)
    FROM
        movie
) TO 'C:\YourDirectory\t_i_y04.txt'
WITH
    (FORMAT CSV, HEADER, DELIMITER '|');

--(QUESTION 2)
COPY (
    SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010
    ORDER BY housing_unit_count_100_percent DESC
    LIMIT 20
) TO 'C:\YourDirectory\us_counties_t_i_y04.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

