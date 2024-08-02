CREATE DATABASE SQL_PRACTICE_V3
USE SQL_PRACTICE_V3;

SELECT * FROM ipldata;

---How many matches has been played by each player

SELECT player, COUNT(DISTINCT matchid) AS matches_played
FROM (
    SELECT batter AS player, matchid
    FROM ipldata
    UNION
    SELECT bowler AS player, matchid
    FROM ipldata
) AS combined_data
GROUP BY player;


---- 




