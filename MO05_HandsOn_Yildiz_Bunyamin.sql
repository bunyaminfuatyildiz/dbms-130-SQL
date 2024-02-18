--BUNYAMIN FUAT YILDIZ DATE: 02-10-2024
--M05 Hands-On Lab - Querying Multiple Tables Using Joins and Using Set Operators
--Date: 02-16-2024

--A. Single Row Functions
--a. Use the CONCAT function to concatenate the customers’ first and last names into one column. Your results should display in 1 column. Sort your results by customers’ last name.

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM CUSTOMER 
ORDER BY last_name;


--b.	Write a query using the SUBSTR function to display a list of distinct area codes (1st 3 digits of phone number) for employees. Name the column “Area Codes” and apply the default sort order.
SELECT DISTINCT SUBSTR(phone_number, 1, 3) AS "Area Codes"
FROM employees
ORDER BY "Area Codes";

--c.	Write a query using the LENGTH function to display a list of books with titles that are longer than 50 characters. Name the column “Long Titles” and apply the default sort order.
SELECT title AS "Long Titles"
FROM books
WHERE LENGTH(title) > 50
ORDER BY 1; 

--d Display the values in both columns in all lowercase using the LOWER function Sort the results by employees’ last name.

SELECT 
    LOWER(CONCAT(first_name, last_name)) AS "New Login",
    LOWER(email) AS "Current Email"
FROM 
    employees
ORDER BY 
    last_name;


--e.	Write a query using the MOD function to display a list of employees with salaries that are odd numbers. 

SELECT *
FROM employees
WHERE MOD(salary, 2) = 1;

--f. Write a query using the ROUND function and CURRENT_DATE (or SYSDATE) to calculate the number of years each employee has worked for the company. 
--Your results should list the employees’ ID, name, hire date, and “Years of Service”. Sort your results by the employees’ last name.

SELECT 
    employee_id,
    CONCAT(first_name, ' ', last_name) AS name,
    hire_date,
    ROUND(MONTHS_BETWEEN(CURRENT_DATE, hire_date) / 12) AS "Years of Service"
FROM 
    employees
ORDER BY 
    last_name;



--g. Write a query using TO_CHAR to list employees that were hired in 1999. Your results should be listed and ordered by employees’ last name.


SELECT *
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '1999'
ORDER BY last_name;





--h. Write a SQL statement using the MONTHS_BETWEEN function to calculate the years of service of each employee. Your results should include the employees’ IDs, names, and “Years of Service”.
-- Sort your results by their years of service (descending) and round the value to a whole number. You will need to use SYSDATE or CURRENT_DATE.

SELECT 
    employee_id, 
    CONCAT(first_name, ' ', last_name) AS "Name", 
    ROUND(MONTHS_BETWEEN(SYSDATE, hire_date) / 12) AS "Years of Service"
FROM employees
ORDER BY "Years of Service" DESC;


--i. Write a SQL statement to list customers names and phone numbers. If a customer does not have a phone number use the NVL function to display their email address instead. 
--Your results should display the customers’ IDs, names, and phone numbers/email addresses. Sort your results by the customers’ last names.
SELECT 
    customer_id, 
    CONCAT(first_name, ' ', last_name) AS Customer Name,
    NVL(phone_number, email) AS Contact Info
FROM customers
ORDER BY last_name;


/* j.	Write a SQL statement using CASE to classify employees into salary bands based on their salary:
•	LOW = 0 – 5000 
•	MID = 5000 – 10000
•	HIGH = 10001 – 50000
Your results should display the employees’ name, salary, and salary band. Sort your results by salary band and salary.*/


SELECT 
    CONCAT(first_name, ' ', last_name) AS "Employee Name",
    salary,
    CASE 
        WHEN salary BETWEEN 0 AND 5000 THEN 'LOW'
        WHEN salary BETWEEN 5001 AND 10000 THEN 'MID'
        WHEN salary BETWEEN 10001 AND 50000 THEN 'HIGH'
        ELSE 'Uncategorized' -- Handle potential salaries outside  defined ranges 
    END AS "Salary Band"
FROM employees
ORDER BY "Salary Band", salary;



