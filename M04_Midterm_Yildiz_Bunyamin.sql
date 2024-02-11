-- BUNYAMIN FUAT YILDIZ
-- Assignment: DBMS130 – M04 Project Midterm
-- Date: 02-10-24



--B Creating Tables (20 points)

CREATE TABLE CUSTOMER (
  CUSTOMER_ID NUMBER(10) NOT NULL,
  LAST_NAME VARCHAR2(25 BYTE) NOT NULL,
  FIRST_NAME VARCHAR2(25 BYTE) NOT NULL,
  HOME_PHONE VARCHAR2(12 BYTE),
  ADDRESS VARCHAR2(100 BYTE),
  CITY VARCHAR2(30 BYTE),
  STATE VARCHAR2(2 BYTE),
  EMAIL VARCHAR2(25 BYTE),
  CELL_PHONE VARCHAR2(12 BYTE)
);

CREATE TABLE MEDIA (
  MEDIA_ID NUMBER(10) NOT NULL,
  FORMAT VARCHAR2(3 BYTE) NOT NULL,
  TITLE_ID NUMBER(10) NOT NULL
);

CREATE TABLE MOVIES (
  TITLE_ID NUMBER(10) NOT NULL,
  TITLE VARCHAR2(60 BYTE) NOT NULL,
  DESCRIPTION VARCHAR2(400 BYTE),
  RATING VARCHAR2(4 BYTE),
  CATEGORY VARCHAR2(20 BYTE),
  RELEASE_DATE DATE
);

CREATE TABLE ACTORS (
  ACTOR_ID NUMBER(10) NOT NULL,
  STAGE_NAME VARCHAR2(40 BYTE),
  LAST_NAME VARCHAR2(25 BYTE) NOT NULL,
  FIRST_NAME VARCHAR2(25 BYTE) NOT NULL,
  BIRTH_DATE DATE
);

CREATE TABLE RENTAL_HISTORY (
  MEDIA_ID NUMBER(10) NOT NULL,
  RENTAL_DATE DATE NOT NULL,
  CUSTOMER_ID NUMBER(10) NOT NULL,
  RETURN_DATE DATE
);

