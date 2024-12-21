create table qz_jobs(
      job_id varchar2(10) primary key,
      raise_pct NUMBER
);

create table qz_employees(
      employee_id int primary key,
      job_id references qz_jobs,
      salary NUMBER
);

insert into qz_jobs
values ('DEV',10),('MGR',1);

insert into qz_employees
values (1, 'DEV', 50000),
(2,'MGR',100000);

COMMIT;

select * from qz_employees
order by employee_id;

PROMPT
PROMPT CHOICE 1
PROMPT

UPDATE qz_employees e
set salary = salary * (select 1 + raise_pct/100
from qz_jobs j
where e.job_id = j.job_id
);

select * from qz_employees
order by employee_id;

ROLLBACK;

PROMPT
PROMPT CHOICE 2
PROMPT

UPDATE (
SELECT salary, raise_pct
from qz_employees e
join qz_jobs j
on e.job_id = j.job_id
)
set salary = salary * (1 + raise_pct/100);

select * from qz_employees
order by employee_id;

ROLLBACK;

PROMPT
PROMPT CHOICE 3 -- ERROR
PROMPT
UPDATE qz_employees e
set salary = salary * (1 + raise_pct/100)
join qz_jobs j
on e.job_id = j.job_id;

select * from qz_employees
order by employee_id;

ROLLBACK;

PROMPT
PROMPT CHOICE 4  -- CORRECT - Latest in Oracle 23ai
PROMPT
UPdate qz_employees e
set salary = salary * (1 + raise_pct/100)
from qz_jobs j
where e.job_id = j.job_id;

select * from qz_employees
order by employee_id;

ROLLBACK;

PROMPT
PROMPT CHOICE 5
PROMPT
merge into qz_employees e
using qz_jobs j
on (e.job_id = j.job_id)
when matched then update
set salary = salary * (1 + raise_pct/100);

select * from qz_employees
order by employee_id;

ROLLBACK;