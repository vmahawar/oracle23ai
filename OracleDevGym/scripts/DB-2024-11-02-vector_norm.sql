--Question
/*WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            , ##REPLACE## as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons
  /
  */

SET ECHO OFF;

PROMPT 
PROMPT CHOICE 1
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,vector_distance(origin, my_vector) as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;

PROMPT 
PROMPT CHOICE 2
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,vector_distance(origin, my_vector, manhattan) as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;

PROMPT 
PROMPT CHOICE 3
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,sqrt(origin <=> my_vector) as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;  

PROMPT 
PROMPT CHOICE 4
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,vector_distance(origin,my_vector,hamming) as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;  


PROMPT 
PROMPT CHOICE 5
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,vector_distance(origin, my_vector, euclidean) as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;


PROMPT 
PROMPT CHOICE 6
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,vector_distance(origin, my_vector, euclidean_squared) as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;

PROMPT 
PROMPT CHOICE 7
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,sqrt(vector_distance(origin, my_vector, euclidean_squared)) as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;

PROMPT 
PROMPT CHOICE 8
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,vector_distance(origin, my_vector, dot) as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;  

PROMPT 
PROMPT CHOICE 9
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,sqrt(l1_distance(origin,my_vector)) as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;  


PROMPT 
PROMPT CHOICE 10
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,sqrt(l2_distance(origin,my_vector)) as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;


PROMPT 
PROMPT CHOICE 11
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,inner_product(origin,my_vector) as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;

PROMPT 
PROMPT CHOICE 12
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,origin <-> my_vector as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;

PROMPT 
PROMPT CHOICE 13
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,origin <#> my_vector as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;  

PROMPT 
PROMPT CHOICE 14
PROMPT 
WITH base (raw_vector) as (
      values ('[0,0]'),('[3,4]'),('[5,12]'),('[6,8]'),('[9,12]'),('[15,20]')
), vector_base AS (
     select 
     to_vector(raw_vector,*,int8) as my_vector
     , to_vector ('[0,0]',*,int8) as origin
     from base
), comparisons as (
      select my_vector
            ,origin
            ,vector_norm(my_vector) as magnitude
            ,sqrt(vector_distance(origin, my_vector, l2_squared)) as distance
      from vector_base
)
select origin
      ,my_vector
      ,magnitude
      ,distance
      ,to_char(magnitude - distance = 0) as distance_is_norm
  from comparisons;  