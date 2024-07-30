--ENable faster real-time analytics performance 
--requires restarts can be set at system level also
--ALTER SESSION SET INMEMORY_DEEP_VECTORIZATION=TRUE;

SET ECHO ON;

--Create table with vector datatype
drop table if exists vector_example_1;
create table if not exists vector_example_1
(id number,
description varchar2(50 char),
vector_col vector);

desc vector_example_1;

select * from vector_example_1;

--Inserting into vector_example_1
insert into vector_example_1
VALUES 
(1,'This is first row for vector example','[1,2,3,4,5,6]'),(2,'This is second row for vector example','[1,2,3,4,5,6]'),
(3,'This is third row for vector example','[1,2,3,4,5,6]'),(4,'This is fourth row for vector example','[1,2,3,4,5,6]'),
(5,'This is fifth row for vector example','[1,2,3,4,5,6]'),(6,'This is sixth row for vector example','[1,2,3,4,5,6]');

--selecting from vector_example_1
select * from vector_example_1;

--Create table with vector datatype
drop table if exists vector_example_2;
create table if not exists vector_example_2
(id number,
description varchar2(50 char),
vector_col vector);

desc vector_example_2;

select * from vector_example_2;

--Inserting into vector_example_2
insert into vector_example_2
VALUES 
(1,'This is first row for vector example','[1,2,3,4,5,6]'),(2,'This is second row for vector example','[1,2,3,4,5,6]'),
(3,'This is third row for vector example','[1,2,3,4,5,6]'),(4,'This is fourth row for vector example','[1,2,3,4,5,6]'),
(5,'This is fifth row for vector example','[1,2,3,4,5,6]'),(6,'This is sixth row for vector example','[1,2,3,4,5,6]');

--selecting from vector_example_2
select * from vector_example_2;