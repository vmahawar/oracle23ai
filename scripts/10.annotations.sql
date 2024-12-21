drop table if exists annotation_demo;

create table if not exists annotation_demo
(
demo_col_id NUMBER ANNOTATIONS(IDENTITY, DISPLAY 'Second Column', "My Category" 'demo_table'),
demo_col1 number ANNOTATIONS(DISPLAY 'First Column',"My Category" 'demo_table'),
demo_col2 varchar2(10) ANNOTATIONS(DISPLAY 'Second Column', "My Category" 'demo_table')
);

desc annotation_demo;

select * from USER_ANNOTATIONS_USAGE;