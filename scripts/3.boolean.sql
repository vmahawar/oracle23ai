DROP TABLE IF EXISTS bool_example;

CREATE TABLE IF NOT EXISTS bool_example 
(id NUMBER
,c1 BOOLEAN
,c2 BOOL);

TRUNCATE TABLE bool_example;

INSERT INTO bool_example
VALUES
(1, TRUE, NULL), (2, FALSE, true),(3, 0, 'off'),(4, 'no', 'yes'),
(5, 'f', 't' ),(6, false, true),(7, 'on', 'off'),(8, -3.14, 1);

commit;

SET ECHO ON;
SELECT * from bool_example;
SELECT * FROM bool_example WHERE NOT c2;
SELECT * FROM bool_example WHERE c1 AND c2;
SELECT * FROM bool_example WHERE c1 AND TRUE;
SELECT * FROM bool_example WHERE c1 OR c2;

