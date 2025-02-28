--Creating the table we are using
CREATE TABLE 
    t_i_y_02 (
        id bigserial,
        first_name varchar (50),
        last_name varchar (50), 
        school_name varchar (50),
        hire_date date,
        salary numeric
    );

--Inserting dummy data into the table
INSERT INTO
    t_i_y_02 (first_name, last_name, school_name, hire_date, salary)
VALUES
    (
        'Janet',
        'Smith',
        'F.D. Roosevelt HS',
        '2011-10-30',
        36200
    ),
    (
        'Lee',
        'Reynolds',
        'F.D. Roosevelt HS',
        '1993-05-22',
        65000
    ),
    (
        'Samuel',
        'Cole',
        'Myers Middle School',
        '2005-08-01',
        43500
    ),
    (
        'Samantha',
        'Bush',
        'Myers Middle School',
        '2011-10-30',
        36200
    ),
    (
        'Betty',
        'Diaz',
        'Myers Middle School',
        '2005-08-30',
        43500
    ),
    (
        'Kathleen',
        'Roush',
        'F.D. Roosevelt HS',
        '2010-10-22',
        38500
    );

--query to list schools alphabetically as well as teachers last names from A-Z
SELECT 
    last_name, school_name
FROM
    t_i_y_02
ORDER BY
    last_name,
    school_name;

--query that finds the one teacher whose first name starts with the letter S and who earns more than $40,000.
SELECT
    first_name, salary
FROM 
    t_i_y_02
WHERE
    first_name LIKE 'S%'
AND
    salary > 40000;

--query that Rank teachers hired since January 1, 2010, ordered by highest paid to lowest.
SELECT
    first_name, last_name, hire_date, salary 
FROM 
    t_i_y_02
WHERE 
    hire_date >= '2010-01-01'
ORDER BY
    salary DESC