CREATE table Employees(
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    joining_date DATE,
    email VARCHAR(100)
);
INSERT INTO employees (emp_id, first_name, last_name, age, department, salary, city, joining_date, email)
VALUES (1, 'Amit', 'Sharma', 28, 'HR', 45000, 'Delhi', DATE '2022-05-10', 'amit.sharma@gmail.com');

INSERT INTO employees (emp_id, first_name, last_name, age, department, salary, city, joining_date, email)
VALUES (2, 'Priya', 'Verma', 35, 'Finance', 60000, 'Mumbai', DATE '2021-08-15', 'priya.verma@yahoo.com');

INSERT INTO employees (emp_id, first_name, last_name, age, department, salary, city, joining_date, email)
VALUES (3, 'Rahul', 'Mehta', 40, 'IT', 75000, 'Bangalore', DATE '2020-11-01', 'rahul.mehta@company.com');

INSERT INTO employees (emp_id, first_name, last_name, age, department, salary, city, joining_date, email)
VALUES (4, 'Sneha', 'Patel', 30, 'Marketing', 50000, 'Delhi', DATE '2023-01-20', 'sneha.patel@gmail.com');

INSERT INTO employees (emp_id, first_name, last_name, age, department, salary, city, joining_date, email)
VALUES (5, 'Karan', 'Singh', 26, 'IT', 55000, 'Chennai', DATE '2023-06-10', 'karan.singh@gmail.com');

INSERT INTO employees (emp_id, first_name, last_name, age, department, salary, city, joining_date, email)
VALUES (6, 'Anjali', 'Nair', 31, 'Finance', 62000, 'Bangalore', DATE '2021-09-05', 'anjali.nair@hotmail.com');

INSERT INTO employees (emp_id, first_name, last_name, age, department, salary, city, joining_date, email)
VALUES (7, 'Vikram', 'Kapoor', 29, 'Marketing', 48000, 'Pune', DATE '2022-03-12', 'vikram.kapoor@gmail.com');

INSERT INTO employees (emp_id, first_name, last_name, age, department, salary, city, joining_date, email)
VALUES (8, 'Deepa', 'Rao', 45, 'HR', 70000, 'Delhi', DATE '2019-12-01', 'deepa.rao@company.com');

INSERT INTO employees (emp_id, first_name, last_name, age, department, salary, city, joining_date, email)
VALUES (9, 'Sahil', 'Malik', 27, 'Finance', 58000, 'Mumbai', DATE '2023-02-14', 'sahil.malik@gmail.com');

INSERT INTO employees (emp_id, first_name, last_name, age, department, salary, city, joining_date, email)
VALUES (10, 'Meena', 'Iyer', 33, 'IT', 72000, 'Bangalore', DATE '2020-07-07', 'meena.iyer@gmail.com');

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR2(50)
);

INSERT INTO departments VALUES (1, 'HR');
INSERT INTO departments VALUES (2, 'Finance');
INSERT INTO departments VALUES (3, 'IT');
INSERT INTO departments VALUES (4, 'Marketing');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    emp_id INT,
    order_date DATE,
    amount NUMBER(10,2),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO orders VALUES (101, 1, DATE '2023-08-03', 2200);
INSERT INTO orders VALUES (103, 2, DATE '2023-08-05', 3000);
INSERT INTO orders VALUES (104, 3, DATE '2023-08-08', 800);
INSERT INTO orders VALUES (105, 4, DATE '2023-08-12', 1500);
INSERT INTO orders VALUES (106, 5, DATE '2023-08-15', 2500);
INSERT INTO orders VALUES (107, 6, DATE '2023-08-20', 3200);
INSERT INTO orders VALUES (108, 7, DATE '2023-08-21', 1800);
INSERT INTO orders VALUES (109, 8, DATE '2023-08-22', 2600);
INSERT INTO orders VALUES (110, 9, DATE '2023-08-25', 1000);
INSERT INTO orders VALUES (102, 10, DATE '2023-08-15', 2500);



-- 📌 50 SQL Practice Questions for Data Science

-- 1. Basic SELECT Queries
    -- 1.	Select all columns from the table Employees.
    SELECT * FROM EMPLOYEES;

    -- 2.	Select only name and age from Students.
    SELECT FIRST_NAME ||' ' || LAST_NAME, AGE FROM EMPLOYEES;

    -- 3.	Select unique department names from Employees.
    SELECT DISTINCT(DEPARTMENT) FROM EMPLOYEES;

    -- 4.	Select the first 10 rows from Customers.
    SELECT * FROM EMPLOYEES FETCH FIRST 5 ROWS ONLY;

    -- 5.	Select all customers whose city is "Delhi".
    SELECT FIRST_NAME ||' '||LAST_NAME FROM EMPLOYEES WHERE CITY='Delhi';

