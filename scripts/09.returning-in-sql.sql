--Run this in SQL* Plus or SQLcl

VARIABLE l_empno number;
VARIABLE l_old_sal number;

EXECUTE :l_empno := 7566;

update emp 
   set sal = sal * 1.1
where empno = :l_empno
returning old sal into :l_old_sal;

PRINT

select empno,sal
  from emp
  where empno = :l_empno;

ROLLBACK;