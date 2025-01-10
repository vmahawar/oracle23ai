drop table if exists qz_classes_JS;

create table qz_classes_JS(class JSON);

insert into qz_classes_JS values(
  JSON {
    'Title': 'English 101'
   ,'Teacher': {'Name': 'Mrs. Robinson'}
  }
);

commit;

drop table if exists qz_classes_vc;

create table qz_classes_vc (class varchar2(4000) check(class is JSON));

insert into qz_classes_vc VALUES(
  '{
  "Title": "English 101"
  ,"Teacher" : {"Name": "Mrs. Robinson"}
  }'
);

commit;

-------

PROMPT
PROMPT CHOICE 1
PROMPT

select classes.class.teacher.Name as teacher_name
  from QZ_CLASSES_JS classes;

PROMPT
PROMPT CHOICE 2
PROMPT

select classes.class.teacher.Name.string() as teacher_name
  from QZ_CLASSES_JS classes;  

PROMPT
PROMPT CHOICE 3
PROMPT

select json_value(classes.class,'$.Teacher.Name') as teacher_name
  from QZ_CLASSES_JS classes;

PROMPT
PROMPT CHOICE 4
PROMPT

select json_query(classes.class, '$.Teacher.Name') as teacher_name
  from QZ_CLASSES_JS classes;  

PROMPT
PROMPT CHOICE 5
PROMPT

select json_query(classes.class, '$.Teacher.Name.string()') as teacher_name
  from QZ_CLASSES_JS classes;  

PROMPT
PROMPT CHOICE 6
PROMPT

select json_query(classes.class, '$.Teacher.Name' returning varchar2(30)) as teacher_name
  from QZ_CLASSES_JS classes;  

PROMPT
PROMPT CHOICE 7
PROMPT

select classes.class.teacher.Name as teacher_name
  from QZ_CLASSES_VC classes;

PROMPT
PROMPT CHOICE 8
PROMPT

select classes.class.teacher.Name.string() as teacher_name
  from QZ_CLASSES_VC classes;  

PROMPT
PROMPT CHOICE 9
PROMPT

select json_value(classes.class,'$.Teacher.Name') as teacher_name
  from QZ_CLASSES_VC classes;

PROMPT
PROMPT CHOICE 10
PROMPT

select json_query(classes.class, '$.Teacher.Name') as teacher_name
  from QZ_CLASSES_VC classes;  

PROMPT
PROMPT CHOICE 11
PROMPT

select json_query(classes.class, '$.Teacher.Name.string()') as teacher_name
  from QZ_CLASSES_VC classes;  

PROMPT
PROMPT CHOICE 12
PROMPT

select json_query(classes.class, '$.Teacher.Name' returning varchar2(30)) as teacher_name
  from QZ_CLASSES_VC classes;    