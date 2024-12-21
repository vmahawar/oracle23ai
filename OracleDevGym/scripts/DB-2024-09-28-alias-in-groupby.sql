alter session set nls_date_format = 'DD-MON-YYYY';

create table qz_quiz_results(
	quiz_id integer,
	answer_datetime date,
	pct_correct number
);

insert into qz_quiz_results
select 1, date '2024-10-01' - 40/sqrt(level/10),
       dbms_random.value * 100
connect by level <= 200;

commit;

PROMPT
PROMPT Choice 1 --INCORRECT
PROMPT
select round(answer_datetime,'mm') mth,COUNT(*)
from qz_quiz_results
group by mth
order by mth;

PROMPT
PROMPT Choice 2 --CORRECT
PROMPT
select trunc(answer_datetime,'mm') mth,COUNT(*)
from qz_quiz_results
group by mth
order by mth;

PROMPT
PROMPT Choice 3 --CORRECT
PROMPT
select floor(answer_datetime,'mm') mth,COUNT(*)
from qz_quiz_results
group by mth
order by mth;

PROMPT
PROMPT Choice 4 --INCORRECT
PROMPT
select ceil(answer_datetime,'mm') mth,COUNT(*)
from qz_quiz_results
group by mth
order by mth;

PROMPT
PROMPT Choice 5 --INCORRECT
PROMPT
select min(answer_datetime,'mm') mth,COUNT(*)
from qz_quiz_results
group by mth
order by mth;