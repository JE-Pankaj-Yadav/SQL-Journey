-- Problem No.6: Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT name
    FROM City
    WHERE COUNTRYCODE ='JPN';
        