-- Problem No.2: Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.   
SELECT CITY, LENGTH(CITY) AS NAME_LENGTH
FROM (
    SELECT CITY
    FROM STATION
    WHERE LENGTH(CITY) = (SELECT MIN(LENGTH(CITY)) FROM STATION)
    ORDER BY CITY
) WHERE ROWNUM = 1
UNION ALL
SELECT CITY, LENGTH(CITY) AS NAME_LENGTH
FROM (
    SELECT CITY
    FROM (
        SELECT CITY
        FROM STATION
        WHERE LENGTH(CITY) = (SELECT MAX(LENGTH(CITY)) FROM STATION)
        ORDER BY CITY
    ) 
    WHERE ROWNUM = 1
);
