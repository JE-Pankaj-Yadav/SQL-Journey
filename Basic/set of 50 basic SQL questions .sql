-- ===============================================================
-- 📌 DATABASE STRUCTURE & SAMPLE DATA
-- ===============================================================

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    age INT,
    department VARCHAR2(50),
    salary DECIMAL(10,2),
    city VARCHAR2(50),
    joining_date DATE,
    email VARCHAR2(100)
);

-- Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR2(50)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    emp_id INT,
    order_date DATE,
    amount NUMBER(10,2),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- (Insert statements already provided above, not repeating here)

-- 1️⃣ Basic SELECT Queries
-- 1. Select all columns from Employees.
-- 👉 Simply fetch everything (all columns).
SELECT * FROM employees;

-- 2. Select only name and age from Employees.
-- 👉 Use string concatenation (||) for full name.
SELECT first_name || ' ' || last_name AS full_name, age FROM employees;

-- 3. Select unique department names.
-- 👉 DISTINCT removes duplicate departments.
SELECT DISTINCT department FROM employees;

-- 4. Select first 5 employees.
-- 👉 FETCH FIRST limits rows.
SELECT * FROM employees FETCH FIRST 5 ROWS ONLY;

-- 5. Select all employees from Delhi.
SELECT first_name || ' ' || last_name AS full_name 
FROM employees 
WHERE city = 'Delhi';

-- 2️⃣ WHERE Clause
-- 6. Employees with salary > 50000
SELECT first_name || ' ' || last_name AS full_name, salary 
FROM employees 
WHERE salary > 50000;

-- 7. Employees aged between 25 and 40
SELECT first_name || ' ' || last_name AS full_name, age 
FROM employees 
WHERE age BETWEEN 25 AND 40;

-- 8. Employees joined between Jan-2022 and Jan-2023
SELECT first_name || ' ' || last_name AS full_name, joining_date
FROM employees
WHERE joining_date BETWEEN TO_DATE('01-01-2022','DD-MM-YYYY') 
                      AND TO_DATE('01-01-2023','DD-MM-YYYY');

-- 9. Employees whose first name starts with 'A'
SELECT first_name || ' ' || last_name AS full_name 
FROM employees 
WHERE first_name LIKE 'A%';

-- 10. Employees NOT from Mumbai
SELECT first_name || ' ' || last_name AS full_name, city 
FROM employees 
WHERE city <> 'Mumbai';

-- 3️⃣ ORDER BY & LIMIT
-- 11. Employees sorted by salary (ascending)
SELECT * FROM employees ORDER BY salary ASC;

-- 12. Top 5 employees with highest salary
SELECT * FROM employees ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY;

-- 13. Employees sorted alphabetically by first name
SELECT * FROM employees ORDER BY first_name;

-- 14. Employees sorted by latest joining date
SELECT * FROM employees ORDER BY joining_date DESC;

-- 15. 3 employees with lowest salary
SELECT * FROM employees ORDER BY salary ASC FETCH FIRST 3 ROWS ONLY;

-- 4️⃣ Aggregate Functions
-- 16. Total number of employees
SELECT COUNT(emp_id) AS total_employees FROM employees;

-- 17. Average salary
SELECT AVG(salary) AS avg_salary FROM employees;

-- 18. Maximum salary & who earns it
SELECT first_name || ' ' || last_name AS full_name, salary 
FROM employees 
WHERE salary = (SELECT MAX(salary) FROM employees);

-- 19. Minimum salary & who earns it
SELECT first_name || ' ' || last_name AS full_name, salary 
FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);

-- 20. Total salary of all employees
SELECT SUM(salary) AS total_salary FROM employees;

-- 5️⃣ GROUP BY
-- 21. Employee count per department
SELECT department, COUNT(emp_id) AS total_employees 
FROM employees 
GROUP BY department;

-- 22. Average salary per department
SELECT department, AVG(salary) AS avg_salary 
FROM employees 
GROUP BY department;

-- 23. Employee count per city
SELECT city, COUNT(emp_id) AS total_employees 
FROM employees 
GROUP BY city;

-- 24. Total sales per month (from orders)
SELECT TO_CHAR(order_date,'YYYY-MM') AS order_month, SUM(amount) AS total_sales
FROM orders
GROUP BY TO_CHAR(order_date,'YYYY-MM')
ORDER BY order_month;

