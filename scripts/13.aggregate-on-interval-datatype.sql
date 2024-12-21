  select numtodsinterval (level,'day') dsi,
         numtoyminterval (level,'month') ymi,
         systimestamp + level ts
    from dual
  connect by level <=10;

--Aggration over INTERVAL Data Types: Example
WITH rws as (
  select numtodsinterval (level,'day') dsi,
         numtoyminterval (level,'month') ymi,
         systimestamp + level ts
    from dual
  connect by level <=10
)
select sum(dsi) 
      ,avg(dsi)
      ,sum(ymi)
      ,avg(ymi)
      ,sum(ts-systimestamp)
      ,avg(ts-systimestamp)
from rws;