--(QUESTION 1)
SELECT
    us_counties_2010.geo_name,
    us_counties_2000.geo_name,
    us_counties_2010.state_us_abbreviation,
    us_counties_2000.state_us_abbreviation
FROM
    us_counties_2010
    FULL OUTER JOIN us_counties_2000 ON us_counties_2010.geo_name = us_counties_2000.geo_name
    AND us_counties_2010.state_us_abbreviation = us_counties_2000.state_us_abbreviation
WHERE
    us_counties_2010.state_us_abbreviation IS NULL
    OR us_counties_2000.state_us_abbreviation IS NULL


--(QUESTION 2)
SELECT
    a.geo_name,
    a.state_us_abbreviation,
    a.state_fips,
    a.county_fips,
    ((b.p0010001 - a.p0010001) / a.p0010001 * 100) AS pct_loss
FROM
    us_counties_2000 AS a
    JOIN us_counties_2010 AS b ON a.state_fips = b.state_fips
    AND a.county_fips = b.county_fips
WHERE
    a.p0010001 > 0
ORDER BY
    pct_loss ASC
LIMIT
    1