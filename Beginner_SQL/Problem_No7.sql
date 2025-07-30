-- Problem No.7: Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT(CITY)
    FROM STATION
    WHERE SUBSTR(CITY,-1,1) NOT IN ('A','E','I','O','U','a','e','i','o','u');