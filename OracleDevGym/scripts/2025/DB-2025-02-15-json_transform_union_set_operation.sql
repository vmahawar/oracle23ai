drop table if EXISTS qz_json;

create table qz_json as
select
    json(q'~
{
    "awardYear" : "2024",
    "laureates" :
    [
        {"name" : "Daron Acemoglu", "category" : "Economic Sciences"},
        {"name" : "David Baker", "category" : "Chemistry"},
        {"name" : "Demis Hassabis", "category" : "Chemistry"},
        {"name" : "Gary Ruvkun", "category" : "Physiology or Medicine"},
        {"name" : "Geoffrey Hinton", "category" : "Physics"},
        {"name" : "Han Kang", "category" : "Literature"},
        {"name" : "James A. Robinson", "category" : "Economic Sciences"},
        {"name" : "John J. Hopfield", "category" : "Physics"},
        {"name" : "John Jumper", "category" : "Chemistry"},
        {"name" : "Simon Henry Roberts Johnson", "category" : "Economic Sciences"},
        {"name" : "Victor Ambros", "category" : "Physiology or Medicine"}
    ]
}
~') as jdoc;

--Expected Output
-- {
--     "awardYear" : "2024",
--     "categories" : "Chemistry, Economic Sciences, Literature, Physics, Physiology or Medicine"
-- }

select json_transform(jdoc, 
        set '$.categories' = 
        (select listagg(distinct category, ', ') within group (order by category)
         from json_table(jdoc, '$.laureates[*]' 
                         columns (category varchar2(100) path '$.category'))
        ), 
        remove '$.laureates'
    returning clob pretty) as jSummary
from qz_json;
/


PROMPT CHOICE 1
select 
    json_transform(jdoc, 
        sort '$.laureates' order by '$.category'
       ,append '$temp' = path '$.laureates[*].category' create on missing
       ,set '$.categories' = path '$temp[*].listagg(", ")'
       ,remove '$.laureates'
    returning clob pretty) as jSummary
from qz_json;
/

PROMPT CHOICE 2
select 
    json_transform(jdoc, 
        append '$temp' = path '$.laureates[*].category' create on missing
       ,sort '$temp'
       ,minus '$temp' = json('[]')
       ,set '$.categories' = path '$temp[*].listagg(", ")'
       ,remove '$.laureates'
    returning clob pretty) as jSummary
from qz_json;
/

PROMPT CHOICE 3
select 
    json_transform(jdoc, 
        append '$temp' = path '$.laureates[*].category' create on missing
       ,minus '$temp' = json('[]')
       ,sort '$temp'
       ,set '$.categories' = path '$temp[*].listagg(", ")'
       ,remove '$.laureates'
    returning clob pretty) as jSummary
from qz_json;
/

PROMPT CHOICE 4
select 
    json_transform(jdoc, 
        sort '$.laureates' order by 'category'
       ,union '$temp' = path '$.laureates[*].category' create on missing
       ,set '$.categories' = path '$temp[*].listagg(", ")'
       ,remove '$.laureates'
    returning clob pretty) as jSummary
from qz_json;
/

PROMPT CHOICE 5
select 
    json_transform(jdoc, 
        union '$temp' = path '$.laureates[*].category' create on missing
       ,sort '$temp'
       ,set '$.categories' = path '$temp[*].listagg(", ")'
       ,remove '$.laureates'
    returning clob pretty) as jSummary
from qz_json;
/

PROMPT CHOICE 6
select 
    json_transform(jdoc, 
        copy '$temp' = path '$.laureates[*].category'
       ,sort '$temp' unique
       ,set '$.categories' = path '$temp[*].listagg(", ")'
       ,remove '$.laureates'
    returning clob pretty) as jSummary
from qz_json;
/

PROMPT CHOICE 7
select 
    json_transform(jdoc, 
        copy '$temp' = path '$.laureates[*].category'
       ,union '$temp' = path '$temp'
       ,sort '$temp'
       ,set '$.categories' = path '$temp[*].listagg(", ")'
       ,remove '$.laureates'
    returning clob pretty) as jSummary
from qz_json;
/

PROMPT CHOICE 8
select 
    json_transform(jdoc, 
        sort '$temp' order by '$.category'
       ,copy '$temp' = path '$.laureates[*].category'
       ,intersect '$temp' = path '$.laureates.category'
       ,set '$.categories' = path '$temp[*].listagg(", ")'
       ,remove '$.laureates'
    returning clob pretty) as jSummary
from qz_json;
/

PROMPT CHOICE 9
select 
    json_transform(jdoc, 
        copy '$temp' = path '$.laureates[*].category'
       ,intersect '$temp' = path '$.laureates.category'
       ,sort '$temp'
       ,set '$.categories' = path '$temp[*].listagg(", ")'
       ,remove '$.laureates'
    returning clob pretty) as jSummary
from qz_json;
/