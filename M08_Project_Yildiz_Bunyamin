--1.	Create a view called TITLE_UNAVAIL to show the movie titles and media_id of the media not returned yet. 
-- The view should not allow any DML operations.


CREATE VIEW TITLE_UNAVAIL AS
SELECT MOVIES.TITLE, MEDIA.MEDIA_ID
FROM MEDIA
JOIN MOVIES ON MEDIA.TITLE_ID = MOVIES.TITLE_ID
JOIN RENTAL_HISTORY ON MEDIA.MEDIA_ID = RENTAL_HISTORY.MEDIA_ID
WHERE RENTAL_HISTORY.RETURN_DATE IS NULL;


-- 2.	Use a sequence to generate PKs for CUSTOMER_ID in RENTAL_CUSTOMERS table. 
--Begin at 101 and increment by 1.
CREATE SEQUENCE rental_customers_seq
START WITH 101    -- 101 is starting
INCREMENT BY 1    -- increment by 1
NOMAXVALUE        -- No max
NOCYCLE;          -- do not cycle


-- 3.	Use a sequence to generate PKs for TITLE_ID in MOVIES table. 
-- Begin at 1 and increment by 1. 



CREATE SEQUENCE movies_seq
START WITH 1      -- Start at 1
INCREMENT BY 1    -- Increment by 1
NOMAXVALUE        -- No maximum value
NOCYCLE;          -- Do not cycle back to the start value


CREATE SEQUENCE media_seq
START WITH 92     -- Start at 92
INCREMENT BY 1    -- Increment by 1
NOMAXVALUE        -- No maximum value 
NOCYCLE;          -- Do not cycle back


-- 4.	Use a sequence to generate PKs for ACTOR_ID in ACTOR table. 
-- Begin at 1001 and increment by 1.

CREATE SEQUENCE actor_seq
START WITH 1001   -- Start at 1001
INCREMENT BY 1    -- Increment by 1
NOMAXVALUE        -- No maximum value 
NOCYCLE;          -- Do not cycle back 

-- D.	Creating Indexes (5 points)
-- 1.	Create an index on the last_name column of the Rental Customers table.
CREATE INDEX index_name ON Rental_Customers (last_name);

--E. Create a synonym called TU for the TITLE_UNAVAIL view.

CREATE SYNONYM TU FOR TITLE_UNAVAIL;


--F. a
SELECT MOVIES.TITLE, COUNT(*) AS rental_count
FROM RENTAL_HISTORY
JOIN MEDIA ON RENTAL_HISTORY.MEDIA_ID = MEDIA.MEDIA_ID
JOIN MOVIES ON MEDIA.TITLE_ID = MOVIES.TITLE_ID
GROUP BY MOVIES.TITLE
ORDER BY rental_count DESC;


--F b
SELECT 
  FIRST_NAME || ' ' || LAST_NAME AS customer_name,
  ADDRESS, 
  CITY, 
  STATE,
  LENGTH(FIRST_NAME || ' ' || LAST_NAME) AS name_length,
  LENGTH(ADDRESS) AS address_length
FROM CUSTOMER
WHERE CUSTOMER_ID IN (
  SELECT CUSTOMER_ID
  FROM RENTAL_HISTORY
  GROUP BY CUSTOMER_ID
  HAVING COUNT(*) > 1
)
ORDER BY LAST_NAME;


--F c


SELECT MEDIA.FORMAT, COUNT(*) AS rental_count
FROM RENTAL_HISTORY
JOIN MEDIA ON RENTAL_HISTORY.MEDIA_ID = MEDIA.MEDIA_ID
GROUP BY MEDIA.FORMAT
ORDER BY rental_count DESC;




--F d

SELECT 
    ACTORS.FIRST_NAME || ' ' || ACTORS.LAST_NAME AS actor_name, 
    MOVIES.TITLE 
FROM STAR_BILLINGS
JOIN ACTORS ON STAR_BILLINGS.ACTOR_ID = ACTORS.ACTOR_ID
JOIN MOVIES ON STAR_BILLINGS.TITLE_ID = MOVIES.TITLE_ID
ORDER BY ACTORS.LAST_NAME, ACTORS.FIRST_NAME;

--F e

SELECT RELEASE_DATE, TITLE
FROM MOVIES
WHERE RELEASE_DATE <= ADD_MONTHS(TRUNC(SYSDATE, 'YYYY'), -300) 
ORDER BY RELEASE_DATE;






--G 1

SELECT 
    to_char(RENTAL_HISTORY.RENTAL_DATE, 'YYYY-MM') AS rental_month, 
    COUNT(*) AS rentals_count 
FROM 
    RENTAL_HISTORY 
JOIN 
    MEDIA ON MEDIA.MEDIA_ID = RENTAL_HISTORY.MEDIA_ID 
GROUP BY 
    to_char(RENTAL_HISTORY.RENTAL_DATE, 'YYYY-MM') 
ORDER BY 
    rental_month;  


--G2 
SELECT 
    category, 
    SUM(rental_count * profit_margin) AS total_profit 
FROM 
    (
        SELECT 
            MOVIES.category, 
            COUNT(*) AS rental_count, 
            0.5 AS profit_margin -- Hypothetical profit margin 
        FROM 
            RENTAL_HISTORY 
        JOIN 
            MEDIA ON RENTAL_HISTORY.MEDIA_ID = MEDIA.MEDIA_ID 
        JOIN 
            MOVIES ON MEDIA.TITLE_ID = MOVIES.TITLE_ID 
        GROUP BY 
            MOVIES.category
    ) 
GROUP BY 
    category 
ORDER BY 
    total_profit DESC;


