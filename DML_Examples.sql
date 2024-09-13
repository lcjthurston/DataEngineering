---------------------------------------------------------------
-- Intro Notes
---------------------------------------------------------------

/*
 * 
 * DML stands for Data Manipulation Language.  The goal is to 
 * 
 * manipulate relational data
 * 
 * 
 */

---------------------------------------------------------------
-- Example Code
---------------------------------------------------------------

-- 1. Insert Example 

-- 1.1 Create Tables
CREATE TABLE LT_REGIONS 
(
	region_id NUMBER,
	region_name VARCHAR2( 50 ) NOT NULL,
	CONSTRAINT lt_pk_regions
		PRIMARY KEY (region_id)
);

CREATE TABLE LT_COUNTRIES
(
	country_id CHAR(2),
	country_name VARCHAR2(40) NOT NULL,
	region_id NUMBER,
	CONSTRAINT lt_pk_countries
		PRIMARY KEY (country_id),
	CONSTRAINT lt_fk_countries_regions
		FOREIGN KEY (region_id)
		REFERENCES lt_regions(region_id)
		ON DELETE CASCADE
);

-- 1.2 Insert Syntax

INSERT INTO LT_REGIONS (region_id, region_name) VALUES (1, 'Europe');

DELETE FROM LT_REGIONS;

INSERT INTO LT_REGIONS VALUES (1, 'Europe');

-- 1.3 Insert Statements
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

-- 2. Insert Exercises

-- Add ‘Austria’ to the Country table.
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('AT', 'Austria', 1);

-- Add ‘Sweden’ to the Country table.
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('SE', 'Sweden', 1);

-- Add ‘Philippines’ to the Country table.
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('PH', 'Philippines', 2);

-- Add ‘Antartica’ to the Region table.
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('AQ', 'Antartica', 4);

-- Add ‘New Finland’ to the Country table and relate it to Antartica.
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('NF', 'New Finland', 4);

-- Add ‘Asgard’ to the Country table and relate it to Antartica.
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('AG', 'Asgard', 4);

-- Add ‘Ecuador’ to the Country table.
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('EC', 'Ecuador', 2);

-- Add ‘Venezuela’ to the Country table.
INSERT INTO LT_COUNTRIES (country_id, country_name, region_id) VALUES ('VZ', 'Venezuela', 2);


-- 3. Key Generation

/* 
 * 
 * Note: In addition to using a column of values that are already pre-defined as primary keys, we can also
 * generate primary key values for a column in question.  This is useful if you are having to add many 
 * records to a table and do not have time to make a new key value for every row. 
 * 
 * There are two main methods for Primary Key generation in Oracle: Identity Columns and Sequences.
 * 
 *   A. Identity Columns - Can be generated ALWAYS or BY DEFAULT
 * 		Generated by default allows the user to provide manually updated values.  
 *      Generated always does not allow user override of values in the PK column.  
 * 
 *   B. Sequences 
 * 
 * 
 * */