-- 2. WHERE Clause
    -- 6.	Select name with salary > 50000.  
    SELECT FIRST_NAME||' '||lAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY>50000;

    -- 7.	Select employees with age BETWEEN 25 AND 40.
    SELECT FIRST_NAME||' '||lAST_NAME, AGE FROM EMPLOYEES WHERE AGE BETWEEN 25 AND 40;

    -- 8.	Select Joining date on '01/01/22 and 01/01/23'.
    SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, JOINING_DATE
    FROM EMPLOYEES
    WHERE JOINING_DATE BETWEEN TO_DATE('01-01-2022', 'DD-MM-YYYY') 
                        AND TO_DATE('01-01-2023', 'DD-MM-YYYY');

    -- 9.	Select employees whose name starts with "A".
    SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE 'A%';

    -- 10.	Select customers whose city is NOT "Mumbai".
    SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, CITY FROM EMPLOYEES WHERE CITY <> 'Mumbai';

-- 3. ORDER BY & LIMIT
    -- 11.	Select all employees sorted by salary in ascending order.
    SELECT * FROM EMPLOYEES ORDER BY SALARY;

    -- 12.	Select top 5 products with highest price.
    SELECT * FROM EMPLOYEES ORDER BY SALARY DESC FETCH FIRST 5 ROW ONLY;

    -- 13.	Select students sorted by name alphabetically.
    SELECT * FROM EMPLOYEES ORDER BY FIRST_NAME;

    -- 14.	Select employees sorted by joining_date descending.
    SELECT * FROM EMPLOYEES ORDER BY JOINING_DATE DESC;

    -- 15.	Select 3 customers with lowest salary amount.
    SELECT * FROM EMPLOYEES ORDER BY SALARY FETCH FIRST 3 ROW ONLY;

-- 4. Aggregate Functions
    -- 16.	Find total number of employees.
    SELECT COUNT(EMP_ID) AS TOTAL_EMPLOYEES FROM EMPLOYEES;

    -- 17.	Find average salary of employees.
    SELECT AVG(SALARY) AS AVERAGE_SALARY FROM EMPLOYEES;

    -- 18.	Find maximum salary of employees.
    SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, SALARY AS MAX_SALARY FROM EMPLOYEES WHERE SALARY=(SELECT MAX(SALARY) FROM EMPLOYEES);

    -- 19.	Find minimum salary of employees.
    SELECT FIRST_NAME||' '||LAST_NAME AS FULL_NAME, SALARY AS MIN_SALARY FROM EMPLOYEES WHERE SALARY=(SELECT MIN(SALARY) FROM EMPLOYEES);
    -- 20.	Find total salary.
    SELECT SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES;

