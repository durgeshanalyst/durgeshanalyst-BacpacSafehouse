CREATE TABLE uber_rides (
    ride_id INT PRIMARY KEY,
    ride_date DATE,
    driver_id INT,
    distance_km DECIMAL(5, 2),
    fare_amount DECIMAL(10, 2)
);

INSERT INTO uber_rides (ride_id, ride_date, driver_id, distance_km, fare_amount) VALUES
(1, '2024-06-01', 101, 5.2, 15.00),
(2, '2024-06-01', 102, 8.4, 20.00),
(3, '2024-06-02', 103, 3.5, 10.00),
(4, '2024-06-02', 104, 7.8, 18.00),
(5, '2024-06-03', 101, 4.6, 12.00),
(6, '2024-06-03', 102, 6.3, 17.00),
(7, '2024-06-04', 103, 10.1, 25.00),
(8, '2024-06-04', 104, 2.9, 9.00),
(9, '2024-06-05', 101, 11.4, 30.00),
(10, '2024-06-05', 102, 5.7, 15.00),
(11, '2024-06-06', 103, 7.0, 20.00),
(12, '2024-06-06', 104, 8.6, 22.00),
(13, '2024-06-07', 101, 9.2, 27.00),
(14, '2024-06-07', 102, 4.8, 14.00),
(15, '2024-06-08', 103, 6.5, 18.00),
(16, '2024-06-08', 104, 12.0, 32.00),
(17, '2024-06-09', 101, 10.5, 29.00),
(18, '2024-06-09', 102, 3.7, 10.00),
(19, '2024-06-10', 103, 7.3, 19.00),
(20, '2024-06-10', 104, 5.4, 16.00);

WITH  CumulativeFares AS (
    SELECT
        ride_id,
        ride_date,
        driver_id,
        distance_km,
        fare_amount,
        fare_amount AS cumulative_fare
    FROM
        uber_rides
    WHERE
        ride_date = (SELECT MIN(ride_date) FROM uber_rides)
    
    UNION ALL
    
    SELECT
        ur.ride_id,
        ur.ride_date,
        ur.driver_id,
        ur.distance_km,
        ur.fare_amount,
        cf.cumulative_fare + ur.fare_amount
    FROM
        uber_rides ur
    JOIN
        CumulativeFares cf
    ON
        ur.ride_date = (SELECT MIN(ride_date) FROM uber_rides WHERE ride_date > cf.ride_date)
        AND ur.ride_id > cf.ride_id
)
SELECT
    ride_date,
    cumulative_fare
FROM
    CumulativeFares
ORDER BY
    ride_date;

