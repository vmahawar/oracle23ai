/*
https://youtu.be/4uknPkJkUIk?feature=shared
*/

drop table if exists qz_people ;

create table qz_people(
     who varchar2(30) primary key
);

drop table if exists qz_relatives ;

create table qz_relatives(
     parent varchar2(30)
    ,child varchar2(30)
    ,primary key(parent,child)
);

create or replace PROPERTY GRAPH qz_family_graph
vertex tables(qz_people)
edge tables(
     qz_relatives as parent
          source key (child) REFERENCES qz_people(who)
          DESTINATION key (parent) REFERENCES qz_people (who),
     qz_relatives as child
          source key (parent) references qz_people(who)
          DESTINATION key (child) REFERENCES qz_people(who)
);

insert into qz_people 
values ('you'),('sibling'),('parent'),
       ('grandparent'),('cousin'),('aunt');

insert into qz_relatives
values ('parent','you'),('parent','sibling'),
       ('grandparent','parent'),('grandparent','aunt'),
       ('aunt','cousin');
     
commit;

--Given these data which choices run a graph query that travels from you to cousin, returning this row?

/*
WHO
--------------------------------
COUSIN
*/

PROMPT Option 1: --CORRECT
select cousin as who from graph_table(
     qz_family_graph match
          (you) - [is parent] ->
          (parent) - [ is parent] ->
          (gparent) - [ is child] ->
          (aunt_uncles) - [is child] ->
          (cousin)
     columns (cousin.who as cousin, you.who as you)
)
where cousin <> you
  and you = 'you'
  and cousin <> 'sibling';


PROMPT Option 2: INCORRECT
select * from graph_table(
     qz_family_graph match
          (you) - [is parent] ->
          (parent) - [ is parent] ->
          (gparent) - [ is child] ->
          (aunt_uncles) - [is child] ->
          (cousin)
     columns (cousin.who)
)
where cousin.who <> you.who
  and you.who = 'you'
  and cousin.who <> 'sibling';

PROMPT Option 3: INCORRECT
select * from graph_table(
     qz_family_graph match
          (you where you.who = 'you') - [is parent] ->
          (parent) - [ is parent] ->
          (gparent) - [ is child] ->
          (aunt_uncles) - [is child] -> 
          (cousin where cousin.who <> 'sibling')
     columns (cousin.who)
);

PROMPT Option 4: CORRECT
select * from graph_table(
     qz_family_graph match
          (you where you.who = 'you') - [p is parent] ->
          (parent) - [ is parent] ->
          (gparent) - [ is child] ->
          (aunt_uncles) - [c is child] -> 
          (cousin where p.parent <> c.parent)
     columns (cousin.who)
);

PROMPT Option 5: CORRECT
select * from graph_table(
     qz_family_graph match
          (you where you.who = 'you') - [p is parent] -> {2}
          (parent) - [ is child] -> {2}
          (cousin where cousin.who not in ('you','sibling'))
     columns (cousin.who)
);

PROMPT Option 6: INCORRECT
select * from graph_table(
     qz_family_graph match
          (you where you.who = 'you') - [p is parent] -> {2}
          (parent) - [c is child] -> {2}
          (cousin where p.parent <> c.parent)
     columns (cousin.who)
);

PROMPT Option 7: CORRECT
select * from graph_table(
     qz_family_graph match
          (you where you.who = 'you') - [is parent] -> {2}
          (parent) - [c is child where c.child <> 'parent'] -> {2}
          (cousin)
     columns (cousin.who)
);