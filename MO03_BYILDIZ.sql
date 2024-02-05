-- Name: BUNYAMIN FUAT YILDIZ
-- Assignment: DBMS130 – M03 Hands-On Lab Assignments Inserting and Modifying Data and Writing Simple Queries
-- Date: 04-02-2024


/* INTENTIONALLY KEPT AS A COMMENT. INSERTION DATA.
INSERT INTO ORDERS (ORDER_NBR, CUSTOMER_ID, ORDER_DATE)
VALUES
(649512688683, 185, '2019-03-09'),
(324151439065, 185, '2017-06-26'),
(430152209691, 185, '2020-10-01'),
(588632209701, 185, '2015-03-25'),
(933411302657, 288, '2015-01-21'),
(965076542239, 288, '2019-02-09'),
(499373860704, 312, '2017-06-17'),
(957050047999, 355, '2019-04-26'),
(65868172527, 426, '2016-04-18'),
(714604403275, 508, '2021-03-30'),
(904222078731, 508, '2018-05-14'),
(922814204519, 869, '2018-10-13'),
(900853212124, 869, '2018-03-18'),
(593967187118, 869, '2015-12-26');



INSERT INTO ORDER_ITEMS (ORDER_ITEM_ID, ORDER_NUMBER, BOOK_ID, QUANTITY)
VALUES 
  ('28637904056633600000', '649512688683', 50322, 10),
  ('25663800028063600000', '324151439065', 53434, 1),
  ('68464155235711300000', '430152209691', 53434, 1),
  ('71997307208349100000', '588632209701', 70003, 1),
  ('57136305957312800000', '933411302657', 89096, 1),
  ('45111184361031100000', '965076542239', 117356, 1),
  ('79351459472267400000', '965076542239', 124600, 1),
  ('19659894383050200000', '499373860704', 125306, 1),
  ('16327448132059600000', '499373860704', 188113, 1),
  ('16345293331300000000', '499373860704', 251164, 1),
  ('70745685628809400000', '499373860704', 286413, 1),
  ('35746858636498500000', '499373860704', 339453, 1),
  ('27447198525788300000', '65868172527', 372897, 2),
  ('99251548914643900000', '904222078731', 384093, 1),
  ('85373557451769700000', '499373860704', 386905, 1),
  ('90728380725731900000', '649512688683', 403678, 1),
  ('57468876032291100000', '900853212124', 403678, 1),
  ('4937231338855340000', '430152209691', 650799, 1),
  ('15584903349880300000', '499373860704', 650799, 1),
  ('7221195775361660000', '593967187118', 693371, 1),
  ('98921575467765400000', '499373860704', 755002, 1),
  ('74733510108021200000', '65868172527', 875164, 1),
  ('80658895683305100000', '324151439065', 875164, 1),
  ('90350160475703600000', '499373860704', 875164, 1),
  ('78997408073354000000', '922814204519', 875164, 1),
  ('43252559470829600000', '965076542239', 959505, 1),
  ('26206850182085300000', '957050047999', 966705, 10);



INSERT INTO CUSTOMERS (customer_id, first_name, last_name, street_address, city, state, zip_code, country, phone_number, email, date_of_birth, gender)
VALUES
  (619, 'Burty', 'Copestake', '6 Buell Pass', 'Springfield', 'Virginia', '22156', 'US', '571-394-6051', 'bcopestake0@kickstarter.com', NULL, NULL),
  (408, 'Duky', 'Kasparski', '1 Village Green Plaza', 'Tampa', 'Florida', '33680', 'US', '813-684-4314', NULL, NULL, NULL),
  (508, 'Alix', 'Stedall', '97 West Pass', 'Jacksonville', 'Florida', '32204', 'US', '904-828-1995', 'astedall2@smh.com.au', NULL, NULL),
  (863, 'Sigismondo', 'Benbow', '72 Brown Place', 'Silver Spring', 'Maryland', '20910', 'US', '202-734-7820', 'sbenbow3@ihg.com', NULL, NULL),
  (111, 'Ebeneser', 'Heugh', '831 Coolidge Crossing', 'Newark', 'Delaware', '19725', 'US', '302-335-9220', 'eheugh4@bbc.co.uk', NULL, NULL),
  (495, 'Aluino', 'Swoffer', '0866 Oneill Street', 'Sacramento', 'California', '95852', 'US', '916-461-2868', 'aswoffer5@mlb.com', NULL, NULL),
  (16, 'Otes', 'Goldhawk', '69 Waxwing Drive', 'Sacramento', 'California', '94291', 'US', '916-671-1350', 'ogoldhawk6@pbs.org', NULL, NULL),
  (548, 'Giustino', 'Hamblin', '98 Sycamore Circle', 'Las Vegas', 'Nevada', '89105', 'US', '702-662-0739', 'ghamblin7@unblog.fr', NULL, NULL),
  (288, 'Conn', 'Talman', '10156 Beilfuss Circle', 'Reston', 'Virginia', '20195', 'US', '703-426-3331', NULL, NULL, NULL),
  (355, 'Keith', 'Boulder', '846 Sauthoff Crossing', 'Lafayette', 'Louisiana', '70505', 'US', '337-909-4629', 'kboulder9@nydailynews.com', NULL, NULL),
  (185, 'Broderick', 'Huck', '33 Sutherland Lane', 'San Diego', 'California', '92176', 'US', '619-818-9125', 'bhucka@latimes.com', NULL, NULL),
  (788, 'Thorstein', 'Jepensen', '8437 Katie Hill', 'Raleigh', 'North Carolina', '27690', 'US', '919-150-8515', 'tjepensenb@joomla.org', NULL, NULL),
  (312, 'Fredrick', 'Tewkesbury', '6632 Blackbird Street', 'Pensacola', 'Florida', '32590', 'US', '850-175-1836', 'ftewkesburyc@vinaora.com', NULL, NULL),
  (940, 'Tabor', 'Wittier', '57 Sloan Circle', 'Van Nuys', 'California', '91499', 'US', '213-238-8569', 'twittiere@cnn.com', NULL, NULL),
  (853, 'Giffy', 'Besque', '06 Southridge Terrace', 'Camden', 'New Jersey', '8104', 'US', '856-572-7171', 'gbesquef@4shared.com', NULL, NULL),
  (385, 'Sigismondo', 'O'Dunniom', '0 North Crossing', 'Beaverton', 'Oregon', '97075', 'US', NULL, 'sodunniomg@shutterfly.com', NULL, NULL),
  (426, 'Oates', 'Duham', '486 Grasskamp Place', 'Oklahoma City', 'Oklahoma', '73119', 'US', '405-967-3821', 'oduhamh@bloomberg.com', NULL, NULL),
  (869, 'Allen', 'Haskew', '31 Saint Paul Place', 'Austin', 'Texas', '78726', 'US', '512-689-2030', 'ahaskewi@domainmarket.com', NULL, NULL),
  (43, 'Rudyard', 'Jendrassik', '23787 Lighthouse Bay Crossing', 'Lakeland', 'Florida', '33811', 'US', '863-833-1300', NULL, NULL, NULL);

*/
--C.	UPDATE Statements (5 points)
-- 1a.	Fredrick Tewkesbury

