
--POSTGRESQLQ1  Q1 What is the first name of the customer with company name “Alpine Ski House?”

SELECT FirstName
FROM Customer
WHERE CompanyName = 'Alpine Ski House';



-- Q2 How many AdventureWorks customers go by the title of “Mr."?

SELECT COUNT(*)
FROM Customer
WHERE Title = 'Mr.';


--Q3 Which salesperson in the customer table represents the LEAST number of customers?



SELECT Salesperson, COUNT(*) AS CustomerCount
FROM Customer
GROUP BY Salesperson
ORDER BY CustomerCount ASC
LIMIT 1;

--Q4- Which of the following company names appears multiple times in our customer table?


SELECT CompanyName, COUNT(*) AS Count
FROM Customer
GROUP BY CompanyName
HAVING COUNT(*) > 1;


--Q5 How many company names in our customer table contain the word "bike"?

SELECT COUNT(*)
FROM Customer
WHERE LOWER(CompanyName) LIKE '%bike%';


/*In this scenario, you are tasked with analyzing customer addresses.
This requires you to use table joins across three tables: customer, customeraddress, and address.*/

--Q6 How many companies have an address in the US state of Colorado?

SELECT COUNT(DISTINCT customer.CompanyName)
FROM customer
JOIN customeraddress ON customer.CustomerID = customeraddress.CustomerID
JOIN address ON customeraddress.AddressID = address.AddressID
WHERE address.Stateprovince = 'Colorado';

-- Q7- How many companies are based in the United Kingdom?
SELECT COUNT(DISTINCT customer.CompanyName)
FROM customer
JOIN customeraddress ON customer.CustomerID = customeraddress.CustomerID
JOIN address ON customeraddress.AddressID = address.AddressID
WHERE address.Countryregion = 'United Kingdom';


--Q8 How many companies in our database have more than one address?


SELECT COUNT(DISTINCT customer.CompanyName)
FROM customer
JOIN customeraddress ON customer.CustomerID = customeraddress.CustomerID
JOIN address ON customeraddress.AddressID = address.AddressID
GROUP BY customer.CompanyName
HAVING COUNT(DISTINCT address.AddressID) > 1;


--Q9  Which of the following cities is NOT included among the list of companies that have more than one address?

SELECT DISTINCT city
FROM customer
JOIN customeraddress ON customer.CustomerID = customeraddress.CustomerID
JOIN address ON customeraddress.AddressID = address.AddressID
GROUP BY address.city
HAVING COUNT(DISTINCT customer.CompanyName) > 1;

---Q10 How many unique companies are located in the US state of Oregon?



SELECT COUNT(DISTINCT customer.CompanyName)
FROM customer
JOIN customeraddress ON customer.CustomerID = customeraddress.CustomerID
JOIN address ON customeraddress.AddressID = address.AddressID
WHERE address.Stateprovince = 'Oregon';


--Q11 If you take all the customers with first name "John" and CROSS JOIN them to all the customers with first name "Margaret," how many rows will your query return?

SELECT COUNT(*)
FROM Customer AS JohnCustomers
CROSS JOIN Customer AS MargaretCustomers
WHERE JohnCustomers.FirstName = 'John' AND MargaretCustomers.FirstName = 'Margaret';
