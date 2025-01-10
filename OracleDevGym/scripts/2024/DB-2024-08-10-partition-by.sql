create table if not exists qz_departments AS
with departments (dept_id, dept_name) AS
(values (1,'sales'),(2,'support'),(3,'markting'),(4,'executive'),(5,'accounting')
)select * from departments
/

alter table qz_departments
add constraints qz_departments_pk primary key(dept_id)
/

create table if not exists qz_employees AS
with employees (id,name,dept_id,salary) AS
(values 
(1,'Jim',1,100),(2,'Jenn',1,110),(3,'Amy',1,120)
,(4,'Aliza',2,90),(5,'Lori',2,85),(6,'Tim',2,75)
,(7,'Steve',3,60),(8,'Rupert',3,70),(9,'Alexa',3,80)
,(10,'Jose',4,110),(11,'Jill',4,115),(12,'June',4,130)
,(13,'Jillian',5,180)
)
select * from employees
/

alter table qz_employees
add constraints qz_employees_fk
foreign key (dept_id) references qz_departments(dept_id)
/

--Opotion 1 ----CORRECT
with base AS
(select dept_id, dept_name, id,name,salary
from qz_departments d
natural join qz_employees
)
select base.dept_name
       ,base.name
       ,base.salary
  from base
 where base.dept_name in (select dept_name 
         from base
         group by dept_name
         order by max(salary) desc
         fetch first 3 rows only)
    and base.id in (select e.id 
         from base e
         where e.dept_id = base.dept_id
         order by base.salary desc
         fetch first 2 rows only)         
order by max(base.salary) over (partition by base.dept_name) desc, base.salary desc;

--Option 4
with base AS
(select dept_id, dept_name, id,name,salary
from qz_departments d
natural join qz_employees
)
select dept_name
      ,name
      ,salary
 from base
 order by salary desc, partition by dept_id
 fetch first
 3 partitions,
 2 rows only;

 --Option 5 --CORRECT
 with base AS
(select dept_id, dept_name, id,name,salary
from qz_departments d
natural join qz_employees
)
select dept_name
      ,name
      ,salary
 from base
 order by salary desc
 fetch first
 3 partitions by dept_id,
 2 rows only;


--Option 6
with base AS
(select dept_id, dept_name, id,name,salary
from qz_departments d
natural join qz_employees
)
select dept_name
      ,name
      ,salary
 from base
 partition by dept_id
 order by salary desc
 fetch first
  6 rows only;

--Option 7 --CORRECT
with base AS
(select dept_id, dept_name, id,name,salary
from qz_departments d
natural join qz_employees
)
select dept_name
      ,name
      ,salary
 from base
 order by max(salary) over (partition by dept_id) desc
         ,salary desc
fetch first
    3 partition by dept_id,
    2 partition by id,
    6 rows only;

--Option 8 --CORRECT
with base AS
(select dept_id, dept_name, id,name,salary
from qz_departments d
natural join qz_employees
)
select dept_name
      ,name
      ,salary
 from base
 order by max(salary) over (partition by dept_id) desc
         ,salary desc
fetch first
    3 partition by dept_id,
    2 rows only;    