UPDATE CUSTOMERS
SET date_of_birth = '1996 '
UPDATE CUSTOMERS
SET date_of_birth = '1996-06-12'
WHERE customer_id = 312;

--b update US
UPDATE CUSTOMERS
SET COUNTRY = 'US'
WHERE COUNTRY = 'United States';

--c.	Ellen Abel (EMPLOYEE_ID 174) \
UPDATE EMPLOYEES
SET JOB_ID = 'SA_MAN',
    SALARY = 15099,
    MANAGER_ID = 100
WHERE EMPLOYEE_ID = 174;


--dd.	A few employees received raises. Write UPDATE statements Their employee IDs and new salary amounts are listed below.	143 – New salary = 2753  and 144 – New salary = 2653

UPDATE EMPLOYEES
SET SALARY = 2753
WHERE EMPLOYEE_ID = 143;

UPDATE EMPLOYEES
SET SALARY = 2653
WHERE EMPLOYEE_ID = 144;




---DELETE
--A DELETE TWO BOOKS  981311 AND  373086


DELETE FROM BOOKS
WHERE BOOK_ID = 981311;

DELETE FROM BOOKS
WHERE BOOK_ID = 373086;

--B- DELET CUSTOMER 385

DELETE FROM CUSTOMERS
WHERE customer_id = 385;



