-- Problem No. 2: Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
Select name
From city
Where population >120000 and countrycode = 'USA';