SET ECHO ON;

--Salary of all employees in research RESEARCH before increment
SELECT ENAME,SAL FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO 
                   FROM DEPT 
                  WHERE DNAME='RESEARCH');

--Lets update salary of all employees in RESEARCH deparment by 10%
UPDATE EMP
   SET SAL = SAL * 1.1
WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE DNAME='RESEARCH');

--Salary of all employees in research RESEARCH after increment
SELECT ENAME,SAL FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO 
                   FROM DEPT 
                  WHERE DNAME='RESEARCH');

ROLLBACK;                  

--Lets update salary of all employees in RESEARCH deparment by 10%
UPDATE EMP
   SET SAL = SAL * 1.1
FROM DEPT 
WHERE EMP.DEPTNO = DEPT.DEPTNO 
  AND DEPT.DNAME = 'RESEARCH';

--Salary of all employees in research RESEARCH after increment
SELECT ENAME,SAL FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO 
                   FROM DEPT 
                  WHERE DNAME='RESEARCH');  