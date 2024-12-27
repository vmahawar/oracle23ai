set serveroutput on;

PROMPT
PROMPT CHOICE 1
PROMPT

create or replace function qz_age_category (
age integer
) return varchar2 as
begin
    return case
    when age is null then 'Unknown'
    when age >= 40 then 'Veteran'
    when age >=18 then 'Adult'
    when age >= 10 then 'Junior'
    else 'Child'
    end;
end;
/

begin
    dbms_output.put_line(qz_age_category(9));
    dbms_output.put_line(qz_age_category(12));
    dbms_output.put_line(qz_age_category(18));
    dbms_output.put_line(qz_age_category(40));
    dbms_output.put_line(qz_age_category(null));
end;
/

PROMPT
PROMPT CHOICE 2
PROMPT

create or replace function qz_age_category (
age integer
) return varchar2 as
begin
    return case
    when age in (10,11,12,13,14,15,16,17) then 'Junior'
    when age < 40 then 'Adult'
    when age is null then 'Unknown'
    when age < 10 then 'Child'
    else 'Veteran'
    end;
end;
/

begin
    dbms_output.put_line(qz_age_category(9));
    dbms_output.put_line(qz_age_category(12));
    dbms_output.put_line(qz_age_category(18));
    dbms_output.put_line(qz_age_category(40));
    dbms_output.put_line(qz_age_category(null));
end;
/

PROMPT
PROMPT CHOICE 3
PROMPT

create or replace function qz_age_category (
age integer
) return varchar2 as
begin
    return case
    when age between 18 and 39 then 'Adult'
    when age < 10 then 'Child'
    when age is null then 'Unknown'
    when age >= 40 then 'Veteran'
    else 'Junior'
    end;
end;
/

begin
    dbms_output.put_line(qz_age_category(9));
    dbms_output.put_line(qz_age_category(12));
    dbms_output.put_line(qz_age_category(18));
    dbms_output.put_line(qz_age_category(40));
    dbms_output.put_line(qz_age_category(null));
end;
/

PROMPT
PROMPT CHOICE 4
PROMPT

create or replace function qz_age_category (
age integer
) return varchar2 as
begin
    return case age
    when is null then 'Unknown'
    when < 10 then 'Child'
    when < 18 then 'Junior'
    when < 40 then 'Adult'
    else 'Veteran'
    end;
end;
/

begin
    dbms_output.put_line(qz_age_category(9));
    dbms_output.put_line(qz_age_category(12));
    dbms_output.put_line(qz_age_category(18));
    dbms_output.put_line(qz_age_category(40));
    dbms_output.put_line(qz_age_category(null));
end;
/

PROMPT
PROMPT CHOICE 5
PROMPT

create or replace function qz_age_category (
age integer
) return varchar2 as
begin
    return case age
    when >= 40 then 'Veteran'
    when >= 18 then 'Adult'
    when >= 10 then 'Junior'
    when is null then 'Unknown'
    else 'Child'
    end;
end;
/

begin
    dbms_output.put_line(qz_age_category(9));
    dbms_output.put_line(qz_age_category(12));
    dbms_output.put_line(qz_age_category(18));
    dbms_output.put_line(qz_age_category(40));
    dbms_output.put_line(qz_age_category(null));
end;
/

PROMPT
PROMPT CHOICE 6
PROMPT

create or replace function qz_age_category (
age integer
) return varchar2 as
begin
    return case age
    when between 10 and 18 then 'Junior'
    when < 10 then 'Child'
    when >= 18 then 'Adult'
    when >= 40 then 'Veteran'
    else 'Unknown'
    end;
end;
/

begin
    dbms_output.put_line(qz_age_category(9));
    dbms_output.put_line(qz_age_category(12));
    dbms_output.put_line(qz_age_category(18));
    dbms_output.put_line(qz_age_category(40));
    dbms_output.put_line(qz_age_category(null));
end;
/

PROMPT
PROMPT CHOICE 7
PROMPT

create or replace function qz_age_category (
age integer
) return varchar2 as
begin
    return case age
    when < 10 then 'Child'
    when >= 10, < 18 then 'Junior'
    when >= 18, < 40 then 'Adult'
    when >= 40 then 'Veteran'
    else 'Unknown'
    end;
end;
/

begin
    dbms_output.put_line(qz_age_category(9));
    dbms_output.put_line(qz_age_category(12));
    dbms_output.put_line(qz_age_category(18));
    dbms_output.put_line(qz_age_category(40));
    dbms_output.put_line(qz_age_category(null));
end;
/
