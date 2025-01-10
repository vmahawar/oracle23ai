alter session set nls_timestamp_format = 'DD-MON-YYYY HH24:MI';

col match_datetime format a20

drop table if exists qz_matches;

create table qz_matches(
  match_id integer primary key,
  location_id integer not null,
  match_datetime timestamp not null
);

insert into qz_matches
values (1, 1, timestamp '2024-12-01 15:00:00'),
 (2, 2, timestamp '2024-12-01 15:00:00'),
 (3, 3, timestamp '2024-12-01 15:00:00'),
 (4, 1, timestamp '2024-12-07 12:00:00'),
 (5, 2, timestamp '2024-12-07 15:00:00'),
 (6, 3, timestamp '2024-12-08 15:00:00'),
 (7, 1, timestamp '2024-12-15 15:00:00'),
 (8, 2, timestamp '2024-12-15 16:30:00');

commit;

PROMPT
PROMPT CHOICE 1
PROMPT
select * from qz_matches
order by location_id, match_datetime desc
fetch first 3 rows only;

PROMPT
PROMPT CHOICE 2
PROMPT
select * from qz_matches
order by match_datetime desc
fetch first 999 partition by location_id, 1 row only;

PROMPT
PROMPT CHOICE 3
PROMPT
select * from qz_matches
order by location_id, match_datetime desc
fetch first 1 location_id, 3 rows only;

PROMPT
PROMPT CHOICE 4
PROMPT
select * from qz_matches
order by location_id, match_datetime desc
fetch first 999 partition by location_id, 1 rows only;

PROMPT
PROMPT CHOICE 5
PROMPT
select * from qz_matches
order by location_id, match_datetime desc
fetch first 999 locatdion_id, 1 match_datetime, 1 row only;

PROMPT
PROMPT CHOICE 6
PROMPT
select match_id, location_id, match_datetime
from (select m.*,
             dense_rank() over (
              partition by location_id
              order by match_datetime desc
             ) rn
  from qz_matches m
)
where rn = 1
order by location_id, match_datetime desc;

PROMPT
PROMPT CHOICE 7
PROMPT
select match_id, location_id, match_datetime
  from (select m.*, 
               rank() over (
                partition by location_id
                order by match_datetime desc
               ) rn
   from qz_matches m
  )
  where rn = 1
  order by location_id;

PROMPT
PROMPT CHOICE 8
PROMPT
select * from (
  select m.*,
         row_number() over (
          partition by location_id 
          order by match_datetime desc
          ) rn
   from qz_matches m
  )
  where rn = 1
  order by location_id, match_datetime desc;