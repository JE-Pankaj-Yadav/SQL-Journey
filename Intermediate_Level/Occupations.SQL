/*Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names listed alphabetically under each column.

Note: Print NULL when there are no more names corresponding to an occupation.*/

SELECT
    MAX(CASE WHEN OCCUPATION = 'Doctor' THEN NAME END) Doctor,
    MAX(CASE WHEN OCCUPATION = 'Professor' THEN NAME END) Professor,
    MAX(CASE WHEN OCCUPATION = 'Singer' THEN NAME END) Singer,
    MAX(CASE WHEN OCCUPATION = 'Actor' THEN NAME END) Actor
FROM (
    SELECT NAME, OCCUPATION,
           ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) RN
    FROM OCCUPATIONS
)
GROUP BY RN
ORDER BY RN;
