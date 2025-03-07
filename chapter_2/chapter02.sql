--Listing 2-1 (Querying all rows and columns from the teachers table)
SELECT
    *
FROM
    teachers;

--Listing 2-2 (Querying a subset of columns)
SELECT
    last_name,
    first_name,
    salary
FROM
    teachers;

--Listing 2-3: Querying distinct values in the school column
SELECT DISTINCT
    school
FROM
    teachers;

--Listing 2-4: Querying distinct pairs of values in the school and salary columns
SELECT DISTINCT
    school,
    salary
FROM
    teachers;

--Listing 2-5: Sorting a column with ORDER BY
SELECT
    first_name,
    last_name,
    salary
FROM
    teachers
ORDER BY
    salary DESC;

--Listing 2-6: Sorting multiple columns with ORDER BY
SELECT
    last_name,
    school,
    hire_date
FROM
    teachers
ORDER BY
    school ASC,
    hire_date DESC;

--Listing 2-7: Filtering rows using WHERE
SELECT
    last_name,
    school,
    hire_date
FROM
    teachers
WHERE
    school = 'Myers Middle School';

------
SELECT
    first_name,
    last_name,
    school
FROM
    teachers
WHERE
    first_name = 'Janet';

----
SELECT
    school
FROM
    teachers
WHERE
    school != 'F.D. Roosevelt HS';

-----
SELECT
    first_name,
    last_name,
    hire_date
FROM
    teachers
WHERE
    hire_date < '2000-01-01';

----
SELECT
    first_name,
    last_name,
    salary
FROM
    teachers
WHERE
    salary >= 43500;

----
SELECT
    first_name,
    last_name,
    school,
    salary
FROM
    teachers
WHERE
    salary BETWEEN 40000 AND 65000;

--Listing 2-8 (Filtering with LIKE and ILIKE)
--case sensitive
SELECT
    first_name
FROM
    teachers
WHERE
    first_name LIKE 'sam%';

-- != case sensitive
SELECT
    first_name
FROM
    teachers
WHERE
    first_name ILIKE 'sam%';

--Listing 2-9 (Combining operators using AND and OR)
--AND
SELECT
    *
FROM
    teachers
WHERE
    school = 'Myers Middle School'
    AND salary < 40000;

--OR
SELECT
    *
FROM
    teachers
WHERE
    last_name = 'Cole'
    OR last_name = 'Bush';

--AND OR
SELECT
    *
FROM
    teachers
WHERE
    school = 'F.D. Roosevelt HS'
    AND (
        salary < 38000
        OR salary > 40000
    );

--Listing 2-10 (A SELECT statement including WHERE and ORDER BY)
SELECT
    first_name,
    last_name,
    school,
    hire_date,
    salary
FROM
    teachers
WHERE
    school LIKE '%Roos%'
ORDER BY
    hire_date DESC;