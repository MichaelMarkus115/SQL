--Listing 11-1: Extracting components of a timestamp value using date_part()
date_part('year', '2019-12-01 18:37:12 EST'::timestamptz) AS "year",
date_part('month', '2019-12-01 18:37:12 EST'::timestamptz) AS "month",
date_part('day', '2019-12-01 18:37:12 EST'::timestamptz) AS "day",
date_part('hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "hour",
date_part('minute', '2019-12-01 18:37:12 EST'::timestamptz) AS "minute",
date_part('seconds', '2019-12-01 18:37:12 EST'::timestamptz) AS "seconds",
date_part('timezone_hour', '2019-12-01 18:37:12 EST'::timestamptz) AS "tz",
date_part('week', '2019-12-01 18:37:12 EST'::timestamptz) AS "week",
date_part('quarter', '2019-12-01 18:37:12 EST'::timestamptz) AS "quarter",
date_part('epoch', '2019-12-01 18:37:12 EST'::timestamptz) AS "epoch";

--
SELECT extract('year' from '2019-12-01 18:37:12 EST'::timestamptz);


--Listing 11-2: Three functions for making datetimes from components
SELECT
    make_date (2018, 2, 22);

SELECT
    make_time (18, 4, 30.3);

SELECT
    make_timestamptz (2018, 2, 22, 18, 4, 30.3, 'Europe/Lisbon');

--Listing 11-3: Comparing current_timestamp and clock_timestamp() during row insert
CREATE TABLE
    current_time_example (
        time_id bigserial,
        current_timestamp_col timestamp
        with
            time zone,
            clock_timestamp_col timestamp
        with
            time zone
    );

INSERT INTO
    current_time_example (current_timestamp_col, clock_timestamp_col) (
        SELECT
            current_timestamp,
            clock_timestamp ()
        FROM --return a set of integers within range given
            generate_series (1, 1000)
    );

SELECT
    *
FROM
    current_time_example;

--Listing 11-4: Showing your PostgreSQL server’s default time zone
SHOW timezone;

--Listing 11-5: Showing time zone abbreviations and names
SELECT * FROM pg_timezone_abbrevs;
SELECT * FROM pg_timezone_names;

--
SELECT * FROM pg_timezone_names
WHERE name LIKE 'Europe%';

--Listing 11-6: Setting the time zone for a client session
SET timezone TO 'US/Pacific';

CREATE TABLE
    time_zone_test(
        test_date timestamp with time zone
    );

INSERT INTO
    time_zone_test
VALUES
    ('2020-01-01 4:00');

SELECT 
    test_date
FROM 
    time_zone_test;

SET timezone TO 'US/Eastern';

SELECT 
    test_date
FROM 
    time_zone_test;

--Listing 11-7: Creating a table and importing NYC yellow taxi data
CREATE TABLE nyc_yellow_taxi_trips_2016_06_01 (
trip_id bigserial PRIMARY KEY,
vendor_id varchar(1) NOT NULL,
tpep_pickup_datetime timestamp with time zone NOT NULL,
tpep_dropoff_datetime timestamp with time zone NOT NULL,
passenger_count integer NOT NULL,
trip_distance numeric(8,2) NOT NULL,
pickup_longitude numeric(18,15) NOT NULL,
pickup_latitude numeric(18,15) NOT NULL,
rate_code_id varchar(2) NOT NULL,
store_and_fwd_flag varchar(1) NOT NULL,
dropoff_longitude numeric(18,15) NOT NULL,
dropoff_latitude numeric(18,15) NOT NULL,
payment_type varchar(1) NOT NULL,
fare_amount numeric(9,2) NOT NULL,
extra numeric(9,2) NOT NULL,
mta_tax numeric(5,2) NOT NULL,
tip_amount numeric(9,2) NOT NULL,
tolls_amount numeric(9,2) NOT NULL,
improvement_surcharge numeric(9,2) NOT NULL,
total_amount numeric(9,2) NOT NULL
);

COPY nyc_yellow_taxi_trips_2016_06_01 (
vendor_id,
tpep_pickup_datetime,
tpep_dropoff_datetime,
passenger_count,
trip_distance,
pickup_longitude,
pickup_latitude,
rate_code_id,
store_and_fwd_flag,
dropoff_longitude,
dropoff_latitude,
payment_type,
fare_amount,
extra,
mta_tax,
tip_amount,
tolls_amount,
improvement_surcharge,
total_amount
)

FROM 'C:\YourDirectory\yellow_tripdata_2016_06_01.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');
CREATE INDEX tpep_pickup_idx
ON nyc_yellow_taxi_trips_2016_06_01 (tpep_pickup_datetime);

--Listing 11-8: Counting taxi trips by hour
SELECT
date_part('hour', tpep_pickup_datetime) AS trip_hour,
count(*)
FROM nyc_yellow_taxi_trips_2016_06_01
GROUP BY trip_hour
ORDER BY trip_hour;

--Listing 11-9: Exporting taxi pickups per hour to a CSV file
COPY
(SELECT
date_part('hour', tpep_pickup_datetime) AS trip_hour,
count(*)
FROM nyc_yellow_taxi_trips_2016_06_01
184 Chapter 11
GROUP BY trip_hour
ORDER BY trip_hour
)
TO 'C:\YourDirectory\hourly_pickups_2016_06_01.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');


--Listing 11-12: Calculating the length of each trip segment
SELECT 
    segment,
    to_char(departure, 'YYYY-MM-DD HH12:MI a.m TZ') AS departure,
    arrival - departure AS segment_time
FROM
    train_rides;