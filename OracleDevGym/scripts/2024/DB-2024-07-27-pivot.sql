with tab as
(select 10 col from dual
union all
select -5 col from dual
union all
select 8 col from dual
union all
select -20 col from dual
union all
select 0 col from dual)
select sum(positive),sum(negative)
from (select case when sign(col)=1 then col
else 0 end positive,case when sign(col)=-1 then col
else 0 end negative  from tab);

PROMPT Option 1 INCORRECT
with tab as
(select 10 col from dual
union all
select -5 col from dual
union all
select 8 col from dual
union all
select -20 col from dual
union all
select 0 col from dual)
select 
decode(sign(col),1,sum(col)) as positive,
decode(sign(col),-1,sum(col)) as negative
from tab;

PROMPT Option 2 **CORRECT**

with tab as
(select 10 col from dual
union all
select -5 col from dual
union all
select 8 col from dual
union all
select -20 col from dual
union all
select 0 col from dual)
select 
sum(decode(sign(col),1,col)) as positive,
sum(decode(sign(col),-1,col)) as negative
from tab;

PROMPT Option 3 **CORRECT**
with tab as
(select 10 col from dual
union all
select -5 col from dual
union all
select 8 col from dual
union all
select -20 col from dual
union all
select 0 col from dual)
select  * from 
(
    select col,sign(col) sg from TAB
)
pivot(
    sum(col) for sg in (1 as POSITIVE, -1 as NEGATIVE)
);


PROMPT Option 4 **CORRECT**
with tab as
(select 10 col from dual
union all
select -5 col from dual
union all
select 8 col from dual
union all
select -20 col from dual
union all
select 0 col from dual)
select 
decode(sign(col),1,sum(col)) as positive,
decode(sign(col),-1,sum(col)) as negative
from tab
group by sign(col);

PROMPT Option 5 **CORRECT**
with tab as
(select 10 col from dual
union all
select -5 col from dual
union all
select 8 col from dual
union all
select -20 col from dual
union all
select 0 col from dual)
select 
max(decode(sign(col),1,sum(col))) as positive,
max(decode(sign(col),-1,sum(col))) as negative
from tab
group by sign(col);

PROMPT Option 6 **CORRECT**
with tab as
(select 10 col from dual
union all
select -5 col from dual
union all
select 8 col from dual
union all
select -20 col from dual
union all
select 0 col from dual)
select 
sum((sign(col)+1)/2*col) as positive,
sum((sign(col)-1)/2*col) as negative
from tab;


PROMPT Option 7 **CORRECT**
with tab as
(select 10 col from dual
union all
select -5 col from dual
union all
select 8 col from dual
union all
select -20 col from dual
union all
select 0 col from dual)
select 
sum(case sign(col)
when 1 then col end ) as positive,
sum(case sign(col)
when -1 then col end ) as negative
from tab;
