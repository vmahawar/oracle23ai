DROP Table IF EXISTS jtab;

CREATE Table IF NOT EXISTS jtab
(j JSON);

INSERT INTO jtab VALUES ('{"name":{"first":"Fred","last":"Bloggs"}}');

SELECT * from jtab t
where t.j.name = json('{"last":"Bloggs","first":"Fred"}');

DROP Table IF EXISTS jtab;

CREATE Table IF NOT EXISTS jtab
(j JSON);

BEGIN
INSERT INTO jtab VALUES ('{"a":{"b":"b","c":2}}');
INSERT INTO jtab VALUES ('{"a":{"a":"x","c":2}}');
INSERT INTO jtab VALUES ('{"a":[1,2,3]}');
INSERT INTO jtab VALUES ('{"a":2}');
INSERT INTO jtab VALUES ('{"a":10}');
INSERT INTO jtab VALUES ('{"a":"1"}');
END;
/

--Sorting Mixed JSON Type Values using json_serialize
select t.j.a as "json_serialize order"
from jtab t order by JSON_SERIALIZE(t.j.a);

-- "1"
-- 10
-- 2
-- [1,2,3]
-- {"a":"x","c":2}
-- {"b":"b","c":2}

--Sorting Mixed JSON Type Values using JSONType Order
select t.j.a as "JSONType order"
from jtab t order by t.j.a;
-- 2
-- 10
-- "1"
-- {"a":"x","c":2}
-- {"b":"b","c":2}
-- [1,2,3]
