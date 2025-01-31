-- grant alter system to DEVGYM;
-- From Oracle 11g R2

PROMPT
PROMPT CHOICE 1
PROMPT

DECLARE
      l_fmt VARCHAR2(30) := 'yyyy-mm-dd hh24:mi:ss am';
BEGIN
      EXECUTE IMMEDIATE q'[alter system set SYSDATE = '2011-11-11 11:11:11']';

      dbms_output.put_line('Runing Test at ' || to_char(sysdate,l_fmt));
END;
/

PROMPT
PROMPT CHOICE 2
PROMPT

DECLARE
      l_fmt VARCHAR2(30) := 'yyyy-mm-dd hh24:mi:ss am';
BEGIN
      EXECUTE IMMEDIATE q'[alter system set FIXED_TIME = '2011-11-11 11:11:11']';

      dbms_output.put_line('Runing Test at ' || to_char(sysdate,l_fmt));
END;
/

PROMPT
PROMPT CHOICE 3
PROMPT

DECLARE
      l_fmt VARCHAR2(30) := 'yyyy-mm-dd hh24:mi:ss am';
BEGIN
      EXECUTE IMMEDIATE q'[alter system set FIXED_TIME = '2011-11-11 11:11:11 am']';

      dbms_output.put_line('Runing Test at ' || to_char(sysdate,l_fmt));
END;
/