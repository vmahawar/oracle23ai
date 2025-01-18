/***********************************************************************************
** Purpose: Script to demonstrate the top 10 features in Oracle 12c for developers
** Date: 1st Feb 2014, Saturday
** Author: Vijay Mahawar
** Website: http://www.mahawar.net/blog
** Version: 1.0
***********************************************************************************/

/***********************************************************************************
** Version of Oracle on which I tried out this demo script 
***********************************************************************************/
select * from v$version;

Oracle Database 12c Enterprise Edition Release 12.1.0.1.0 - 64bit Production 0
PL/SQL Release 12.1.0.1.0 - Production 0
CORE 12.1.0.1.0 Production 0
TNS for Linux: Version 12.1.0.1.0 - Production 0
NLSRTL Version 12.1.0.1.0 - Production 0

/***********************************************************************************
**2. Invisible columns demonstration
***********************************************************************************/
SELECT * FROM EMP;
ALTER TABLE EMP MODIFY SAL INVISIBLE;
SELECT * FROM EMP; --Column is not visible
SELECT EMPNO,ENAME,SAL FROM EMP; --By explicitly mentioned in the list, it can be selected
ALTER TABLE EMP MODIFY SAL VISIBLE; --Alter table to make it visible
SELECT * FROM EMP; --Column is not visible even with select * statement

/***********************************************************************************
**3. Duplicate Indexes demonstration
***********************************************************************************/
CREATE INDEX EMP_ENO_ENAME_IDX ON EMP(EMPNO,ENAME);

SELECT TABLE_NAME,INDEX_NAME,INDEX_TYPE,VISIBILITY FROM DBA_INDEXES
WHERE TABLE_NAME = 'EMP';

SELECT TABLE_NAME,INDEX_NAME,COLUMN_NAME FROM DBA_IND_COLUMNS
WHERE TABLE_NAME = 'EMP'
ORDER BY INDEX_NAME;

CREATE BITMAP INDEX EMP_ENO_ENAME_BM_IDX ON EMP(EMPNO,ENAME) INVISIBLE;

SELECT TABLE_NAME,INDEX_NAME,INDEX_TYPE,VISIBILITY FROM DBA_INDEXES
WHERE TABLE_NAME = 'EMP';

SELECT TABLE_NAME,INDEX_NAME,COLUMN_NAME FROM DBA_IND_COLUMNS
WHERE TABLE_NAME = 'EMP'
ORDER BY INDEX_NAME;

--Parameter used to control the usage of invisible indexes.OPTIMIZER_USE_INVISIBLE_INDEXES
SELECT * FROM V$PARAMETER
WHERE REGEXP_LIKE(NAME,'OPTIMIZER_USE_INVISIBLE_INDEXES','i');


/***********************************************************************************
**4. PL/SQL Unit in WITH clause in SQL demonstration
***********************************************************************************/
WITH 
FUNCTION GET_TEXT(P_NUM IN NUMBER)
RETURN VARCHAR2
IS
V_TEXT VARCHAR2(4000);
BEGIN
    IF P_NUM IS NOT NULL THEN
    SELECT TO_CHAR(TO_DATE('01-01-'|| P_NUM,'DD-MM-YYYY'),'YEAR') INTO V_TEXT FROM DUAL;
    END IF;
    RETURN V_TEXT;    
EXCEPTION 
    WHEN OTHERS THEN
        RETURN V_TEXT;    
END GET_TEXT;
SELECT EMPNO,ENAME,GET_TEXT(SAL) SALARY,GET_TEXT(COMM) COMMISSION FROM EMP
ORDER BY SAL,COMM;

/***********************************************************************************
**6. INTERVAL REFERENCE PARTITIONS in demonstration
***********************************************************************************/
CREATE TABLE par(pk INT CONSTRAINT par_pk PRIMARY KEY, i INT)
 PARTITION BY RANGE(i) INTERVAL (10)
 (PARTITION p1 VALUES LESS THAN (10));

CREATE TABLE chi(fk INT NOT NULL, i INT,
 CONSTRAINT chi_fk FOREIGN KEY(fk) REFERENCES par(pk))
 PARTITION BY REFERENCE(chi_fk);

INSERT INTO par VALUES(15, 15);
INSERT INTO par VALUES(25, 25);
INSERT INTO par VALUES(35, 35);

SELECT table_name, partition_position, high_value, interval
   FROM USER_TAB_PARTITIONS WHERE table_name IN ('PAR', 'CHI')
   ORDER BY 1, 2;

/***********************************************************************************
*7. Indentity columns (auto-sequence on a pk),as default demonstration
***********************************************************************************/
CREATE SEQUENCE plch_seq 
  START WITH 1 
  INCREMENT BY 1 
  NOCACHE 
  NOCYCLE
/

CREATE TABLE plch_nodes 
  ( 
     node_name       VARCHAR2(30) 
        DEFAULT 'PLCH_RAC'|| plch_seq.NEXTVAL, 
     node_pub_ip     VARCHAR2(15) UNIQUE, 
     CONSTRAINT plch_nodes_pk PRIMARY KEY(node_name) 
  )
/ 

BEGIN 
    INSERT INTO plch_nodes(node_pub_ip) VALUES('192.168.2.101'); 
    INSERT INTO plch_nodes(node_pub_ip) VALUES('192.168.2.102'); 
    COMMIT; 
END; 
/

SELECT * FROM PLCH_NODES;

/***********************************************************************************
*8. MAX_STRING_SIZE parameter as STANDARD which is default and EXTENDED for 32767 size
***********************************************************************************/

select * from v$parameter
   where regexp_like(name,'max_string_size','i');       

/***********************************************************************************
*9. Boolean in Dynamic PL/SQL demonstration
***********************************************************************************/

create or replace procedure are_you_happy(p_bool IN BOOLEAN)
IS
BEGIN
    if p_bool then
        dbms_output.put_line('Happy!');
    else
        dbms_output.put_line('Not yet!');
    end if;
END are_you_happy;
/

begin
execute immediate 'begin are_you_happy(:a); end;' using TRUE;
execute immediate 'begin are_you_happy(:a); end;' using FALSE;
END;

/***********************************************************************************
*10. Implicit result sets demonstration
***********************************************************************************/

DECLARE
    REF_CURSOR SYS_REFCURSOR;
BEGIN
    OPEN REF_CURSOR FOR 
    SELECT EMPNO,ENAME,DEPTNO FROM EMP;
    DBMS_SQL.RETURN_RESULT(REF_CURSOR);
END;
/