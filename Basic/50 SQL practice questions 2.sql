-- ---
-- # 📌 50 More Basic SQL Questions (Practice Set – 2)
-- Each query is answered + explained in simple words.
-- ---

-- ## 🔹 1. Basic SELECT & WHERE

-- 1. Select all columns from Orders.
SELECT * FROM ORDERS;  
-- 👉 *This shows all rows & columns from the Orders table.*

-- 2. Select product_name and price from Products.
SELECT PRODUCT_NAME, PRICE FROM PRODUCTS;  
-- 👉 *Only product name and price will be shown.*

-- 3. Select all employees where salary < 30000.
SELECT * FROM EMPLOYEES WHERE SALARY < 30000;  
-- 👉 *Shows employees earning less than 30,000.*

-- 4. Select all customers where city = 'Bangalore'.
SELECT * FROM CUSTOMERS WHERE CITY = 'Bangalore';  
-- 👉 *Shows only customers who live in Bangalore.*

-- 5. Select products where stock = 0 (out of stock).
SELECT * FROM PRODUCTS WHERE STOCK = 0;  
-- 👉 *Finds products that are out of stock.*

-- ---

-- ## 🔹 2. ORDER BY & DISTINCT

-- 6. Select all employees sorted by first_name descending.
SELECT * FROM EMPLOYEES ORDER BY FIRST_NAME DESC;  
-- 👉 *Orders employees in reverse alphabetical order.*

-- 7. Select unique cities from Customers.
SELECT DISTINCT CITY FROM CUSTOMERS;  
-- 👉 *DISTINCT removes duplicate cities.*

-- 8. Select top 3 orders sorted by amount descending.
SELECT * FROM ORDERS ORDER BY AMOUNT DESC FETCH FIRST 3 ROWS ONLY;  
-- 👉 *Fetches top 3 biggest order amounts.*

-- 9. Select last 5 joined employees based on joining_date.
SELECT * FROM EMPLOYEES ORDER BY JOINING_DATE DESC FETCH FIRST 5 ROWS ONLY;  
-- 👉 *Shows 5 most recently joined employees (fixed mistake).*

-- 10. Select products ordered by price and then by name.
SELECT * FROM PRODUCTS ORDER BY PRICE, PRODUCT_NAME;  
-- 👉 *Orders products by price first, if same then by name.*

-- ---

-- ## 🔹 3. Aggregate Functions (COUNT, SUM, AVG, MAX, MIN)

-- 11. Count total customers.
SELECT COUNT(*) FROM CUSTOMERS;  
-- 👉 *Gives total number of customers.*

-- 12. Find total number of orders placed.
SELECT COUNT(*) FROM ORDERS;  
-- 👉 *Counts how many orders were placed.*

-- 13. Find total revenue (sum of amount in Orders).
SELECT SUM(AMOUNT) FROM ORDERS;  
-- 👉 *Adds up all order amounts = total revenue.*

-- 14. Find highest salary in Employees.
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);  
-- 👉 *Finds the employee(s) with the maximum salary.*

-- 15. Find lowest product price.
SELECT PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRICE
FROM PRODUCTS
WHERE PRICE = (SELECT MIN(PRICE) FROM PRODUCTS);  
-- 👉 *Shows product(s) with the lowest price.*

-- 16. Find average marks of students in Marks.
SELECT AVG(MARKS) AS AVG_MARKS FROM MARKS;  
-- 👉 *Calculates class average.*

-- 17. Find total quantity sold of each product.
SELECT PRODUCT_ID, SUM(QUANTITY) AS TOTAL_QTY
FROM ORDERS
GROUP BY PRODUCT_ID;  
-- 👉 *Adds up quantity sold for each product.*

-- 18. Find number of orders placed 20/08/23.
SELECT COUNT(*) FROM ORDERS WHERE ORDER_DATE = '20-AUG-23';  
-- 👉 *Counts orders placed on that specific date (Oracle format).*

-- 19. Count number of employees in each city.
SELECT CITY, COUNT(EMP_ID) FROM EMPLOYEES GROUP BY CITY;  
-- 👉 *Groups employees by city and counts them.*

-- 20. Find max order amount for each customer.
SELECT CUST_ID, MAX(AMOUNT) AS MAX_ORDER
FROM ORDERS
GROUP BY CUST_ID
ORDER BY MAX_ORDER DESC;  
-- 👉 *Highest order amount per customer.*

-- ---

-- ## 🔹 4. GROUP BY & HAVING