--B.	Multiple-Row Functions (30 points)
--	a. Write a query using the COUNT function to display the number of employees in each department. Your results should be listed and sorted by department name.

SELECT department_name, COUNT(*) AS "Employee Count"
FROM employees
JOIN departments ON employees.department_id = departments.department_id
GROUP BY department_name
ORDER BY department_name;

-- b. write a query using the COUNT function to display the number of employees in the company hired between January 1, 1990 and December 31, 1995. Your results should return 1 number.
SELECT COUNT(*) AS "Employees Hired"
FROM employees
WHERE hire_date BETWEEN TO_DATE('1990-01-01', 'YYYY-MM-DD') 
                    AND TO_DATE('1995-12-31', 'YYYY-MM-DD');


-c.	Write a query using the MIN, MAX, and AVG functions to display the minimum, maximum, and average salaries of all employees. Your results should return 3 numbers in 1 row.

SELECT 
    MIN(salary) AS "Minimum Salary",
    MAX(salary) AS "Maximum Salary",
    AVG(salary) AS "Average Salary"
FROM employees;

--d. The company is performing a budget analysis. They need to determine how much they currently spend on employee salaries in each department. Write a query using the SUM function to provide this information. Your results should display the name of the department and the total salary of the department as “Total Salary”. 
-- Sort your results to display the department with the highest total first.

SELECT 
    d.department_name,
    SUM(e.salary) AS "Total Salary"
FROM 
    departments d
JOIN 
    employees e ON d.department_id = e.department_id
GROUP BY 
    d.department_name
ORDER BY 
    "Total Salary" DESC;


--e.to determine the minimum and maximum salaries employees are currently receiving in each department
--using the MIN and MAX functions to provide this information. Your results should display the name of the department, the minimum salary of the department as “Dept Min”,
-- and the maximum salary as “Dept Max”. Format the salaries as currency. Sort your results by the department name.
SELECT 
    department_name,
    TO_CHAR(MIN(salary), '$999,999.99') AS "Dept Min",
    TO_CHAR(MAX(salary), '$999,999.99') AS "Dept Max"
FROM 
    employees
INNER JOIN 
    departments ON employees.department_id = departments.department_id
GROUP BY 
    department_name
ORDER BY 
    department_name;


--f.The salary analysis information you provided in question is helpful; however, the company would like to add to their analysis. 
--They would like to know the average salary of employees in departments that have more than 2 employees. Write a query using the AVG function to provide this information. Your results should display the name of the department, the minimum salary of the department as “Dept Min”, 
--the maximum salary as “Dept Max”, and the average salary as “Dept Avg”. Format the salaries as currency. Sort your results by the department name.
SELECT 
    department_name,
    TO_CHAR(MIN(salary), '$99,999.99') AS "Dept Min",
    TO_CHAR(MAX(salary), '$99,999.99') AS "Dept Max",
    TO_CHAR(AVG(salary), '$99,999.99') AS "Dept Avg"
FROM employees
JOIN departments ON employees.department_id = departments.department_id
GROUP BY department_name
HAVING COUNT(*) > 2 -- Filter for departments with more than 2 employees
ORDER BY department_name;


--g.	Write a query using the COUNT function to display the number of customers that placed orders. Your results should return 1 number.

SELECT COUNT(DISTINCT customer_id) AS "Customers with Orders"
FROM orders;


--h. 	Write a query using the SUM function to calculate the total amount of all orders. Your results should return 1 number.
SELECT SUM(order_nbr) AS "Total Order Amount"
FROM Orders;

--j. Write a query to calculate the order total for each order. 
--Your results should display the customer’s ID, last name, first name, order date, and order total. 
--Display the order total as “Order Total”. You will need to use SUM and GROUP BY.

SELECT 
  o.customer_id,
  c.last_name,
  c.first_name,
  o.order_date,
  SUM(oi.unit_price * oi.quantity) AS "Order Total"
FROM 
  Orders o
JOIN 
  order_items oi ON o.order_nbr = oi.order_nbr
JOIN 
  Customers c ON o.customer_id = c.customer_id
GROUP BY 
  o.customer_id, c.last_name, c.first_name, o.order_date;
