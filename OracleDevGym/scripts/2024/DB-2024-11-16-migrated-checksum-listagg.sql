DROP table if exists qz_original_source;

create table qz_original_source (
    id      integer primary key
    , name  varchar2(30)
);

DROP table if exists qz_migrated_target;
-- Simulate table in other database
create table qz_migrated_target (
    id      integer primary key
    , name  varchar2(30)
);

insert into qz_original_source values (42, 'Ada Hart');
insert into qz_original_source values (43, 'Bob Cash');
insert into qz_original_source values (44, 'Zoe Aden');
commit;

-- Simulate migration process to other database with a garbled name
insert into qz_migrated_target
    select
        id
        , case id when 42 then '{garble}' else name end as name
    from qz_original_source
    order by id desc;
commit;

PROMPT 
PROMPT Choice 1 -- INCORRECT
PROMPT
SELECT CASE src.check_id
       WHEN tgt.check_id THEN 'Identical'
       ELSE 'Diffs'
       END as id
      , CASE src.check_name
        WHEN tgt.check_name then 'Identical'
        ELSE 'Diffs'
       end as name
FROM (select listagg(id,'|') as check_id
            ,listagg(name, '|') as check_name
        from qz_original_source
      ) src
CROSS JOIN (
      select listagg(id, '|') as check_id
            ,listagg(name,'|') as check_name
        from qz_migrated_target
) tgt;

PROMPT 
PROMPT Choice 2 --CORRECT
PROMPT
SELECT CASE src.check_id
       WHEN tgt.check_id THEN 'Identical'
       ELSE 'Diffs'
       END as id
      , CASE src.check_name
        WHEN tgt.check_name then 'Identical'
        ELSE 'Diffs'
       end as name
FROM (select listagg(id,'|') within group (order by id) as check_id
            ,listagg(name, '|') within group (order by id) as check_name
        from qz_original_source
      ) src
CROSS JOIN (
      select listagg(id, '|') within group (order by id) as check_id
            ,listagg(name,'|') within group (order by id) as check_name
        from qz_migrated_target
) tgt;

PROMPT 
PROMPT Choice 3 --CORRECT
PROMPT
SELECT CASE src.check_id
       WHEN tgt.check_id THEN 'Identical'
       ELSE 'Diffs'
       END as id
      , CASE src.check_name
        WHEN tgt.check_name then 'Identical'
        ELSE 'Diffs'
       end as name
FROM (select checksum(id) as check_id
            ,checksum(name) as check_name
        from qz_original_source
      ) src
CROSS JOIN (
      select checksum(id) as check_id
            ,checksum(name) as check_name
        from qz_migrated_target
) tgt;

PROMPT 
PROMPT Choice 4 --INCORRECT
PROMPT
SELECT CASE src.check_id
       WHEN tgt.check_id THEN 'Identical'
       ELSE 'Diffs'
       END as id
      , CASE src.check_name
        WHEN tgt.check_name then 'Identical'
        ELSE 'Diffs'
       end as name
FROM (select checksum(id) within group (order by id) as check_id
            ,checksum(name) within group (order by id)  as check_name
        from qz_original_source
      ) src
CROSS JOIN (
      select checksum(id)  within group (order by id) as check_id
            ,checksum(name)  within group (order by id) as check_name
        from qz_migrated_target
) tgt;