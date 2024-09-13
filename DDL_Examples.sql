---------------------------------------------------------------
-- Intro Notes
---------------------------------------------------------------

/*
 * SQL stands for Structured Query Language
 * 
 * Core Concepts: 
 *    Removing Duplicates
 *    Filtering using the WHERE clause
 *    Constraints - Not Null, Unique, Primary Key, Foreign Key
 *    DEFAULT Keyword
 * 
 * DDL Statements:
 *    Truncate, Rename, Alter, CreatE, Drop [TRACED]
 *    DDL stands for Data Definition Language
 * 
 * Quick Note: If you want to drop the table and all dependent objects, use 
 *    DROP TABLE table_name CASCADE CONSTRAINTS;
 * 
 */


/*
 * 
 * DDL defines the structure of the data (e.g., tables and columns) as well as the 
 * relationships between the data (e.g., primary keys, foreign keys, and constraints).
 * 
 */


---------------------------------------------------------------
-- Example Code
---------------------------------------------------------------

-- Troubleshooting Statement
DROP TABLE LT_CUSTOMERS;

-- 1. Create Customer Table
CREATE TABLE LT_CUSTOMERS
(
	customer_id    NUMBER,
	name           VARCHAR2(255),
	address        VARCHAR2(255),
	website        VARCHAR2(255),
	credit_limit   NUMBER(8, 2)
);

-- 2. Insert Values into Customer Table (Lin Al Notation)
INSERT INTO LT_CUSTOMERS (CUSTOMER_ID, NAME, ADDRESS, CREDIT_LIMIT, WEBSITE) 
VALUES (
	177, 
	'United Continental Holdings',
	'2904 S Salian St, Syracuse, NY',
	5000, 
	'http://www.unitedcontinentalholdings.com'
);

-- 3. Insert Statements with Null Values

-- a. Null String Parameter
INSERT INTO LT_CUSTOMERS (CUSTOMER_ID, NAME, ADDRESS, CREDIT_LIMIT, WEBSITE)
VALUES (	
	160, 
	'', 
	'911 Sycamore St, Bronx, NY', 
	5000, 
	'http://www.americansteel.com'
);

-- b. Null Parameter Omission
INSERT INTO LT_CUSTOMERS (CUSTOMER_ID, ADDRESS, CREDIT_LIMIT, WEBSITE)
VALUES
(
	160,
	'911 Sycamore St, Bronx, NY',
	5000,
	'http://www.americansteel.com'
);

SELECT * FROM LT_CUSTOMERS;

-- 4. Add Not Null Constraint (Alter)
DELETE FROM LT_CUSTOMERS; -- deletes ALL records

ALTER TABLE LT_CUSTOMERS MODIFY NAME VARCHAR(255) NOT NULL; -- NOT NULL CONSTRAINT

INSERT INTO LT_CUSTOMERS (customer_id, name, address, credit_limit, website)
VALUES (
	177, 
	'United Continental Holdings', 
	'2904 S Salina St, Syracuse, NY', 
	5000, 
	'http://unitedcontinentalholdings.com'
);

INSERT INTO LT_CUSTOMERS (customer_id, name, address, credit_limit, website)
VALUES (
	160, 
	'',
	'911 Sycamore St, Bronx, NY',
	5000,
	'http://www.americansteel.com'
);

-- 5. Add not null constraint (Create) part 1
DROP TABLE LT_CUSTOMERS;

CREATE TABLE LT_CUSTOMERS
(
	customer_id   NUMBER,
	name          VARCHAR2(255) NOT NULL,
	address       VARCHAR2(255),
	website       VARCHAR2(255),
	credit_limit  NUMBER(8, 2)
);

INSERT INTO LT_CUSTOMERS (customer_id, name, address, credit_limit, website)
VALUES (
	177,
	'United Continental Holdigs',
	'2904 S Salina St, Syracuse, NY',
	5000,
	'http://unitedcontinentalholdings.com'
);

INSERT INTO LT_CUSTOMERS (customer_id, name, address, credit_limit, website)
VALUES (
	160,
	'',
	'911 Sycamore St, Bronx, NY',
	5000,
	'http://www.americansteel.com'
);

-- 6. Add not null constraint (Create) part 2
DROP TABLE LT_CUSTOMERS;

CREATE TABLE LT_CUSTOMERS
(
	customer_id   NUMBER,
	name          VARCHAR2(255) CONSTRAINT LT_CUSTOMERS_NAME NOT NULL,
	address       VARCHAR2(255),
	website       VARCHAR2(255),
	credit_limit  NUMBER(8, 2)
);

