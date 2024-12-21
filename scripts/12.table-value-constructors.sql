select * from emp;

--Prior to 23ai

SELECT 7698 as empno, 7839 as mgr from dual
UNION ALL
SELECT 7782 as empno, 7839 as mgr from dual
UNION ALL
SELECT 7521 as empno, 7654 as mgr from dual;

--in 23ai VALUES constructor
SELECT * FROM (VALUES (7698,7839),(7782,7839),(7521,7654)) my_colleagues (empno,mgr);

--USING VALUE constructor in JOIN
SELECT EMP.EMPNO,EMP.MGR 
  FROM (VALUES (7698,7839),(7782,7839),(7521,7654)) my_colleagues (empno,mgr)
  JOIN EMP ON EMP.EMPNO = my_colleagues.empno
           and emp.mgr = my_colleagues.mgr;

