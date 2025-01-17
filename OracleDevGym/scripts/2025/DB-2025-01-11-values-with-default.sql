alter session set nls_date_format = 'DD-MON-YYYY';

drop table if exists qz_students;

create table qz_students
(
      student_id int primary key,
      student_name varchar2(20),
      registration_date date default date'2025-01-01'
);

PROMPT

PROMPT CHOICE 1

PROMPT

delete from qz_students;

insert into qz_students values (1,'Sally Squirrel', date'2024-09-01');
insert into qz_students values (2,'Quentin Quetzal', date'2024-09-01');
insert into qz_students values (3,'Lyra Lunx');

select * from qz_students order by student_id;

rollback;

PROMPT

PROMPT CHOICE 2

PROMPT

delete from qz_students;

insert into qz_students(student_id,student_name,registration_date) values (1,'Sally Squirrel', date'2024-09-01');
insert into qz_students(student_id,student_name,registration_date) values (2,'Quentin Quetzal', date'2024-09-01');
insert into qz_students(student_id,student_name) values (3,'Lyra Lunx');

select * from qz_students order by student_id;

rollback;

PROMPT

PROMPT CHOICE 3

PROMPT

delete from qz_students;

insert into qz_students values (1,'Sally Squirrel', date'2024-09-01'),
                               (2,'Quentin Quetzal', date'2024-09-01'),
                               (3,'Lyra Lunx');

select * from qz_students order by student_id;

rollback;


PROMPT

PROMPT CHOICE 4

PROMPT

delete from qz_students;

insert into qz_students values (1,'Sally Squirrel', date'2024-09-01'),
                               (2,'Quentin Quetzal', date'2024-09-01'),
                               (3,'Lyra Lunx',null);

select * from qz_students order by student_id;

rollback;

PROMPT

PROMPT CHOICE 5

PROMPT

delete from qz_students;

insert into qz_students values (1,'Sally Squirrel', date'2024-09-01'),
                               (2,'Quentin Quetzal', date'2024-09-01'),
                               (3,'Lyra Lunx',default);

select * from qz_students order by student_id;

rollback;