INSERT INTO LT_CUSTOMERS (customer_id, name, address, credit_limit, website)
VALUES (
	177,
	'United Continental Holdigs',
	'2904 S Salina St, Syracuse, NY',
	5000,
	'http://unitedcontinentalholdings.com'
);

INSERT INTO LT_CUSTOMERS (customer_id, name, address, credit_limit, website)
VALUES (
	160,
	'',
	'911 Sycamore St, Bronx, NY',
	5000,
	'http://www.americansteel.com'
);

-- 7. Tables with Duplicate Column Values
DROP TABLE LT_PRODUCTS; 

CREATE TABLE LT_PRODUCTS
(
	product_id NUMBER,
	product_name VARCHAR2(255),
	description VARCHAR2(2000),
	standard_cost NUMBER(9, 2),
	list_price NUMBER(9, 2),
	category_id NUMBER
);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

-- 8. Add Unique Constraint (Alter)
DELETE FROM LT_PRODUCTS;

ALTER TABLE LT_PRODUCTS MODIFY PRODUCT_NAME VARCHAR(255) UNIQUE; -- system generated constraint name

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

-- 9. Add Unique Constraint (Create) part 1
DROP TABLE LT_PRODUCTS;

CREATE TABLE LT_PRODUCTS 
(
	product_id NUMBER,
	product_name VARCHAR2(255) UNIQUE, -- system generated constraint name
	description VARCHAR2(2000),
	standard_cost NUMBER(9, 2), -- means 9 digits 2 of which are after decimal
	list_price NUMBER(9, 2),
	category_id NUMBER
);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

-- 10. Add Unique Constraint (Create) part 2
DROP TABLE LT_PRODUCTS;

CREATE TABLE LT_PRODUCTS 
(
	product_id NUMBER,
	product_name VARCHAR2(255),
	description VARCHAR2(2000),
	standard_cost NUMBER(9, 2), -- means 9 digits 2 of which are after decimal
	list_price NUMBER(9, 2),
	category_id NUMBER,
	CONSTRAINT LT_PRODUCT_NAME UNIQUE (product_name) -- user generated constraint name
);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

-- 11. Tables with Duplicate Keys
DROP TABLE LT_PRODUCTS;

CREATE TABLE LT_PRODUCTS 
(
	product_id NUMBER,
	product_name VARCHAR2(255),
	description VARCHAR2(2000),
	standard_cost NUMBER(9, 2),
	list_price NUMBER(9, 2),
	category_id NUMBER
);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

SELECT * FROM LT_PRODUCTS;

-- 12. Add Primary Key Constraint (Alter)
DELETE FROM LT_PRODUCTS;

ALTER TABLE LT_PRODUCTS ADD CONSTRAINT LT_PK_PRODUCTS PRIMARY KEY (PRODUCT_ID);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

-- 13. Add Primary Key Constraint (Create) part 1
DROP TABLE LT_PRODUCTS;

CREATE TABLE LT_PRODUCTS 
(
	product_id NUMBER CONSTRAINT lt_pk_products PRIMARY KEY,
	product_name VARCHAR2(255),
	description VARCHAR2(2000),
	standard_cost NUMBER(9,2),
	list_price NUMBER(9,2),
	category_id NUMBER
);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

-- 14. Add Primary Key Constraint (Create) part 2
DROP TABLE LT_PRODUCTS;

CREATE TABLE LT_PRODUCTS
(
	product_id NUMBER,
	product_name VARCHAR2(255),
	description VARCHAR2(2000),
	standard_cost NUMBER(9,2),
	list_price NUMBER(9,2),
	category_id NUMBER,
	CONSTRAINT lt_pk_products PRIMARY KEY (product_id)
);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

INSERT INTO LT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME, DESCRIPTION, STANDARD_COST, LIST_PRICE, CATEGORY_ID)
VALUES (248, 'Intel Xeon E5-2697 V3', 'Speed:2.6GHz,Cores:14,TDP:145W',2326.27,2774.98,1);

-- 15. Foreign Keys
DROP TABLE LT_REGIONS;
DROP TABLE LT_COUNTRIES;

CREATE TABLE LT_REGIONS
(
	region_id NUMBER PRIMARY KEY,
	region_name VARCHAR2(50) NOT NULL
);

CREATE TABLE LT_COUNTRIES
(
	country_id CHAR(2) PRIMARY KEY,
	country_name VARCHAR2(40) NOT NULL,
	region_id NUMBER
);


-- Insert Statements 
INSERT INTO LT_REGIONS (Region_id, Region_name) VALUES (1, 'Europe');
INSERT INTO LT_REGIONS (Region_id, Region_name) VALUES (2, 'Americas');
INSERT INTO LT_REGIONS (Region_id, Region_name) VALUES (3, 'Asia');
INSERT INTO LT_REGIONS (Region_id, Region_name) VALUES (4, 'Middle East and Africa');

INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('AR', 'Argentina', 2);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('AU', 'Austrailia', 3);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('BE', 'Belgium', 1);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('BR', 'Brazil', 2);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('CA', 'Canada', 2);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('CH', 'Switzerland', 1);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('CN', 'China', 3);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('DE', 'Germany', 1);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('DK', 'Denmark', 1);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('EG', 'Egypt', 4);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('FR', 'France', 1);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('IL', 'Israel', 4);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('IN', 'India', 3);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('IT', 'Italy', 1);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('JP', 'Japan', 3);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('KW', 'Kuwait', 4);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('ML', 'Malaysia', 3);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('MX', 'Mexico', 2);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('NG', 'Nigeria', 4);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('NL', 'Netherlands', 1);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('SG', 'Singapore', 3);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('UK', 'United Kingdom', 1);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('US', 'United States', 2);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('ZM', 'Zambia', 4);
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('ZW', 'Zimbabwe', 4);


SELECT * FROM LT_COUNTRIES ORDER BY region_id;

-- 16. Foreign Keys (without behavior)
ALTER TABLE LT_COUNTRIES
ADD CONSTRAINT LT_FK_COUNTRIES_REGION
FOREIGN KEY (region_id)
REFERENCES LT_REGIONS (region_id);

DELETE FROM LT_REGIONS WHERE region_id = 2;

-- 17. Foreign Keys (On Delete Cascade)
ALTER TABLE LT_COUNTRIES 
DROP CONSTRAINT LT_FK_COUNTRIES_REGION;

ALTER TABLE LT_COUNTRIES 
ADD CONSTRAINT LT_FK_COUNTRIES_REGION
FOREIGN KEY (region_id)
REFERENCES LT_REGIONS (region_id)
ON DELETE CASCADE;

DELETE FROM LT_REGIONS WHERE region_id = 2;

-- 18. Foreign Keys (On Delete Set Null)
ALTER TABLE LT_COUNTRIES
DROP CONSTRAINT LT_FK_COUNTRIES_REGION;

ALTER TABLE LT_COUNTRIES 
ADD CONSTRAINT LT_FK_COUNTRIES_REGION
FOREIGN KEY (region_id)
REFERENCES LT_REGIONS (region_id)
ON DELETE SET NULL;

DELETE FROM LT_REGIONS WHERE region_id = 4;

-- 19. Exercise

-- Part A - 
-- Build the customer and contact tables
-- Establish a constraint relationship to remove children on delete
-- Load the data (file provided)
CREATE TABLE LT_CUSTOMERS 
(
	customer_id number PRIMARY KEY,
	name varchar2(255),
	address varchar2(255),
	website varchar2(255),
	credit_limit number
);

CREATE TABLE LT_CONTACTS
(
	contact_id number PRIMARY KEY,
	first_name varchar2(255),
	last_name varchar2(255),
	email varchar2(255),
	phone varchar2(255),
	customer_id number,
	FOREIGN KEY (customer_id) 
		REFERENCES LT_CUSTOMERS(customer_id) 
		ON DELETE CASCADE
);

-- B. Build the customer and contact tables
-- Establish a constraint relationship to update the children to null on delete
-- Load the data (file provided)
CREATE TABLE LT_CUSTOMERS 
(
	customer_id number PRIMARY KEY,
	name varchar2(255),
	address varchar2(255),
	website varchar2(255),
	credit_limit number
);

CREATE TABLE LT_CONTACTS
(
	contact_id number PRIMARY KEY,
	first_name varchar2(255),
	last_name varchar2(255),
	email varchar2(255),
	phone varchar2(255),
	customer_id number,
	FOREIGN KEY (customer_id) 
		REFERENCES LT_CUSTOMERS(customer_id) 
		ON DELETE SET NULL
);

-- C. Build the customer and contact tables
-- Establish a constraint relationship to avoid parent deletes when children exist
-- (Note: There is no `ON DELETE RESTRICT` bc that behavior is the default in Oracle.)
-- Load the data (file provided)
CREATE TABLE LT_CUSTOMERS 
(
	customer_id number PRIMARY KEY,
	name varchar2(255),
	address varchar2(255),
	website varchar2(255),
	credit_limit number
);

CREATE TABLE LT_CONTACTS
(
	contact_id number PRIMARY KEY,
	first_name varchar2(255),
	last_name varchar2(255),
	email varchar2(255),
	phone varchar2(255),
	customer_id number,
	FOREIGN KEY (customer_id) 
		REFERENCES LT_CUSTOMERS(customer_id) 
);

-- Also note that the reason you can't delete a parent who has a child is that if a child exists, 
-- there must be a parent.  




















