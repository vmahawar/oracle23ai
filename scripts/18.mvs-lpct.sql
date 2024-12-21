--MVJ --Materialized View Joins
--Replaces a single large dimension table 
--with smaller semi-joins to improve performance

--Eg.
CREATE MATERIALIZED VIEW JOIN_EMP_DEPT_MV
PARALLEL
BUILD IMMEDIATE
REFRESH COMPLETE
ENABLE QUERY REWRITE
AS SELECT e.ename
         ,e.sal
         ,d.deptno
         ,d.dname 
     FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT ename 
 from (select DISTINCT mv.ename 
         from JOIN_EMP_DEPT_MV mv
        WHERE mv.sal > 1000);

--ANSI JOIN Materialized Views
--JOIN keyword 
-- and 
-- ON keyword are used now

DROP MATERIALIZED VIEW IF EXISTS JOIN_EMP_DEPT_MV;
CREATE MATERIALIZED VIEW JOIN_EMP_DEPT_MV
PARALLEL
BUILD IMMEDIATE
REFRESH COMPLETE
ENABLE QUERY REWRITE
AS SELECT e.ename
         ,e.sal
         ,d.deptno
         ,d.dname 
     FROM EMP E 
     JOIN DEPT D 
       ON E.DEPTNO = D.DEPTNO;


--MVs Refresh Enhancement Technique

--Concurrent Refresh
--Multiple sessions can refresh same on-commit MV
--When MV Refresh is serialized only one session can refresh

DROP MATERIALIZED VIEW IF EXISTS JOIN_EMP_DEPT_MV;
CREATE MATERIALIZED VIEW JOIN_EMP_DEPT_MV
PARALLEL
BUILD IMMEDIATE
REFRESH FAST ON COMMIT
DISABLE QUERY REWRITE
ENABLE CONCURRENT REFRESH
AS SELECT e.ename
         ,e.sal
         ,d.deptno
         ,d.dname 
     FROM EMP E 
     JOIN DEPT D 
       ON E.DEPTNO = D.DEPTNO;    

--Using Alter COMMAND to ENABLE CONCURRENT REFRESH the MV
ALTER MATERIALIZED VIEW JOIN_EMP_DEPT_MV ENABLE CONCURRENT REFRESH;       

SELECT MVIEW_NAME, CONCURRENT_REFRESH_ENABLED FROM USER_MVIEWS
WHERE MVIEW_NAME = 'JOIN_EMP_DEPT_MV';

DBMS_MVIEW.REFRESH('JOIN_EMP_DEPT_MV','F','',TRUE,FALSE,0,0,0,FALSE,FALSE);


--APIs in DBMS_MVIEW package for refresh options


--MVA --Materialized View AGGREGATE
--Logical Partition Change Tracking
--Tracks the staleness of MVs
--Tracks the staleness of Table Partitions 