-- 21. Find average salary per city.
SELECT CITY, AVG(SALARY) AS AVG_SALARY
FROM EMPLOYEES
GROUP BY CITY
ORDER BY AVG_SALARY DESC;  
-- 👉 *Groups by city, calculates average salary.*

-- 22. Find number of employees per department.
SELECT DEPARTMENT, COUNT(EMP_ID) AS NUMBER_OF_EMP
FROM EMPLOYEES
GROUP BY DEPARTMENT;  
-- 👉 *Counts employees in each department.*

-- 23. Find total sales per product.
SELECT P.PRODUCT_ID, P.PRODUCT_NAME, P.PRICE, SUM(O.AMOUNT) AS TOTAL_SALES
FROM ORDERS O
JOIN PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID
GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME, P.PRICE;  
-- 👉 *Joins orders & products to get total sales.*

-- 24. Find customers who spent more than 50,000.
SELECT CUST_ID, SUM(AMOUNT) AS TOTAL_SPENT
FROM ORDERS
GROUP BY CUST_ID
HAVING SUM(AMOUNT) > 50000;  
-- 👉 *Corrected: SUM is required, not just AMOUNT.*

-- 25. Find departments having less than 5 employees.
SELECT DEPARTMENT, COUNT(EMP_ID) AS EMP_COUNT
FROM EMPLOYEES
GROUP BY DEPARTMENT
HAVING COUNT(EMP_ID) < 5;  
-- 👉 *Corrected: less than 5, not <4.*

-- 26. Find cities where more than 10 customers live.
SELECT CITY, COUNT(CUST_ID) AS TOTAL_CUSTOMERS
FROM CUSTOMERS
GROUP BY CITY
HAVING COUNT(CUST_ID) > 10;  
-- 👉 *Corrected: used CUSTOMERS table, not employees.*

-- 27. Find products with average stock greater than 4.
SELECT PRODUCT_NAME, AVG(STOCK) AS AVG_STOCK
FROM PRODUCTS
GROUP BY PRODUCT_NAME
HAVING AVG(STOCK) > 4;  
-- 👉 *Finds products where avg stock > 4.*

-- 28. Find total salary per department, but only if > 100000.
SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SAL
FROM EMPLOYEES
GROUP BY DEPARTMENT
HAVING SUM(SALARY) > 100000;  
-- 👉 *Filters departments with total salary > 1 lakh.*

-- 29. Find months where total orders > 4.
SELECT TO_CHAR(ORDER_DATE,'YYYY-MM') AS ORDER_MONTH,
       COUNT(ORDER_ID) AS TOTAL_ORDERS
FROM ORDERS
GROUP BY TO_CHAR(ORDER_DATE,'YYYY-MM')
HAVING COUNT(ORDER_ID) > 4;  
-- 👉 *Counts orders month-wise.*

-- 30. Find categories having more than 20 products.
SELECT CATEGORY, COUNT(PRODUCT_ID) AS TOTAL_PRODUCTS
FROM PRODUCTS
GROUP BY CATEGORY
HAVING COUNT(PRODUCT_ID) > 20;  
-- 👉 *Shows categories with more than 20 products.*

-- ---

-- ## 🔹 5. JOINS (INNER, LEFT, RIGHT)

-- 31. Get employee name with department name (INNER JOIN).
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS FULL_NAME,
       D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT = D.DEPARTMENT_NAME;  
-- 👉 *Joins employees with their department details.*

-- 32. Get all employees and their orders (JOIN).
SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS FULL_NAME,
       P.PRODUCT_NAME, P.PRICE,
       O.ORDER_DATE, O.DELIVERY_DATE
FROM ORDERS O
JOIN PRODUCTS P ON O.PRODUCT_ID = P.PRODUCT_ID
JOIN EMPLOYEES E ON E.EMP_ID = O.EMP_ID;  
-- 👉 *Combines employee, order, and product info.*

-- 33. Get all orders and their employees (RIGHT JOIN).
SELECT O.ORDER_ID,
       E.FIRST_NAME || ' ' || E.LAST_NAME AS FULL_NAME
FROM EMPLOYEES E
RIGHT JOIN ORDERS O ON O.EMP_ID = E.EMP_ID;  
-- 👉 *Keeps all orders, even if employee info missing.*

-- 34. Get products and supplier names.
SELECT PRODUCT_NAME, SUPPLIER FROM PRODUCTS;  
-- 👉 *Directly fetches product + supplier details.*

