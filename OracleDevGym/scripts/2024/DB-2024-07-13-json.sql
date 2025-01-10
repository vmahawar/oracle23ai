create or replace procedure qz_output_json (
	p_json in json
) is
begin
	dbms_output.put_line(json_serialize(p_json pretty));
end qz_output_json;
/

PROMPT
PROMPT ****Choice 1******
PROMPT

begin
qz_output_json(json('["Huey","Dewey","Louie"]'));
end;
/

PROMPT
PROMPT ****Choice 2******WRONG
PROMPT

begin
qz_output_json(
    json_array('Huey','Dewey','Louie'));
end;
/

PROMPT
PROMPT ****Choice 3******
PROMPT

begin
qz_output_json(
    json_array('Huey','Dewey','Louie' returning json));
end;
/

PROMPT
PROMPT ****Choice 4******
PROMPT

begin
qz_output_json(
    json(json_array('Huey','Dewey','Louie')));
end;
/

PROMPT
PROMPT ****Choice 5******
PROMPT

DECLARE
type va_t is varray(3) of varchar2(10);
begin
qz_output_json(
    json(va_t('Huey','Dewey','Louie')));
end;
/

PROMPT
PROMPT ****Choice 6******
PROMPT

DECLARE
type nt_t is table of varchar2(10);
begin
qz_output_json(
    json(nt_t('Huey','Dewey','Louie')));
end;
/

PROMPT
PROMPT ****Choice 7******
PROMPT

DECLARE
type aa_t is table of varchar2(10) index by PLS_INTEGER;
begin
qz_output_json(
    json(aa_t('Huey','Dewey','Louie')));
end;
/

PROMPT
PROMPT ****Choice 8******WRONG
PROMPT

DECLARE
type aa_t is table of varchar2(10) index by varchar2(20);
begin
qz_output_json(
    json(aa_t('nephewOne' => 'Huey','newphewTwo' => 'Dewey','nephewThree' => 'Louie')));
end;
/

---Quiz on Intersect Operator

create table qz_bricks_stage(
    colour varchar2(10),
    shape varchar2(10)
);

create table qz_bricks(
    colour varchar2(10),
    shape varchar2(10)
);

BEGIN
insert into qz_bricks_stage values('red','cylinder');
insert into qz_bricks_stage values('red','cylinder');
insert into qz_bricks_stage values('red','cube');
insert into qz_bricks_stage values('blue','cube');

insert into qz_bricks values('red','cylinder');
insert into qz_bricks values('red','cylinder');
insert into qz_bricks values('blue','cube');
insert into qz_bricks values('blue','cube');

commit;

end;

/*Which choice gives output:

COLOUR     SHAPE
---------- ----------
blue       cube
red        cylinder
red        cylinder*/

PROMPT
PROMPT Choice 1 WRONG
PROMPT

select * from QZ_BRICKS_STAGE
INTERSECT
select * from QZ_BRICKS
order by 1,2;

PROMPT
PROMPT Choice 2
PROMPT

select * from QZ_BRICKS_STAGE
INTERSECT ALL
select * from QZ_BRICKS
order by 1,2;

PROMPT
PROMPT Choice 3
PROMPT

select * from QZ_BRICKS_STAGE brst
where exists (
select * from QZ_BRICKS bric
where bric.colour = brst.colour
and bric.shape = brst.shape)
order by 1,2;

PROMPT
PROMPT Choice 4 WRONG
PROMPT

select * from QZ_BRICKS bric
where exists (
select * from QZ_BRICKS_STAGE brst
where bric.colour = brst.colour
and bric.shape = brst.shape)
order by 1,2;

PROMPT
PROMPT Choice 5
PROMPT

select colour,SHAPE 
from (select colour, shape,row_number() over(partition by colour, shape order by 1) rn
from QZ_BRICKS_STAGE
intersect 
select colour, shape, row_number() over (partition by colour, shape order by 1)
rn from qz_bricks)
order by 1,2;

create type qz_food_t as object(
    name varchar2(100), 
    food_group varchar2(100),
    member function price(discount in number) return number)
    not final;

create or replace type body qz_food_t IS
MEMBER function price (discount_in IN number) return number is
BEGIN
    dbms_output.put_line('Food Price!');
    return 10 - discount_in;
end;
end;
/