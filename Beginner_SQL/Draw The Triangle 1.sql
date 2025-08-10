-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

--* * * * * 
--* * * * 
--* * * 
--* * 
--*
--Write a query to print the pattern P(20).

-- It support mysql database.
 WITH RECURSIVE numbers AS (
    SELECT 20 AS n
    UNION ALL
    SELECT n - 1 FROM numbers WHERE n > 1
)
SELECT REPEAT('* ', n) AS pattern
FROM numbers;

-- It support Oracle database.
WITH numbers (n) AS (
    SELECT 20 FROM dual
    UNION ALL
    SELECT n - 1 FROM numbers
    WHERE n > 1
)
SELECT RPAD('* ', n * 2, '* ') AS pattern
FROM numbers;

