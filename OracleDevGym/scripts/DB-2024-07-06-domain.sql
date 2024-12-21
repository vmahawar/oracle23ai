--
-- To be executed by DBA
-- grant create domain to vmahawar;
--

drop table if exists qz_calendar_dates purge;
drop domain  if exists qz_calendar_day;

create usecase domain qz_calendar_day
as date
constraint check (qz_calendar_day = trunc(qz_calendar_day))
display TO_CHAR(
    qz_calendar_day,'FMDay','NLS_DATE_LANGUAGE=English'
);

create table qz_calendar_dates
(calendar_day date domain qz_calendar_day
);

insert into qz_calendar_dates
values(date '2024-05-02');

commit;

--Option 1--
PROMPT Optoin 1
select domain_display(date '2024-05-02') day_name;

--Optoin 2--
PROMPT Optoin 2
select domain_display(cast(date '2024-05-02' as qz_calendar_day)) day_name;

--Optoin 3--
PROMPT Optoin 3
select domain_display(cast(to_date('2024-05-02 09:00','YYYY-MM-DD HH24:MI') as qz_calendar_day)) day_name;

--Optoin 4--
PROMPT Optoin 4
select domain_display(calendar_day) day_name from qz_calendar_dates;

--Optoin 5--
PROMPT Optoin 5
select domain_display(calendar_day + 0) day_name from qz_calendar_dates;

--Optoin 6--
PROMPT Optoin 6
select domain_display(max(calendar_day)) day_name from qz_calendar_dates;

--Option 7--
PROMPT Optoin 7
select domain_display(cast(calendar_day as qz_calendar_day)) day_name from qz_calendar_dates;