-- 5. GROUP BY
    -- 21.	Find number of employees in each department.
    SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM EMPLOYEES GROUP BY DEPARTMENT;

    -- 22.	Find average salary per department.
    SELECT DEPARTMENT, AVG(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT;

    -- 23.	Find number of employees per city.
    SELECT CITY, COUNT(CITY) FROM EMPLOYEES GROUP BY CITY;

    -- 24.	Find total sales per month.
    -- ?
    -- 25.	Find highest salary in each department.
    SELECT DEPARTMENT, MAX(SALARY) AS MAX_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT ORDER BY MAX_SALARY DESC;

-- 6. HAVING Clause
    -- 26.	Find departments with more than 10 employees.
    SELECT DEPARTMENT, COUNT(EMP_ID) AS TOTAL_EMPLOYEES
    FROM EMPLOYEES
    GROUP BY DEPARTMENT
    HAVING COUNT(EMP_ID) > 2;

    -- 27.	Find cities with total salary > 10000.
    SELECT CITY, SUM(SALARY) AS TOTAL_SALARY 
    FROM EMPLOYEES 
    GROUP BY CITY
    HAVING SUM(SALARY) >10000;

    -- 28.	Find categories with average price > 500.
    -- ?
    -- 29.	Find department groups with average salary > 48000.
    SELECT DEPARTMENT, AVG(SALARY) AS AVG_SALARY
    FROM EMPLOYEES
    GROUP BY DEPARTMENT
    HAVING AVG(SALARY) > 60000;

    -- 30.	Find customers who placed more than 3 orders.
    -- ?
-- 7. Joins
    -- 31.	Perform INNER JOIN on Orders and employees.
    SELECT EMPLOYEES.FIRST_NAME||' '||EMPLOYEES.LAST_NAME AS FULL_NAME, EMPLOYEES.SALARY, ORDERS.order_date 
    FROM EMPLOYEES INNER JOIN ORDERS ON EMPLOYEES.EMP_ID=ORDERS.EMP_ID;

    -- 32.	Get all customers and their orders (LEFT JOIN).
    SELECT ORDERS.EMP_ID, EMPLOYEES.FIRST_NAME||' '||EMPLOYEES.LAST_NAME AS FULL_NAME, EMPLOYEES.SALARY, ORDERS.ORDER_DATE 
    FROM ORDERS LEFT JOIN EMPLOYEES ON ORDERS.EMP_ID=EMPLOYEES.EMP_ID;

    -- 33.	Get all orders and their customers (RIGHT JOIN).
    SELECT ORDERS.EMP_ID, EMPLOYEES.FIRST_NAME||' '||EMPLOYEES.LAST_NAME AS FULL_NAME, EMPLOYEES.SALARY, ORDERS.ORDER_DATE 
    FROM EMPLOYEES RIGHT JOIN ORDERS ON ORDERS.EMP_ID=EMPLOYEES.EMP_ID;

    -- 34.	Get employees with their department names (JOIN on department_id).
    SELECT  EMPLOYEES.FIRST_NAME||' '||EMPLOYEES.LAST_NAME AS FULL_NAME, departments.department_name
    FROM EMPLOYEES JOIN departments ON departments.department_id=EMPLOYEES.EMP_ID;

    -- 35.	Get products with supplier names.
    -- ?
-- 8. Subqueries
    -- 36.	Select employees with salary greater than average salary.
    SELECT EMP_ID, FIRST_NAME||' '||LAST_NAME AS FULL_NAME, SALARY 
    FROM EMPLOYEES 
    WHERE SALARY >(SELECT AVG(SALARY) FROM EMPLOYEES);

    -- 37.	Select employees with salary less than average salary.
    SELECT EMP_ID, FIRST_NAME||' '||LAST_NAME AS FULL_NAME, SALARY 
    FROM EMPLOYEES 
    WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);

    -- 38.	Select students who scored more than class average.

    -- 39.	Select customers who made at least one order.
    -- 40.	Select employees who do not belong to any department.
    SELECT EMP_ID, FIRST_NAME||' '||LAST_NAME AS FULL_NAME, DEPARTMENT
    FROM EMPLOYEES WHERE DEPARTMENT NOT IN ('Finance','Marketing');

-- 9. String Functions
    -- 41.	Select upper-case version of employee names.
    SELECT UPPER(FIRST_NAME||' '||LAST_NAME) AS FULL_NAME FROM EMPLOYEES;

    -- 42.	Select first 3 letters of each customer name.
    SELECT UPPER(SUBSTR(FIRST_NAME,3)) FROM EMPLOYEES;

    -- 43.	Concatenate first_name and last_name of employees.
    SELECT FIRST_NAME||' '||LAST_NAME FROM EMPLOYEES;

    -- 44.	Select customers where email contains 'gmail'.
    SELECT FIRST_NAME FROM EMPLOYEES WHERE EMAIL IS NOT NULL;

    -- 45.	Replace 'old' with 'new' in product description.
    SELECT REPLACE(department, 'Finance', 'Computer Science') AS department
    FROM employees;

-- 10. Date Functions
-- 46.	Select current date.
SELECT SYSDATE FROM DUAL;

-- 47.	Select orders placed in last 7 days.
SELECT * 
FROM orders 
WHERE order_date < SYSDATE - 750;

-- 48.	Extract year from order_date.
SELECT EXTRACT(YEAR FROM SYSDATE) AS CURRENT_YEAR FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY') AS CURRENT_YEAR FROM DUAL;

-- 49.	Find employees who joined in year 2022.
SELECT FIRST_NAME||' '||LAST_NAME AS FULL_NAME,JOINING_DATE FROM EMPLOYEES  WHERE EXTRACT(YEAR FROM joining_date) = 2022;

-- 50.	Calculate how many day join in my company of employees.
SELECT first_name || ' ' || last_name AS full_name,
       joining_date,
       TRUNC(MONTHS_BETWEEN(SYSDATE, joining_date) / 12) || ' years ' ||
       MOD(TRUNC(MONTHS_BETWEEN(SYSDATE, joining_date)), 12) || ' months' 
       AS total_experience
FROM employees;


