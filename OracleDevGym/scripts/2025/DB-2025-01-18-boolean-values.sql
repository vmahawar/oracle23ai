drop table if EXISTS qz_truth;

create table qz_truth(
      is_it_true boolean
);

create or replace function qz_true_func return BOOLEAN
IS
BEGIN
      return true;
end qz_true_func;
/

create or replace function qz_false_func return BOOLEAN
IS
BEGIN
      return false;
end qz_false_func;
/


PROMPT
PROMPT choice 1
PROMPT

insert into qz_truth values(true);

select is_it_true from qz_truth;

ROLLBACK;


PROMPT
PROMPT choice 2
PROMPT

insert into qz_truth values('true');

select is_it_true from qz_truth;

ROLLBACK;

PROMPT
PROMPT choice 3
PROMPT

insert into qz_truth values('Y');

select is_it_true from qz_truth;

ROLLBACK;

PROMPT
PROMPT choice 4
PROMPT

insert into qz_truth values(42);

select is_it_true from qz_truth;

ROLLBACK;


PROMPT
PROMPT choice 5
PROMPT

insert into qz_truth values(42=42);

select is_it_true from qz_truth;

ROLLBACK;


PROMPT
PROMPT choice 6
PROMPT

insert into qz_truth values('' is null);

select is_it_true from qz_truth;

ROLLBACK;

PROMPT
PROMPT choice 7
PROMPT


insert into qz_truth values('fortytwo' like '%two');

select is_it_true from qz_truth;

ROLLBACK;


PROMPT
PROMPT choice 8
PROMPT


insert into qz_truth values(qz_true_func);

select is_it_true from qz_truth;

ROLLBACK;

PROMPT
PROMPT choice 9
PROMPT


insert into qz_truth values(QZ_FALSE_FUNC=false);

select is_it_true from qz_truth;

ROLLBACK;

PROMPT
PROMPT choice 10
PROMPT


insert into qz_truth values(QZ_true_func=42);

select is_it_true from qz_truth;

ROLLBACK;