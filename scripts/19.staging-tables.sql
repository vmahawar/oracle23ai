--New type of table that are optimized for loading data i# datawarehouse
--Thye are either created on demand or existing tables are used 
--exixsting has to be altered and reverted after work is done
--dropped or truncated after insert in production tables.
--bypasses recycle

--PURGE not required for staging tables while dropping
DROP TABLE IF EXISTS employee_staging;
--Create a new staging table.
CREATE TABLE IF NOT EXISTS employee_staging
(
    col1 number,
    col2 VARCHAR2(100)
)
FOR STAGING;

--PURGE not required for staging tables while dropping
DROP TABLE IF EXISTS department_staging;
--Create Normal table and later alter to staging 
CREATE TABLE IF NOT EXISTS department_staging
(
    col1 number,
    col2 VARCHAR2(100)
);

SELECT TABLE_NAME,STAGING FROM USER_TABLES
WHERE TABLE_NAME in ('EMPLOYEE_STAGING','DEPARTMENT_STAGING');

--Existing table
ALTER TABLE department_staging for staging;

SELECT TABLE_NAME,STAGING FROM USER_TABLES
WHERE TABLE_NAME in ('EMPLOYEE_STAGING','DEPARTMENT_STAGING');

DROP TABLE IF EXISTS employee_staging;

DROP TABLE IF EXISTS department_staging;

select ORIGINAL_NAME from RECYCLEBIN
WHERE TYPE = 'TABLE';