create table qz_attendees(
    id integer primary KEY,
    name varchar2(20),
    is_speaker boolean not null
);


insert into qz_attendees VALUES
 (40,'Adam Appleby',false)
,(41,'Bill Bowman',false)
,(42,'Cindy Caston',true)
,(43,'Diana Dalway',true)
;

commit;

--option 1--
select name
from qz_attendees
where is_speaker
order by id;

--option 2--
select name
from qz_attendees
where is_speaker is true
order by id;

--option 3--
select name
from qz_attendees
where is_speaker = true
order by id;

--option 4--
select name
from qz_attendees
where is_speaker > 0
order by id;

--option 5--
select name
from qz_attendees
where is_speaker = '1'
order by id;

--option 6--
select name
from qz_attendees
where is_speaker = 42
order by id;

--option 7--
select name
from qz_attendees
where is_speaker = 'on'
order by id;

--option 8--
select name
from qz_attendees
where least(is_speaker,'TRUE')
order by id;

--option 9--
select name
from qz_attendees
where is_speaker = to_boolean('Yes')
order by id;

