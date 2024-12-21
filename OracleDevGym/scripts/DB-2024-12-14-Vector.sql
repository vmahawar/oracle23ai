PROMPT
PROMPT Choice 1
PROMPT

select to_vector('[16,[2,4,7],[-22,44,77]]',16,int8) as my_vector;

PROMPT
PROMPT Choice 2
PROMPT

select to_vector('[16,[7,2,4],[-22,44,77]]',*,int8,sparse) as my_vector;

PROMPT
PROMPT Choice 3
PROMPT

select to_vector('[[2,4,7],[-22,44,77]]',*,int8,sparse) as my_vector;

PROMPT
PROMPT Choice 4 --[16,[2,4,7],[-22,44,77]]
PROMPT

select to_vector('[16,[2,4,7],[-22,44,77]]',*,int8,sparse) as my_vector;

PROMPT
PROMPT Choice 5 --[16,[2,4,7],[-22,44,77]]
PROMPT

select to_vector('[[2,4,7],[-22,44,77]]',16,int8,sparse) as my_vector;

PROMPT
PROMPT Choice 6
PROMPT

select to_vector('[0,-22,0,44,0,0,77,0,0,0,0,0,0,0,0,0]',*,int8,sparse) as my_vector;

PROMPT
PROMPT Choice 7 --[16,[2,4,7],[-22,44,77]]
PROMPT

select to_vector(to_vector('[0,-22,0,44,0,0,77,0,0,0,0,0,0,0,0,0]'),*,int8,sparse) as my_vector;

PROMPT
PROMPT Choice 8
PROMPT

select to_vector(to_vector('[16,[2,4,7],[-22,44,77]]',16,int8,sparse)) as my_vector;

PROMPT
PROMPT Choice 9
PROMPT

select from_vector('[16,[2,4,7],[-22,44,77]]' format sparse) as my_vector;

PROMPT
PROMPT Choice 10 --[16,[2,4,7][-2.2E+001,4.4E+001,7.7E+001]]
PROMPT

select from_vector('[0,-22,0,44,0,0,77,0,0,0,0,0,0,0,0,0]' format sparse) as my_vector;

PROMPT
PROMPT Choice 11 --[16,[2,4,7],[-22,44,77]]
PROMPT

select from_vector(to_vector('[16,[2,4,7],[-22,44,77]]',16,int8,sparse) returning clob) as my_vector;

PROMPT
PROMPT Choice 12 --[16,[2,4,7],[-22,44,77]]
PROMPT

select to_vector(from_vector('[0,-22,0,44,0,0,77,0,0,0,0,0,0,0,0,0]' returning clob format sparse),16,int8,sparse) as my_vector;
