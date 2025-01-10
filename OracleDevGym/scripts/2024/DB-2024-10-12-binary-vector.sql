/*
Which statement prints 8 BINARY
*/

PROMPT
PROMPT Choice 1 -- Syntax Error
PROMPT
select vector_dimension_count(my_vector) as v_dim
      ,vector_dimension_format(my_vector) as v_format
 from (select to_vector('00101010',*,binary) as my_vector);


PROMPT
PROMPT Choice 2 -- Syntax Error
PROMPT
select vector_dimension_count(my_vector) as v_dim
      ,vector_dimension_format(my_vector) as v_format
 from (select to_vector('[00101010]',*,binary) as my_vector);


PROMPT
PROMPT Choice 3 -- Syntax Error
PROMPT
select vector_dimension_count(my_vector) as v_dim
      ,vector_dimension_format(my_vector) as v_format
 from (select to_vector('[0,0,1,0,1,0,1,0]',8,binary) as my_vector);


PROMPT
PROMPT Choice 4 -- Wrong Output (64, Binary)
PROMPT
select vector_dimension_count(my_vector) as v_dim
      ,vector_dimension_format(my_vector) as v_format
 from (select to_vector('[0,0,1,0,1,0,1,0]',*,binary) as my_vector);


PROMPT
PROMPT Choice 5 -- Wrong Output (64, Binary)
PROMPT
select vector_dimension_count(my_vector) as v_dim
      ,vector_dimension_format(my_vector) as v_format
 from (select to_vector(to_vector('[0,0,1,0,1,0,1,0]',*,binary)) as my_vector);


PROMPT
PROMPT Choice 6 -- Syntax Error
PROMPT
select vector_dimension_count(my_vector) as v_dim
      ,vector_dimension_format(my_vector) as v_format
 from (select to_vector('[-1.42,0,42,-13,42,-1.42,42,0]',*,binary) as my_vector);


PROMPT
PROMPT Choice 7 -- Syntax Error
PROMPT
select vector_dimension_count(my_vector) as v_dim
      ,vector_dimension_format(my_vector) as v_format
 from (select to_vector(to_vector('[-1.42,0,42,-13,42,-1.42,42,0]',*,binary)) as my_vector);


PROMPT
PROMPT Choice 8 -- CORRECT
PROMPT
select vector_dimension_count(my_vector) as v_dim
      ,vector_dimension_format(my_vector) as v_format
 from (select to_vector('[42]',8,binary) as my_vector);


PROMPT
PROMPT Choice 9 -- Syntax Error
PROMPT
select vector_dimension_count(my_vector) as v_dim
      ,vector_dimension_format(my_vector) as v_format
 from (select to_vector('[444]',8,binary) as my_vector);

PROMPT
PROMPT Choice 10 -- Syntax Error
PROMPT
select vector_dimension_count(my_vector) as v_dim
      ,vector_dimension_format(my_vector) as v_format
 from (select to_vector(to_vector('[1,2,3,4,5,6,null,null]'),*,binary) as my_vector);


PROMPT
PROMPT Choice 11 -- Syntax Error
PROMPT
select vector_dimension_count(my_vector) as v_dim
      ,vector_dimension_format(my_vector) as v_format
 from (select to_vector(to_vector('[1,2,3,4,5,6,null,null]' default 0 on conversion error),8,binary) as my_vector);


PROMPT
PROMPT Choice 12 -- CORRECT
PROMPT
select vector_dimension_count(my_vector) as v_dim
      ,vector_dimension_format(my_vector) as v_format
 from (select to_vector('[42.42]',8,binary) as my_vector);