--
CREATE
OR REPLACE VIEW nevada_counites_pop_2010 AS
SELECT
    geo_name,
    state_fips,
    county_fips,
    p0010001 AS pop_2010
FROM
    us_counties_2010
WHERE
    state_us_abbreviation = "NV"
ORDER BY
    county_fips;