-- 35. Get customer names with order details.
SELECT O.ORDER_ID,
       C.FIRST_NAME || ' ' || C.LAST_NAME AS FULL_NAME,
       P.PRODUCT_NAME, P.PRICE,
       O.ORDER_DATE, O.DELIVERY_DATE
FROM ORDERS O
JOIN PRODUCTS P ON P.PRODUCT_ID = O.PRODUCT_ID
JOIN CUSTOMERS C ON C.CUST_ID = O.CUST_ID;  
-- 👉 *Fixed: must join with CUSTOMERS, not employees.*

-- ---

-- ## 🔹 6. Subqueries

-- 36. Find employees earning more than average salary.
SELECT EMP_ID, FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);  
-- 👉 *Compares each salary with avg salary.*

-- 37. Find products whose price is highest in table.
SELECT PRODUCT_NAME, PRICE
FROM PRODUCTS
WHERE PRICE = (SELECT MAX(PRICE) FROM PRODUCTS);  
-- 👉 *Gets costliest product(s).*

-- 38. Find customers who never placed an order.
SELECT C.CUST_ID, C.FIRST_NAME || ' ' || C.LAST_NAME AS FULL_NAME
FROM CUSTOMERS C
LEFT JOIN ORDERS O ON C.CUST_ID = O.CUST_ID
WHERE O.ORDER_ID IS NULL;  
-- 👉 *Shows customers with no orders (fixed, was employees earlier).*

-- 39. Find students who scored more than class average.
SELECT STUDENT_ID, NAME, MARKS
FROM MARKS
WHERE MARKS > (SELECT AVG(MARKS) FROM MARKS);  
-- 👉 *Compares marks with class average.*

-- 40. Find employees who work in same department as "Amit".
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, DEPARTMENT
FROM EMPLOYEES
WHERE DEPARTMENT = (SELECT DEPARTMENT FROM EMPLOYEES WHERE FIRST_NAME = 'Amit');  
-- 👉 *Finds colleagues of Amit in same dept.*

-- ---

-- ## 🔹 7. String Functions

-- 41. Convert all customer names to lower case.
SELECT LOWER(FIRST_NAME || ' ' || LAST_NAME) AS FULL_NAME
FROM CUSTOMERS;  
-- 👉 *Changes names into lowercase.*

-- 42. Get length of each employee's first name.
SELECT FIRST_NAME, LENGTH(FIRST_NAME) AS NAME_LENGTH
FROM EMPLOYEES;  
-- 👉 *Shows length of each first name.*

-- 43. Select first 5 characters of product name.
SELECT SUBSTR(PRODUCT_NAME, 1, 5) AS SHORT_NAME
FROM PRODUCTS;  
-- 👉 *Takes substring from position 1 to 5.*

-- 44. Replace 'Ltd' with 'Limited' in department names.
SELECT REPLACE(DEPARTMENT, 'Ltd', 'Limited') AS NEW_DEPARTMENT
FROM EMPLOYEES;  
-- 👉 *Replaces text in department column.*

-- 45. Find employees whose email ends with '@gmail.com'.
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, EMAIL
FROM EMPLOYEES
WHERE EMAIL LIKE '%@gmail.com';  
-- 👉 *Checks if email ends with Gmail.*

-- ---

-- ## 🔹 8. Date Functions

-- 46. Select orders placed 03/08/23.
SELECT * FROM ORDERS
WHERE ORDER_DATE = '03-AUG-23';  
-- 👉 *Orders on given date.*

-- 47. Find employees who joined MONTH YEAR 01/23.
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, JOINING_DATE
FROM EMPLOYEES
WHERE TO_CHAR(JOINING_DATE, 'YYYY-MM') = '2023-01';  
-- 👉 *Employees who joined Jan 2023.*

-- 48. Find year from each employee joining date.
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME,
       TO_CHAR(JOINING_DATE, 'YYYY') AS JOIN_YEAR
FROM EMPLOYEES;  
-- 👉 *Extracts only year.*

-- 49. Find current system date.
SELECT SYSDATE FROM DUAL;  
-- 👉 *Gives today’s date from system.*

-- 50. Find difference in days between order_date and delivery_date.
SELECT ORDER_ID, ORDER_DATE, DELIVERY_DATE,
       (DELIVERY_DATE - ORDER_DATE) AS DIFFERENCE_IN_DAYS
FROM ORDERS;  
-- 👉 *Oracle: subtracting dates gives number of days.*
