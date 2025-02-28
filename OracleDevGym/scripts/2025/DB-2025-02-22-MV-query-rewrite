-- Uncomment this and execute using ADMIN
-- grant select on v$session to DEVGYM;
-- grant select on v$sql_plan to DEVGYM;
-- GRANT SELECT_CATALOG_ROLE TO DEVGYM;
-- GRANT SELECT ON V$SQL_PLAN TO DEVGYM;
-- GRANT EXECUTE ON DBMS_XPLAN TO DEVGYM;
-- 

-- SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'DEVGYM' AND TABLE_NAME = 'V_$SQL_PLAN';
-- SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'DEVGYM' AND TABLE_NAME = 'DBMS_XPLAN';

SET ROLE ALL;

-- Drop existing objects if they exist (optional cleanup)
DROP MATERIALIZED VIEW if exists qz_class_counts;
DROP TABLE if exists qz_class_students;
DROP TABLE if exists qz_classes;

-- Create the tables
CREATE TABLE qz_classes (
    class_id INTEGER PRIMARY KEY,
    class_name VARCHAR2(10)
);

CREATE TABLE qz_class_students (
    class_id INTEGER REFERENCES qz_classes,
    student_id INTEGER,
    PRIMARY KEY (class_id, student_id)
);

-- Create the materialized view with query rewrite enabled
CREATE MATERIALIZED VIEW qz_class_counts
ENABLE QUERY REWRITE AS
SELECT class_name, COUNT(*)
FROM qz_classes
JOIN qz_class_students USING (class_id)
GROUP BY class_name;

-- Run queries to check for query rewrite
-- After each query, run the dbms_xplan command to check the execution plan

PROMPT CHOICE 1
-- Choice 1
SELECT class_name, COUNT(*)
FROM qz_classes
JOIN qz_class_students USING (class_id)
GROUP BY class_name;

-- SET ROLE SELECT_CATALOG_ROLE;

-- Check the execution plan
SELECT * FROM dbms_xplan.display_cursor(format => 'BASIC');

PROMPT CHOICE 2
-- Choice 2
SELECT class_name, COUNT(*)
FROM qz_classes
LEFT JOIN qz_class_students USING (class_id)
GROUP BY class_name;

-- Check the execution plan
SELECT * FROM dbms_xplan.display_cursor(format => 'BASIC');

PROMPT CHOICE 3
-- Choice 3
SELECT class_name, COUNT(*)
FROM qz_classes c
JOIN qz_class_students cs
ON c.class_id = cs.class_id
GROUP BY class_name;

-- Check the execution plan
SELECT * FROM dbms_xplan.display_cursor(format => 'BASIC');

PROMPT CHOICE 4
-- Choice 4
SELECT class_name, COUNT(*)
FROM qz_classes c,
    qz_class_students cs
WHERE c.class_id = cs.class_id
GROUP BY class_name;

-- Check the execution plan
SELECT * FROM dbms_xplan.display_cursor(format => 'BASIC');

PROMPT CHOICE 5
-- Choice 5
SELECT class_id, COUNT(*)
FROM qz_class_students
GROUP BY class_id;

-- Check the execution plan
SELECT * FROM dbms_xplan.display_cursor(format => 'BASIC');
