--grant create domain to devgym;

drop table if EXISTS qz_turtles;

drop domain if exists qz_conservation_e FORCE;

create domain if not exists qz_conservation_e as enum (
    "Extinct" = ex = 0,
    "Extinct in the Wild" = ew,
    "Critically Endangered" = cr,
    "Endangered" = en,
    "Vulnerable" = vu,
    "Near Threatened" = nt,
    "Conservation Dependent" = cd,
    "Least Concern" = lc,
    "Data Deficient" = dd,
    "Not Evaluated" = ne
);

drop table if EXISTS qz_turtles;

create table qz_turtles (
    id integer generated as identity
    , common_name varchar2(100 char)
    , status domain qz_conservation_e
);

insert into qz_turtles(common_name, status)
values
('Loggerhead sea turtle', qz_conservation_e.vu)
,('Leatherback sea turtle', qz_conservation_e.vu)
,('Hawksbill sea turtle',qz_conservation_e.cr)
,('Green sea turtle', qz_conservation_e.en)
,('Flatback sea turtle', qz_conservation_e.dd)
,('Olive ridley sea turtle', qz_conservation_e.vu)
,('Kemp''s ridley sea turtle',qz_conservation_e.ew)
/

commit;

PROMPT
PROMPT CHOICE 1
PROMPT
select t.common_name
      ,t.status as conservation_status
  from qz_turtles t
order by t.status, t.common_name;

PROMPT
PROMPT CHOICE 2 --CORRECT
PROMPT
select t.common_name
      ,case t.status
        WHEN 0 then 'Extinct'
        WHEN 1 then 'Extinct in the Wild'
        WHEN 2 then 'Critically Endangered'
        WHEN 3 then 'Endangered'
        WHEN 4 then 'Vulnerable'
        WHEN 5 then 'Near Threatened'
        WHEN 6 then 'Conservation Dependent'
        WHEN 7 then 'Least Concern'
        WHEN 8 then 'Data Deficient'
        WHEN 9 then 'Not Evaluated'
    end as conservation_status
from QZ_TURTLES t
order by t.status, t.common_name;

PROMPT
PROMPT CHOICE 3
PROMPT
select t.common_name
      ,(
        select e.enum_value
        from qz_conservation_e e
        where e.enum_name = t.status
      ) as conservation_status
from QZ_TURTLES t
order by t.status, t.common_name;

PROMPT
PROMPT CHOICE 4
PROMPT
select t.common_name
      ,(
        select e.enum_name
        from qz_conservation_e e
        where e.enum_value = t.status
      ) as conservation_status
from QZ_TURTLES t
order by t.status, t.common_name;

PROMPT
PROMPT CHOICE 5 --CORRECT
PROMPT
select t.common_name
      ,(
        select max(e.enum_name)
        from qz_conservation_e e
        where e.enum_value = t.status
      ) as conservation_status
from QZ_TURTLES t
order by t.status, t.common_name;

PROMPT
PROMPT CHOICE 6
PROMPT
select t.common_name
      ,domain_display(qz_conservation_e) as conservation_status
from QZ_TURTLES t
order by t.status, t.common_name;

PROMPT
PROMPT CHOICE 7 --CORRECT
PROMPT
select t.common_name
      ,domain_display(t.status) as conservation_status
from QZ_TURTLES t
order by t.status, t.common_name;

PROMPT
PROMPT CHOICE 8
PROMPT
select t.common_name
      ,(select distinct domain_display(enum_value)
      from qz_conservation_e
      where enum_value = t.STATUS
      ) as conservation_status
from QZ_TURTLES t
order by t.status, t.common_name;

PROMPT
PROMPT CHOICE 9 --CORRECT
PROMPT
select t.common_name
      ,(select distinct domain_display(cast(enum_value as qz_conservation_e))
      from qz_conservation_e
      where enum_value = t.STATUS
      ) as conservation_status
from QZ_TURTLES t
order by t.status, t.common_name;

PROMPT
PROMPT CHOICE 10
PROMPT
select t.common_name
      ,e.enum_name as conservation_status
from QZ_TURTLES t
join qz_conservation_e e on t.status = e.enum_value
order by t.status, t.common_name;

PROMPT
PROMPT CHOICE 11 --CORRECT
PROMPT
select t.common_name
      ,e.enum_name as conservation_status
from QZ_TURTLES t
join qz_conservation_e e on domain_display(t.status) = e.enum_name
order by t.status, t.common_name;