CREATE TABLE STAR_BILLINGS (
  ACTOR_ID NUMBER(10) NOT NULL,
  TITLE_ID NUMBER(10) NOT NULL,
  COMMENTS VARCHAR2(40 BYTE)
);
/*

--C 	Creating Constraints (10 points)
-- 1.. **Primary Key ASSIGN**
ALTER TABLE CUSTOMER
ADD CONSTRAINT pk_customer PRIMARY KEY (CUSTOMER_ID);

ALTER TABLE MEDIA
ADD CONSTRAINT pk_media PRIMARY KEY (MEDIA_ID);

ALTER TABLE MOVIES
ADD CONSTRAINT pk_movies PRIMARY KEY (TITLE_ID);

ALTER TABLE ACTORS
ADD CONSTRAINT pk_actors PRIMARY KEY (ACTOR_ID);

ALTER TABLE RENTAL_HISTORY
ADD CONSTRAINT pk_rental_history PRIMARY KEY (MEDIA_ID, RENTAL_DATE);

ALTER TABLE STAR_BILLINGS
ADD CONSTRAINT pk_star_billings PRIMARY KEY (ACTOR_ID, TITLE_ID);

--D 1. Inserting fake customer data
INSERT INTO CUSTOMER (CUSTOMER_ID, LAST_NAME, FIRST_NAME, HOME_PHONE, ADDRESS, CITY, STATE, EMAIL, CELL_PHONE)
VALUES
  (1, 'Tan', 'Li', '123-456-7890', '123 Orchid St', 'Tokyo', 'JP', 'li.tan@email.com', '987-654-3210'),
  (2, 'Kim', 'Min', '234-567-8901', '456 Sakura St', 'Seoul', 'KR', 'min.kim@email.com', '876-543-2109'),
  (3, 'Wong', 'Yuki', '345-678-9012', '789 Bamboo St', 'Shanghai', 'CN', 'yuki.wong@email.com', '765-432-1098'),
  (4, 'Chen', 'Sato', '456-789-0123', '012 Lotus St', 'Beijing', 'CN', 'sato.chen@email.com', '654-321-0987'),
  (5, 'Nguyen', 'Hiro', '567-890-1234', '345 Bonsai St', 'Hanoi', 'VN', 'hiro.nguyen@email.com', '543-210-9876'),
  (6, 'Singh', 'Aisha', '678-901-2345', '678 Jade St', 'New Delhi', 'IN', 'aisha.singh@email.com', '432-109-8765');


-- 2. Adding Foreign Key Constraints

-- For MEDIA table
ALTER TABLE MEDIA
ADD CONSTRAINT FK_MEDIA_MOVIES
FOREIGN KEY (TITLE_ID) REFERENCES MOVIES(TITLE_ID);

-- For RENTAL_HISTORY table
ALTER TABLE RENTAL_HISTORY
ADD CONSTRAINT FK_RENTAL_HISTORY_MEDIA
FOREIGN KEY (MEDIA_ID) REFERENCES MEDIA(MEDIA_ID);

ALTER TABLE RENTAL_HISTORY
ADD CONSTRAINT FK_RENTAL_HISTORY_CUSTOMERS
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID);

-- For STAR_BILLINGS table
ALTER TABLE STAR_BILLINGS
ADD CONSTRAINT FK_STAR_BILLINGS_ACTORS
FOREIGN KEY (ACTOR_ID) REFERENCES ACTORS(ACTOR_ID);

ALTER TABLE STAR_BILLINGS
ADD CONSTRAINT FK_STAR_BILLINGS_MOVIES
FOREIGN KEY (TITLE_ID) REFERENCES MOVIES(TITLE_ID);






--3 3.	Create check constraint on rating field in movie table to limit rating values to 'G', 'PG', 'R', 'PG13'.

ALTER TABLE MOVIES
ADD CONSTRAINT chk_rating CHECK (rating IN ('G', 'PG', 'R', 'PG13'));

--4 - check constraint for movies.
ALTER TABLE MOVIES
ADD CONSTRAINT chk_category CHECK (category IN ('DRAMA', 'COMEDY', 'ACTION', 'CHILD', 'SCIFI', 'DOCUMENTARY'));


-- SECTION D  	Inserting Data (20 points)

--1 at least 6 titles for your movies table

INSERT INTO movies (title_id, title, description, rating, category, release_date)
VALUES (1, 'Inception', 'Dream-sharing heist thriller', 'PG-13', 'Sci-Fi/Thriller', TO_DATE('17-Jul-2010', 'DD-MON-YYYY'));

INSERT INTO movies (title_id, title, description, rating, category, release_date)
VALUES (2, 'The Departed', 'Undercover cops clash within police force', 'R', 'Crime/Drama', TO_DATE('06-Oct-2006', 'DD-MON-YYYY'));

INSERT INTO movies (title_id, title, description, rating, category, release_date)
VALUES (3, 'Catch Me If You Can', 'Young con artist impersonates professionals', 'PG-13', 'Biography/Crime', TO_DATE('25-Dec-2002', 'DD-MON-YYYY'));

INSERT INTO movies (title_id, title, description, rating, category, release_date)
VALUES (4, 'Titanic', 'Star-crossed lovers on doomed ship', 'PG-13', 'Drama/Romance', TO_DATE('19-Dec-1997', 'DD-MON-YYYY'));

INSERT INTO movies (title_id, title, description, rating, category, release_date)
VALUES (5, 'Django Unchained', 'Freed slave seeks revenge on former owner', 'R', 'Western/Drama', TO_DATE('25-Dec-2012', 'DD-MON-YYYY'));

INSERT INTO movies (title_id, title, description, rating, category, release_date)
VALUES (6, 'The Revenant', 'Fur trapper seeks revenge after bear attack', 'R', 'Adventure/Drama', TO_DATE('25-Dec-2015', 'DD-MON-YYYY'));

--2 	Insert at least 6 fake records for your rental customers table.

-- Insert at least 6 fake records for the CUSTOMER table (all from Asia)

INSERT INTO CUSTOMER (CUSTOMER_ID, LAST_NAME, FIRST_NAME, HOME_PHONE, ADDRESS, CITY, STATE, EMAIL, CELL_PHONE)
VALUES
  (1, 'Tan', 'Li', '123-456-7890', '123 Orchid St', 'Tokyo', 'JP', 'li.tan@email.com', '987-654-3210'),
  (2, 'Kim', 'Min', '234-567-8901', '456 Sakura St', 'Seoul', 'KR', 'min.kim@email.com', '876-543-2109'),
  (3, 'Wong', 'Yuki', '345-678-9012', '789 Bamboo St', 'Shanghai', 'CN', 'yuki.wong@email.com', '765-432-1098'),
  (4, 'Chen', 'Sato', '456-789-0123', '012 Lotus St', 'Beijing', 'CN', 'sato.chen@email.com', '654-321-0987'),
  (5, 'Nguyen', 'Hiro', '567-890-1234', '345 Bonsai St', 'Hanoi', 'VN', 'hiro.nguyen@email.com', '543-210-9876'),
  (6, 'Singh', 'Aisha', '678-901-2345', '678 Jade St', 'New Delhi', 'IN', 'aisha.singh@email.com', '432-109-8765');

-- Insert at least 2 records into each of the following tables: RENTAL_HISTORY, MEDIA, STAR_BILLINGS, ACTORS

-- RENTAL_HISTORY
INSERT INTO RENTAL_HISTORY (MEDIA_ID, RENTAL_DATE, CUSTOMER_ID, RETURN_DATE)
VALUES
  (1, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 1, TO_DATE('2023-02-05', 'YYYY-MM-DD')),
  (2, TO_DATE('2023-02-20', 'YYYY-MM-DD'), 3, TO_DATE('2023-03-12', 'YYYY-MM-DD'));

-- MEDIA
INSERT INTO MEDIA (MEDIA_ID, FORMAT, TITLE_ID)
VALUES
  (1, 'DVD', 1),
  (2, 'Blu-ray', 2);

-- STAR_BILLINGS
INSERT INTO STAR_BILLINGS (ACTOR_ID, TITLE_ID, COMMENTS)
VALUES
  (1, 1, 'Great performance by the lead actor'),
  (3, 2, 'Amazing chemistry between the cast');

-- ACTORS
INSERT INTO ACTORS (ACTOR_ID, STAGE_NAME, LAST_NAME, FIRST_NAME, BIRTH_DATE)
VALUES
  (1, 'Tom Star', 'Cruise', 'Tom', TO_DATE('1962-07-03', 'YYYY-MM-DD')),
  (2, 'Emma Talent', 'Watson', 'Emma', TO_DATE('1990-04-15', 'YYYY-MM-DD'));

/*E
-- CREATE TABLE for STAR_BILLINGS

CREATE TABLE STAR_BILLINGS (
  ACTOR_ID NUMBER(10) NOT NULL,
  TITLE_ID NUMBER(10) NOT NULL,
  COMMENTS VARCHAR2(40 BYTE),
  PRIMARY KEY (ACTOR_ID, TITLE_ID),
  FOREIGN KEY (ACTOR_ID) REFERENCES ACTORS(ACTOR_ID),
  FOREIGN KEY (TITLE_ID) REFERENCES MOVIES(TITLE_ID)
);
*/
