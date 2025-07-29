-- Problem No. 1: Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

SELECT COUNT(City)-COUNT(DISTINCT City) AS Difference_City
    FROM STATION;
    