--F SECTION
--A
SELECT * FROM CUSTOMERS; -- RETRIEVES ALL COLUMNS FROM CUSTOMER TABLE


--b.	Write a query to display customers’ first names, last names, and email addresses.
SELECT FIRST_NAME, LAST_NAME, EMAIL
FROM CUSTOMERS;




--C CONCAT FIRSTNAME AND LASTNAME 
SELECT FIRST_NAME ||' '|| LAST_NAME 
FROM CUSTOMERS;


--D ALIAS


SELECT FIRST_NAME || ' ' || LAST_NAME AS "CUSTOMER FULL NAME"
FROM CUSTOMERS;


--E  Sentence build
SELECT 'The customer ' || FIRST_NAME || ' ' || LAST_NAME || ' can be reached at the email address ' || EMAIL AS "CUSTOMER INFORMATION"
FROM CUSTOMERS;



--F.	Write a query that displays a list of employees’ IDs, names, salary, and salary with a 5% increase.

SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS "NAME", SALARY, SALARY * 1.05 AS "SALARY_WITH_5_INCREASE"
FROM EMPLOYEES;
 

-- ORDER BY STATEMENTS
--G
SELECT FIRST_NAME || ' ' || LAST_NAME AS "CUSTOMER FULL NAME"
FROM CUSTOMERS
ORDER BY "CUSTOMER FULL NAME" DESC;

--H MOST RECENT HIRED
SELECT *
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

--I Display the results so that departments are sorted in ascending order and the employees with the highest salaries display before those with lower salaries.

SELECT *
FROM EMPLOYEES
ORDER BY DEPARTMENT ASC, SALARY DESC;

--J
SELECT DISTINCT CUSTOMER_ID
FROM ORDERS;

--WHERE
--K work in the marketing department (DEPARTMENT_ID 20
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20
ORDER BY LAST_NAME;

--L salaries higher than $10,000. Sort the results so that the highest salary displays first.

SELECT *
FROM EMPLOYEES
WHERE SALARY > 10000
ORDER BY SALARY DESC;


--M to display the names and email addresses of the employees 
--hired on 07-JUN-94. Sort the results by the employees’ last names.
SELECT FIRST_NAME, LAST_NAME, EMAIL
FROM EMPLOYEES
WHERE HIRE_DATE = TO_DATE('07-JUN-94', 'DD-MON-YY')
ORDER BY LAST_NAME;


--N  phone numbers of the employees with area codes (1st 3 digits) of 650. Sort 

SELECT FIRST_NAME, LAST_NAME, PHONE_NUMBER
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '650%'
ORDER BY LAST_NAME;


--O last names begin with the letter ’H’. Sort the results by the employees’ last names.

SELECT *
FROM EMPLOYEES
WHERE LAST_NAME LIKE 'H%'
ORDER BY LAST_NAME;


--P  WHERE DEPARTMENT_ID = 80 AND SALARY > 5000
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80 AND SALARY > 5000
ORDER BY LAST_NAME ASC, SALARY DESC;


--Q (DEPARTMENT_IDs 20 and 80) and have a salary between $5,000 and $10,000. Sort 

SELECT *
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 80)
  AND SALARY >= 5000 AND SALARY <= 10000
ORDER BY LAST_NAME ASC, SALARY DESC;

--R REWRITE WITH BETWEEN

SELECT *
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 80)
  AND SALARY BETWEEN 5000 AND 10000
ORDER BY LAST_NAME ASC, SALARY DESC;


--S(DEPARTMENT_IDs 20 and 80). Sort the results by department and the employees’ last names.
SELECT FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (20, 80)
ORDER BY DEPARTMENT_ID ASC, LAST_NAME ASC;

--T NOT IN SALEES MARKETING 


SELECT FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (20, 80)
ORDER BY DEPARTMENT_ID ASC, LAST_NAME ASC;
