--BUNYAMIN FUAT YILDIZ DATE: 02-10-2024
--M04 Hands-On Lab - Querying Multiple Tables Using Joins and Using Set Operators
--Date: 02-10-2024




-- A.	Using Joins 
-- a. Write a query using a join that displays employees’ IDs, names, and department names. Sort your results by department and employee last name.
 

SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name, e.last_name;


-- b.	Write a query using a join that displays employees’ IDs, names, and job names. Sort your results by department and employee last name
SELECT e.employees_id, e.first_name, e.last_name, j.job_title
FROM employees e
JOIN jobs j On e.job_title = j.job_title
JOIN departments d ON e.department_id = d.department_id
ORDER BY  d.department_name, e.last_name;

--c. Write a query using a join that displays employees’ IDs, names, job and department names. Sort your results by department, job, and employee last name.
SELECT e.employee_id, e.first_name, e.last_name, j.job_title, d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
ORDER BY d.department_name, j.job_title, e.last_name;

--d.Write a query using a self-join to display employees’ IDs and names along with their manager’s ID and name. Sort your results by the managers’ last names and the employees’ last names.
SELECT e.employee_id AS employee_id,
       e.first_name AS employee_first_name,
       e.last_name AS employee_last_name,
       m.employee_id AS manager_id,
       m.first_name AS manager_first_name,
       m.last_name AS manager_last_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id  -- left join thus there might be some employees without manager.
ORDER BY m.last_name, e.last_name;


--e. Write a query using a join that displays customers’ IDs, names, order numbers, and order dates. Sort your results by order date (descending) and customers’ names.

SELECT c.customer_id, 
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       o.order_nbr,
       o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC, c.last_name, c.first_name;

--f. Write a query using a join that displays customer customers’ IDs, names, order numbers, order dates, and book titles associated with the order. 
--Sort your results by order date (descending), customers’ last names, and book title.
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_nbr,
    o.order_date,
    b.book_title
FROM Customers c
JOIN  Orders o ON c.customer_id = o.customer_id
JOIN OrderItems oi ON o.order_nbr = oi.order_nbr
JOIN Books b ON oi.book_id = b.book_id
ORDER BY  o.order_date DESC, c.last_name, b.book_title;

--g. The company would like to send coupons to customers that like to read fiction.
-- Write a query to display a list of customers that have purchased book titles that are categorized as fiction (BOOK_CATEGORY_CD = F).
-- Your results should include the customers’ name and email. It should also include the order number, date, and book title for their previous purchase of fiction book.
-- Sort your results by the customers’ last name, order date, and book title.

SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    o.order_nbr,
    o.order_date,
    b.book_title
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
JOIN
    order_items oi ON o.order_nbr = oi.order_nbr
JOIN
    books b ON oi.book_id = b.book_id
WHERE
    b.BOOK_CATEGORY_CD = 'F'
ORDER BY
    c.last_name, o.order_date DESC, b.book_title;



/*H.	The company would like to identify all of the customers that have never placed an order. Write a query using a join that provides this information. 
Your results should include all the customer details and the order number column. Sort your results by the customers’ last name and then first name. */
SELECT c.*
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_nbr IS NULL
ORDER BY c.last_name, c.first_name;


--i. The company is performing an analysis of their inventory. They are considering purging books that are not popular with their customers. To do this they need a list of books 
--that have never been purchased. Write a query using a join that provides this information. Your results should include all the book details and the order number column. Sort your results by the book title.

SELECT b.*, oi.order_nbr
FROM books b
LEFT JOIN order_items oi ON b.book_id = oi.book_id
WHERE oi.order_nbr IS NULL
ORDER BY b.book_title;


-- SECTION B B.	Using Set Operators (30 points)


/*a.	The budget at the company is tight. The president is considering making cuts. He would like a report that lists people who meet the following criterion:
o	salary > 12500 and manager_id is not null
o	hire_date > to_date('1996-01-01','yyyy-mm-dd')
Using the Boolean operators AND and OR produced an inaccurate report. Write a query that uses the set operator INTERSECT to produce an accurate report.  */

(SELECT *
FROM employees
WHERE salary > 12500 AND manager_id IS NOT NULL)
INTERSECT
(SELECT *
FROM employees
WHERE hire_date > TO_DATE('1996-01-01','yyyy-mm-dd'));


/*
b. Describe why the using Boolean operators produces different results than the set operator INTERSECT in this scenario.
 ANSWER: When you use `AND` and `OR`, you're checking everything at once. 
But with `INTERSECT`, you're checking two separate things and then seeing where they overlap. So, `INTERSECT` only shows you items that meet both conditions completely.
*/


/*c.	The President of the company is also a customer. 
Write a SQL statement that adds his customer record to the database. 
Give him CUSTOMER_ID 999. His address is 1999 Green Mile Lane in Los Angeles, California 90210. */

INSERT INTO customers (customer_id, address, city, state, zip_code)
VALUES (999, '1999 Green Mile Lane', 'Los Angeles', 'California', '90210');

----or I add name because not null or empty (preferably according to ERD)
INSERT INTO Customers (customer_id, first_name, last_name, address, city, state, zip_code)
VALUES (999, 'Joe', 'Biden', '1999 Green Mile Lane', 'Los Angeles', 'California', '90210');


/* d.The company had a data breach and needs to contact everyone in their database – employees and customers. Write a SQL statement that uses the UNION set operator 
to create a list of employees and customers. Your results should include the employees’ and customers’ first names, last names, and email addresses and be sorted by last name.
*/

(SELECT first_name, last_name, email FROM employees)
UNION
(SELECT first_name, last_name, email FROM customers)
ORDER BY last_name;


/* e.Write a SQL statement that uses the UNION ALL set operator to create a list of employees and customers.
 Your results should include the employees’ and customers’ first names, last names, and email addresses and be sorted by last name. */
 (SELECT first_name, last_name, email FROM employees)
UNION ALL
(SELECT first_name, last_name, email FROM customers)
ORDER BY last_name;


/* f. Write a SQL statement that uses the INTERSECT set operator to create a list of employees and customers. 
Your results should include the employees’ and customers’ first names, last names, and email addresses and be sorted by last name. */
(SELECT first_name, last_name, email FROM employees)
INTERSECT
(SELECT first_name, last_name, email FROM customers)
ORDER BY last_name;


/*g. Write a SQL statement that uses the MINUS set operator to create a list of employees and customers. 
Your results should include the employees’ and customers’ first names, last names, and email addresses and be sorted by last name.  */

(SELECT first_name, last_name, email FROM employees)
MINUS
(SELECT first_name, last_name, email FROM customers)
ORDER BY last_name;


/* i a.	Which SQL statement should you use to create the list needed to contact everyone in the database about the data breach?*/
SELECT first_name, last_name, email FROM employees
UNION
SELECT first_name, last_name, email FROM customers
ORDER BY last_name;
/*This statement will create a list of all employees and customers, sorted by their last name. The email column can be used to contact everyone about the data breach.*/
