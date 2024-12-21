SET ECHO ON
SET FEEDBACK ON

DROP TABLE IF EXISTS JSON_TAB CASCADE CONSTRAINTS;
CREATE TABLE JSON_TAB
(
  jval JSON CONSTRAINT jtab_lisjson CHECK (jval is JSON VALIDATE USING
  '{
    "type": "object",
    "minProperties":2
    }')
);

insert into json_tab values ('["a","b"]');
insert into json_tab values ('{"a":1,"b":2}');
insert into json_tab values ('{"z":26}');

BEGIN DBMS_JSON_SCHEMA.VALIDATE_REPORT(); END;

DROP TABLE IF EXISTS JSON_TAB2 CASCADE CONSTRAINTS;
CREATE TABLE IF NOT EXISTS JSON_TAB2
(
  jval JSON VALIDATE USING
  '{
    "type": "object",
    "properties": { 
                    "price": {"type": "number"},
                    "name":  {"type": "string"}
                   }
    }'
);

insert into JSON_TAB2 values ('{"price":"twenty","name":"widget"}'); --Invalid
insert into JSON_TAB2 values ('{"price":10,"name":"widget"}'); --valid

--Requires CREATE DOMAIN privs to USER DEMO_USER
--DB_DEVELOPER_ROLE already had CREATE DOMAIN PRIV
SET ROLE DB_DEVELOPER_ROLE;

CREATE DOMAIN json_lat_long AS JSON VALIDATE USING
'{
"type": "object",
"required":["latitude","longitude"],
"properties":{
  "latitude":{
    "type":"number","minimum":-90,"maximum":90},
  "longitude":{
    "type":"number","minimum":-180,"maximum":180}
    }
}';

DROP TABLE IF EXISTS json_tab3;

CREATE TABLE IF NOT EXISTS json_tab3 
(
  j JSON DOMAIN json_lat_long
);

--Valid insert
INSERT INTO json_tab3
VALUES (
  '{ 
  "latitude": -89,
  "longitude": -179
  }'
);

--Invalid Insert
INSERT INTO json_tab3
VALUES (
  '{ 
  "latitude": -890,
  "longitude": -1790
  }'
);

--Reports Error
SELECT JSON_SERIALIZE(
  DBMS_JSON_SCHEMA.VALIDATE_REPORT
  (
    json_data => JSON('{"a":1}'),
    json_schema => JSON('{"type":"array"}')) pretty)
AS REPORT FROM DUAL;

--Valid JSON
SELECT JSON_SERIALIZE(
  DBMS_JSON_SCHEMA.VALIDATE_REPORT
  (
    json_data => JSON('[{"a":1},{"b":2}]'),
    json_schema => JSON('{"type":"array"}')) pretty)
AS REPORT FROM DUAL;