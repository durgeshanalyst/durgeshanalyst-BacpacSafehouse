USE leetcode

CREATE TABLE Weather (
    id INT PRIMARY KEY,
    recordDate DATE,
    temperature INT
);

INSERT INTO Weather (id, recordDate, temperature) VALUES
(1, '2023-06-01', 30),
(2, '2023-06-02', 32),
(3, '2023-06-03', 31),
(4, '2023-06-04', 33),
(5, '2023-06-05', 32);

select * from Weather

SELECT w1.id
FROM Weather w1
JOIN Weather w2
ON w1.recordDate = DATEADD(day, 1, w2.recordDate)
WHERE w1.temperature > w2.temperature;
