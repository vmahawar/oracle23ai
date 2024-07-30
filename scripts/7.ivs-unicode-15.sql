--
--Ideographic Variation Sequence Symbols
--IVS - two coded characters which needs to be treated as one semantic
==

--First Character Atomic Ideographic property
--Second Character Variation Selector

CREATE TABLE TEST (COL1 VARCHAR2(20), COL2 NUMBER);

INSERT INTO TEST VALUES (UNISTR('abc\845B\DB40\DD00xyz'),100);
INSERT INTO TEST VALUES (UNISTR('abc\845B\DB40\DD01xyz'),101);

COMMIT;

SELECT * FROM TEST;

-- Vartions sequences are counted as single character
SELECT LENGTH(COL1),COL2 from test;
-- 8,100
-- 8,101
-- 8,102


SELECT '🧘' AS "PERSON IN LOTUS POSITION = yoga, meditation - 1F9D8"
      ,UNISTR('\1F9D8') AS emoji_unistr
 FROM DUAL;

 select ASCII(character) from dual;
 select ASCII('😊') from dual; --4036991114
 select ASCII('🧘') from dual; --4036994968

 select chr(4036991114) from dual;

 select chr(4036994968) from dual;

--"PERSON IN LOTUS POSITION" has unicode point - 1F9D8"
 SELECT '🧘' AS "Yoga-Emoji" 
       ,ASCII('🧘') "ASCII_for_Yoga"
       ,CHR(4036994968) AS "Yoga_Emoji_using_ASCII"
FROM dual;