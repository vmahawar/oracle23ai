--Predicates for JSON_VALUE and JSON_QUERY
--Variables can be passed

DROP Table IF EXISTS jtab;

CREATE Table IF NOT EXISTS jtab
(j JSON);

INSERT INTO jtab VALUES ('[
{"type":"work","number":"555-123-2345"},
{"type":"home","number":"555-999-1111"},
{"type":"mobile","number":"555-999-5533"}
]');

--Use JSON_QUERY to locate the work number
SELECT json_query(j,'$[*]?(@.type == $var1)' passing 'work' as "var1") 
  from jtab;