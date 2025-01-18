drop table emp
/

CREATE TABLE emp (
empno  NUMBER(4) NOT NULL,
ename  VARCHAR2(10),
job    VARCHAR2(9),
mgr    NUMBER(4),
sal    NUMBER(7,2),
deptno NUMBER(2))
/

BEGIN
INSERT INTO emp VALUES (7369, 'SMITH', 'CLERK', 7902, 800, 20);
INSERT INTO EMP VALUES (7499, 'ALLEN', 'SALESMAN', 7698, 1600, 30);
INSERT INTO EMP VALUES (7521, 'WARD', 'SALESMAN', 7698, 1250, 30);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839, 2975, 20);
INSERT INTO EMP VALUES (7654, 'MARTIN', 'SALESMAN', 7698, 1250, 30);
INSERT INTO EMP VALUES (7698, 'BLAKE', 'MANAGER', 7839, 2850, 30);
INSERT INTO EMP VALUES (7782, 'CLARK', 'MANAGER', 7839, 2450, 10);
INSERT INTO EMP VALUES (7788, 'SCOTT', 'ANALYST', 7566, 3000, 20);
INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL, 5000, 10);
INSERT INTO EMP VALUES (7844, 'TURNER', 'SALESMAN', 7698, 1500, 30);
INSERT INTO EMP VALUES (7876, 'ADAMS', 'CLERK', 7788, 1100, 20);
INSERT INTO EMP VALUES (7900, 'JAMES', 'CLERK', 7698, 950, 30);
INSERT INTO EMP VALUES (7902, 'FORD', 'ANALYST', 7566, 3000, 60);
INSERT INTO EMP VALUES (7934, 'MILLER', 'CLERK', 7782, 1300, 10);
COMMIT;
END;
/

drop table dept
/

CREATE TABLE dept (
deptno NUMBER(2),
dname  VARCHAR2(15),
loc    VARCHAR2(15))
/

BEGIN
INSERT INTO dept VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES (40, 'OPERATIONS', 'BOSTON');
COMMIT;
END;
/

--Analytical Function
select deptno, empno, ename, Count(empno) OVER (PARTITION BY deptno ORDER BY ename) as cnt_eno from emp;

select deptno, empno, ename, Count(empno) OVER (PARTITION BY deptno) as cnt_eno from emp;


--Normal Aggregate Function
select deptno, empno, ename,sum(sal) over  (PARTITION BY deptno) as sum_sal from emp;

--Lead
 select deptno,empno,ename,sal,lead(sal,1,0) over (partition by deptno order by ename)  lead_sal from emp;


--Lag
select deptno,empno,ename,sal,lag(sal,1,0) over (partition by deptno order by ename)  lag_sal from emp;



--FIRST VALUE

select deptno, empno,ename,sal, first_value(sal) over (partition by deptno order by ename) as first_val from emp;

--LAST VALUE

select deptno, empno,ename,sal, last_value(sal) over (partition by deptno order by ename) as last_val from emp;

--RANK

select deptno, empno,ename,sal,rank() over (partition by deptno order by sal) as rnk from emp;


--DENSE_RANK
select deptno, empno,ename,sal,dense_rank() over (partition by deptno order by sal) as dense_rnk from emp;

--FIRST
select deptno, empno,ename,sal,avg(sal) keep (dense_rank first order by sal) over (partition by deptno) as first_dense_rnk from emp;

---LAST-----

select deptno, empno,ename,sal,
avg(sal) keep (dense_rank last order by sal) over (partition by deptno) as last_dense_rnk 
from emp 
order by deptno,sal;

-- The query below has no apparent real life description (except 
-- column FROM_PU_C) but is remarkable in illustrating the various windowing
-- clause by a COUNT(*) function.
 
SELECT empno, deptno, TO_CHAR(hiredate, 'YYYY') YEAR,
COUNT(*) OVER (PARTITION BY TO_CHAR(hiredate, 'YYYY')
ORDER BY hiredate ROWS BETWEEN 3 PRECEDING AND 1 FOLLOWING) FROM_P3_TO_F1,
COUNT(*) OVER (PARTITION BY TO_CHAR(hiredate, 'YYYY')
ORDER BY hiredate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) FROM_PU_TO_C,
COUNT(*) OVER (PARTITION BY TO_CHAR(hiredate, 'YYYY')
ORDER BY hiredate ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING) FROM_P2_TO_P1,
COUNT(*) OVER (PARTITION BY TO_CHAR(hiredate, 'YYYY')
ORDER BY hiredate ROWS BETWEEN 1 FOLLOWING AND 3 FOLLOWING) FROM_F1_TO_F3
FROM emp
ORDER BY hiredate;

--LISTAGG---
SELECT deptno, LISTAGG(ename, ',') WITHIN GROUP (ORDER BY ename) AS employees FROM emp GROUP BY deptno;

--NTH_VALUE--
select deptno , ename ,sal,
FIRST_value(sal) over (partition by deptno order by sal desc) - nth_value(sal,2) from first over (partition by deptno order by sal desc) top2_difference from emp;