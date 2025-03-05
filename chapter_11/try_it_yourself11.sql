--(Question 1)
SELECT
    trip_id,
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    tpep_dropoff_datetime - tpep_pickup_datetime AS ETA --(length of ride)
FROM
    nyc_yellow_taxi_trips_2016_06_01
ORDER BY
    ETA DESC;

--(question 2)
SELECT
    '2100-01-01 00:00:00-05' AT TIME ZONE 'Europe/London' AS London,
    '2100-01-01 00:00:00-05' AT TIME ZONE 'Africa/Johannesburg' AS Joburg,
    '2100-01-01 00:00:00-05' AT TIME ZONE 'Europe/Moscow' AS Moscow,
    '2100-01-01 00:00:00-05' AT TIME ZONE 'Australia/Melbourne' AS Melbourne,
    '2100-01-01 00:00:00-05' AT TIME ZONE 'US/Eastern' AS New_York;


--i deleted taxi db yesterday after i had an issue with it in class
--will just need to create it again