-- 25. Highest salary per department
SELECT department, MAX(salary) AS max_salary 
FROM employees 
GROUP BY department
ORDER BY max_salary DESC;

-- 6️⃣ HAVING Clause
-- 26. Departments with more than 2 employees
SELECT department, COUNT(emp_id) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(emp_id) > 2;

-- 27. Cities where total salary > 10000
SELECT city, SUM(salary) AS total_salary
FROM employees
GROUP BY city
HAVING SUM(salary) > 10000;

-- 28. (For categories/products table, skipped here)

-- 29. Departments with average salary > 60000
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- 30. Employees with more than 3 orders
SELECT emp_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY emp_id
HAVING COUNT(order_id) > 3;

-- 7️⃣ Joins
-- 31. INNER JOIN employees & orders
SELECT e.first_name || ' ' || e.last_name AS full_name, e.salary, o.order_date
FROM employees e
INNER JOIN orders o ON e.emp_id = o.emp_id;

-- 32. LEFT JOIN (all orders with employee info if exists)
SELECT o.order_id, e.first_name || ' ' || e.last_name AS full_name, o.amount
FROM orders o
LEFT JOIN employees e ON o.emp_id = e.emp_id;

-- 33. RIGHT JOIN (all employees with orders if any)
SELECT o.order_id, e.first_name || ' ' || e.last_name AS full_name, o.amount
FROM employees e
RIGHT JOIN orders o ON e.emp_id = o.emp_id;

-- 34. Employees with their department names
-- NOTE: Your employees table stores department NAME, not ID.
-- To make this work, employees table should store department_id.
SELECT e.first_name || ' ' || e.last_name AS full_name, d.department_name
FROM employees e
JOIN departments d ON e.department = d.department_name;

-- 8️⃣ Subqueries
-- 36. Employees with salary > average salary
SELECT emp_id, first_name || ' ' || last_name AS full_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 37. Employees with salary < average salary
SELECT emp_id, first_name || ' ' || last_name AS full_name, salary
FROM employees
WHERE salary < (SELECT AVG(salary) FROM employees);

-- 39. Employees who made at least one order
SELECT DISTINCT e.emp_id, e.first_name || ' ' || e.last_name AS full_name
FROM employees e
WHERE e.emp_id IN (SELECT emp_id FROM orders);

-- 40. Employees not in Finance or Marketing
SELECT emp_id, first_name || ' ' || last_name AS full_name, department
FROM employees
WHERE department NOT IN ('Finance','Marketing');

-- 9️⃣ String Functions
-- 41. Uppercase names
SELECT UPPER(first_name || ' ' || last_name) AS full_name FROM employees;

-- 42. First 3 letters of first name
SELECT SUBSTR(first_name, 1, 3) AS short_name FROM employees;

-- 43. Concatenate first + last name
SELECT first_name || ' ' || last_name AS full_name FROM employees;

-- 44. Employees with Gmail accounts
SELECT first_name || ' ' || last_name AS full_name 
FROM employees 
WHERE email LIKE '%gmail%';

-- 45. Replace 'Finance' with 'Computer Science'
SELECT REPLACE(department,'Finance','Computer Science') AS new_department
FROM employees;

-- 🔟 Date Functions
-- 46. Current date
SELECT SYSDATE FROM dual;

-- 47. Orders placed in last 7 days
SELECT * 
FROM orders 
WHERE order_date >= SYSDATE - 7;

-- 48. Extract year from system date
SELECT EXTRACT(YEAR FROM SYSDATE) AS current_year FROM dual;

-- 49. Employees joined in 2022
SELECT first_name || ' ' || last_name AS full_name, joining_date
FROM employees
WHERE EXTRACT(YEAR FROM joining_date) = 2022;

-- 50. Calculate total work experience (years & months)
SELECT first_name || ' ' || last_name AS full_name,
       joining_date,
       TRUNC(MONTHS_BETWEEN(SYSDATE, joining_date) / 12) || ' years ' ||
       MOD(TRUNC(MONTHS_BETWEEN(SYSDATE, joining_date)), 12) || ' months' 
       AS total_experience
FROM employees;
