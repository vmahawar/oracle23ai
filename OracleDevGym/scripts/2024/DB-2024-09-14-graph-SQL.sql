create table qz_persons
(id integer primary key
,name varchar2(10)
);

create table qz_relations(
	person1 references qz_persons
   ,person2 references qz_persons
   ,relation varchar2(10)
   ,constraint qz_relations_pk primary key (person1, person2)
);

create unique index qz_relations_uq on qz_relations (person2, person1);

create property graph qz_relation_network
	vertex tables(
		qz_persons as person
		label person properties (id,name)
	)
	edge tables(
		qz_relations as relation
			source key (person1) references person(id)
			destination key (person2)
			references person(id)
			label relation
			properties (relation)	
);

delete from qz_persons;

insert into qz_persons values
 (41, 'Abraham'), (42,'Benedict'),(43,'Christine')
,(44, 'Dorothy'), (45,'Elizabeth'),(46,'Fedrico')
,(47,'Guiseppe'),(48,'Henrietta')
;

delete from QZ_RELATIONS;

insert into qz_relations values
 (41,45,'Father of'),(43,45,'Mother of')
,(42,46,'Father of'),(44,46,'Mother of')
,(46,47,'Father of'),(45,47,'Mother of')
,(46,48,'Father of'),(45,48,'Mother of')
,(47,48,'Brother of'),(48,47,'Sister of');

commit;

PROMPT 
PROMPT Opton 1
PROMPT

select gp.name
  from qz_persons gp
join qz_relations gp2p
  on gp2p.person1 = gp.id
 and gp2p.relation in ('Father of','Mother of')
 join qz_persons p
   on p.id = gp2p.person2
 join qz_relations p2c
   on p2c.person1 = p.id
   and p2c.relation in ('Father of','Mother of')
 join qz_persons c
   on c.id = p2c.person2
where c.name = 'Henreietta'
order by gp.id;

PROMPT 
PROMPT Opton 2
PROMPT

select name
  from graph_table(qz_relation_network
    match
	(gp) - [gp2p] - (p) - [p2c] - (c)
   columns (gp.id, gp.name, gp2p.relation as gp2p_rel, p2c.relation as p2c_rel,
   c.name as child_name)
  )
  where child_name = 'Henrietta'
    and gp2p_rel in ('Father of','Mother of')
	and p2c_rel in ('Father of','Mother of')
   order by id;

PROMPT 
PROMPT Option 3  --CORRECT
PROMPT 

select name
  from graph_table (qz_relation_network
  match
   (gp) - [gp2p] -> (p) - [p2c] -> (c)
   columns (gp.id,gp.name,gp2p.relation as gp2p_rel, p2c.relation as p2c_rel, c.name as child_name)
  )
  where child_name = 'Henrietta'
    and gp2p_rel in ('Father of','Mother of')
	and p2c_rel in ('Father of','Mother of')
   order by id;
   
PROMPT
PROMPT Option 4
PROMPT

select name
	from graph_table(qz_relation_network
	match (gp) - [gp2p where gp2p.relation in ('Father of','Mother of')]-> 
	(p) 
	- [p2c where p2c.relation in ('Father of','Mother of')]->
	(c where c.name = 'Henreitta')
	columns (gp.id,gp.name)
)
order by id;

PROMPT 
PROMPT Option 5
PROMPT

select name
	from graph_table	(qz_relation_network
	match 
		(gp)
		-[r where r.relation in ('Father of','Mother of')]->{2}
		(c where c.name = 'Henreitta')
		columns (gp.id, gp.name)
	)
	order by id;

PROMPT 
PROMPT Option 6
PROMPT

select name
  from graph_table (qz_relation_network
     match
	 (gp) -[r]->{2} (c)
	 columns (gp.id,gp.name,r.relation,c.name as child_name)
	 )
  where child_name = 'Henrietta'
    and relation in ('Father of','Mother of')
  order by id;

  PROMPT
  PROMPT Option 7 -- CORRECT
  PROMPT

  select name
    from graph_table(qz_relation_network
	match
	   (c where c.name = 'Henrietta')
	   <-[r where r.relation in ('Father of','Mother of')]-{2}
	   (gp)
	   columns (gp.id,gp.name)
	)
	order by id;