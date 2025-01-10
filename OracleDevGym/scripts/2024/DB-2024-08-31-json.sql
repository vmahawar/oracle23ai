column nmax format 099

with base as (
select json('
{"myArray": [
	{ "n": 5, "s":"5"},
	{ "n": 33, "s":"33"},
	{ "n": 9, "s":"9"},
	{ "n": 11, "s":"11"},
	{ "n": 42, "s":"42"},
	{ "n": 22, "s":"22"},
	{ "n": 7, "s":"7"}
	]
}') as jdoc
)

PROMPT 
PROMPT Option 1
PROMPT
with base as (
select json('
{"myArray": [
	{ "n": 5, "s":"5"},
	{ "n": 33, "s":"33"},
	{ "n": 9, "s":"9"},
	{ "n": 11, "s":"11"},
	{ "n": 42, "s":"42"},
	{ "n": 22, "s":"22"},
	{ "n": 7, "s":"7"}
	]
}') as jdoc
)
select json_value(b.jdoc,'$.myArray[*].s.maxString()') as nMax
from base b
/

PROMPT 
PROMPT Option 2
PROMPT
with base as (
select json('
{"myArray": [
	{ "n": 5, "s":"5"},
	{ "n": 33, "s":"33"},
	{ "n": 9, "s":"9"},
	{ "n": 11, "s":"11"},
	{ "n": 42, "s":"42"},
	{ "n": 22, "s":"22"},
	{ "n": 7, "s":"7"}
	]
}') as jdoc
)
select json_value(b.jdoc,'$.myArray[*].s.maxNumber()') as nMax
from base b
/

PROMPT 
PROMPT Option 3
PROMPT
with base as (
select json('
{"myArray": [
	{ "n": 5, "s":"5"},
	{ "n": 33, "s":"33"},
	{ "n": 9, "s":"9"},
	{ "n": 11, "s":"11"},
	{ "n": 42, "s":"42"},
	{ "n": 22, "s":"22"},
	{ "n": 7, "s":"7"}
	]
}') as jdoc
)
select max(j.n) as nMax
from base b, json_table(b.jdoc, '$.myArray[*]' columns (n path '$.s.number()')
)j
/

PROMPT 
PROMPT Option 4
PROMPT
with base as (
select json('
{"myArray": [
	{ "n": 5, "s":"5"},
	{ "n": 33, "s":"33"},
	{ "n": 9, "s":"9"},
	{ "n": 11, "s":"11"},
	{ "n": 42, "s":"42"},
	{ "n": 22, "s":"22"},
	{ "n": 7, "s":"7"}
	]
}') as jdoc
)
select max(j.n) as nMax
from base b, json_table(b.jdoc, '$.myArray[*]' columns (n path '$.n')
)j
/

PROMPT 
PROMPT Option 5
PROMPT
with base as (
select json('
{"myArray": [
	{ "n": 5, "s":"5"},
	{ "n": 33, "s":"33"},
	{ "n": 9, "s":"9"},
	{ "n": 11, "s":"11"},
	{ "n": 42, "s":"42"},
	{ "n": 22, "s":"22"},
	{ "n": 7, "s":"7"}
	]
}') as jdoc
)
select max(to_number(j.n)) as nMax
from base b,
json_table(b.jdoc,'$.myArray[*]'
columns(n path '$.stringOnly()')
)j
/

PROMPT 
PROMPT Option 6
PROMPT
with base as (
select json('
{"myArray": [
	{ "n": 5, "s":"5"},
	{ "n": 33, "s":"33"},
	{ "n": 9, "s":"9"},
	{ "n": 11, "s":"11"},
	{ "n": 42, "s":"42"},
	{ "n": 22, "s":"22"},
	{ "n": 7, "s":"7"}
	]
}') as jdoc
)
select json_value(b.jdoc,'$.myArray[*].n.maxString()') as nMax
from base b
/

PROMPT 
PROMPT Option 7
PROMPT
with base as (
select json('
{"myArray": [
	{ "n": 5, "s":"5"},
	{ "n": 33, "s":"33"},
	{ "n": 9, "s":"9"},
	{ "n": 11, "s":"11"},
	{ "n": 42, "s":"42"},
	{ "n": 22, "s":"22"},
	{ "n": 7, "s":"7"}
	]
}') as jdoc
)
select json_value(b.jdoc, '$.myArray[*].n.max()') as nMax
from base b
/

PROMPT 
PROMPT Option 8
PROMPT
with base as (
select json('
{"myArray": [
	{ "n": 5, "s":"5"},
	{ "n": 33, "s":"33"},
	{ "n": 9, "s":"9"},
	{ "n": 11, "s":"11"},
	{ "n": 42, "s":"42"},
	{ "n": 22, "s":"22"},
	{ "n": 7, "s":"7"}
	]
}') as jdoc
)
select json_value(json_query(b.jdoc,'$.myArray[*].n.max()')
,'$.number()'
) as nMax
from base b
/


PROMPT 
PROMPT Option 9
PROMPT
with base as (
select json('
{"myArray": [
	{ "n": 5, "s":"5"},
	{ "n": 33, "s":"33"},
	{ "n": 9, "s":"9"},
	{ "n": 11, "s":"11"},
	{ "n": 42, "s":"42"},
	{ "n": 22, "s":"22"},
	{ "n": 7, "s":"7"}
	]
}') as jdoc
)
select json_value(json_query(b.jdoc,'$.myArray[*].*.max()')
,'$.number()'
) as nMax
from base b
/

PROMPT 
PROMPT Option 10
PROMPT
with base as (
select json('
{"myArray": [
	{ "n": 5, "s":"5"},
	{ "n": 33, "s":"33"},
	{ "n": 9, "s":"9"},
	{ "n": 11, "s":"11"},
	{ "n": 42, "s":"42"},
	{ "n": 22, "s":"22"},
	{ "n": 7, "s":"7"}
	]
}') as jdoc
)
select json_value(json_query(b.jdoc,'$.myArray[*].s.max()')
,'$.number()'
) as nMax
from base b
/

PROMPT 
PROMPT Option 11
PROMPT
with base as (
select json('
{"myArray": [
	{ "n": 5, "s":"5"},
	{ "n": 33, "s":"33"},
	{ "n": 9, "s":"9"},
	{ "n": 11, "s":"11"},
	{ "n": 42, "s":"42"},
	{ "n": 22, "s":"22"},
	{ "n": 7, "s":"7"}
	]
}') as jdoc
)
select max(j.n) as nMax
from base b,
json_table(b.jdoc, '$.myArray[*]'
columns(n number path '$.n')
)j
/




