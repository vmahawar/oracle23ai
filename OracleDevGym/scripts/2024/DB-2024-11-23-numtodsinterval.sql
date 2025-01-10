PROMPT
PROMPT CHOICE 1
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;
base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  /** REPLACE START **/
  , numtodsinterval(
    trunc(
      extract(minute from precise_interval) * 60
      + extract(second from precise_interval)
      , 2)
      ,'second'
    )
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;



PROMPT
PROMPT CHOICE 2
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;
base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  , /** REPLACE START **/
   numtodsinterval(
    extract(minute from precise_interval)
    ,'minute')
  + numtodsinterval(
    trunc(
      extract(second from precise_interval)
      ,2)
      ,'second')
    /** REPLACE ENDS **/
    as truncated_interval
    from base
  )
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;

PROMPT
PROMPT CHOICE 3
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;
base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  ,/** REPLACE START **/
   precise_interval 
   - numtodsinterval(
    extract(second from precise_interval)
    ,'second')
    + numtodsinterval(
      trunc(
        extract(second from precise_interval)
        ,2)
        ,'second')
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;

PROMPT
PROMPT CHOICE 4
PROMPT 
PROMPT
PROMPT CHOICE 1
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;

base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  /** REPLACE START **/
  , numtodsinterval(
    trunc(
      extract(minute from precise_interval) * 60
      + extract(second from precise_interval)
      , 2)
      ,'second'
    )
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;

PROMPT
PROMPT CHOICE 2
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;

base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  /** REPLACE START **/
  , numtodsinterval(
    trunc(
      extract(minute from precise_interval) * 60
      + extract(second from precise_interval)
      , 2)
      ,'second'
    )
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;

PROMPT
PROMPT CHOICE 3
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;

base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  , /** REPLACE START **/
  numtodsinterval(
    trunc(
      extract(minute from precise_interval) * 60
      + extract(second from precise_interval)
      , 2)
      ,'second'
    )
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;

PROMPT
PROMPT CHOICE 4
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;
base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as (
  select precise_interval
  , /** REPLACE START **/
  cast(precise_interval as interval day to second(2))
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;

PROMPT
PROMPT CHOICE 5
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;
base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  , /** REPLACE START **/
  CAST(localtimestamp + precise_interval as timestamp(2))
  - CAST(localtimestamp as timestamp(2))
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;

PROMPT
PROMPT CHOICE 6
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;
base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  , /** REPLACE START **/
  (localtimestamp + precise_interval - localtimestamp) day to second(2)
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;

PROMPT
PROMPT CHOICE 7
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;
base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  , /** REPLACE START **/
  trunc(precise_interval,'MI')
  + numtodsinterval(trunc(extract(second from precise_interval)
  ,2)
  ,'second')
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;

PROMPT
PROMPT CHOICE 8
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;
base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  , /** REPLACE START **/
  trunc(precise_interval,'MI:SS.FF2')
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;

PROMPT
PROMPT CHOICE 9
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;
base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  , /** REPLACE START **/
  trunc(precise_interval * 6000, 'MI')/6000
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;

PROMPT
PROMPT CHOICE 10
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;
base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  , /** REPLACE START **/
  to_interval(
    to_char(precise_interval,'DD HH:MI:SS.FF2')
    ,'DD HH:MI:SS.FF2'
  )
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;

PROMPT
PROMPT CHOICE 11
PROMPT 
with function display_min_sec(
  p_interval in interval day to second)
  return varchar2 sql_macro(scalar)
is
begin
  return q'[extract(minute from p_interval) || ' min '
  || extract(second from p_interval) || ' sec']';
end display_min_sec;
base(precise_interval) as (
  VALUES
  (numtodsinterval(73.575757575,'second')),
  (numtodsinterval(42.848484848,'second')),
  (numtodsinterval(194.595959595,'second'))
), adjusted as(
  select precise_interval
  , /** REPLACE START **/
    to_timestamp(
      to_char(localtimestamp + precise_interval,'YYYY-MM-DD HH24:MI:SS.FF2')
    ,'YYYY-MM-DD HH24:MI:SS.FF2')
    - to_timestamp(
      to_char(localtimestamp, 'YYYY-MM-DD HH24:MI:SS.FF2')
    ,'YYYY-MM-DD HH24:MI:SS.FF2')
    /** REPLACE ENDS **/
    as truncated_interval
    from base
)
select display_min_sec(precise_interval) as precise_interval
      ,display_min_sec(truncated_interval) as truncated_interval
from adjusted;