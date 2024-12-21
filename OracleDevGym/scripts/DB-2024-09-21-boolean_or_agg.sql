set null '--';

-- Question 
with employees (emplee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	##REPLACE##
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
oder by department_name
/
      
PROMPT
PROMPT	Choice 1 --CORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case 
		when not boolean_or_agg(is_participating) then 'None'
		when boolean_and_agg(is_participating) then 'All'
		else 'Some'
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/

PROMPT
PROMPT	Choice 2 --CORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case 
		when not boolean_or_agg(is_participating) and not boolean_and_agg(is_participating) then 'None'
		when boolean_and_agg(is_participating) and boolean_or_agg(is_participating) then 'All'
		else 'Some'
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/

PROMPT
PROMPT	Choice 3 --INCORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case 
		when boolean_or_agg(is_participating) then 'Some'
		when boolean_and_agg(is_participating) then 'All'
		else 'None'
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/

PROMPT
PROMPT	Choice 4 --CORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case 
		when boolean_or_agg(is_participating) and not boolean_and_agg(is_participating) then 'Some'
		when boolean_or_agg(is_participating) and boolean_and_agg(is_participating) then 'All'
		when not boolean_or_agg(is_participating) and not boolean_and_agg(is_participating) then 'None'		
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/

PROMPT
PROMPT	Choice 5 --CORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case 
		when boolean_and_agg(is_participating) then 'All'
		when boolean_or_agg(is_participating) then 'Some'
		else 'None'		
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/

PROMPT
PROMPT	Choice 6 --CORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case 
		when not boolean_or_agg(is_participating) then 'None'
		when not boolean_and_agg(is_participating) then 'Some'
		else 'All'		
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/

PROMPT
PROMPT	Choice 7 --CORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case 
		when min(is_participating) then 'All'
		when max(is_participating) then 'Some'
		else 'None'		
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/

PROMPT
PROMPT	Choice 8 --CORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case 
		when not min(is_participating) then 'Some'
		when not max(is_participating) then 'None'
		else 'All'		
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/

PROMPT
PROMPT	Choice 9 --CORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case 
		when not max(is_participating) then 'None'
		when not min(is_participating) then 'Some'
		else 'All'		
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/

PROMPT
PROMPT	Choice 10  --INCORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case count(is_participating)
		when 0 then 'None'
		when count(*) then 'All'
		else 'Some'
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/

PROMPT
PROMPT	Choice 11  --CORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case count(case is_participating when true then true end)
		when 0 then 'None'
		when count(*) then 'All'
		else 'Some'
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/

PROMPT
PROMPT	Choice 12  --CORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case 
		when not sum(is_participating) then 'None'
		when sum(is_participating) <> count(*) then 'Some'
		else 'All'
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/

PROMPT
PROMPT	Choice 13 --CORRECT
PROMPT
with employees (employee_name, is_participating, department_id) as (
	VALUES
	('Tim',true,1),('Tina',true,1),
	('Joe',true,2),('Jill',false,2),
	('Angie',false,3),('Alex',false,3)
), departments (department_id, department_name) as (
	values
	(1,'Sales'),(2,'IT'),(3,'Shipping')
), base as (
	select d.department_name, e.employee_name, e.is_participating
	from employees e join departments d on e.department_id = d.department_id
)
select 
	department_name
	,case sum(is_participating)
		when 0 then 'None'
		when count(*) then 'All'
		else 'Some'
	 end as participation
	,listagg(case when is_participating then employee_name end, ', ') within group (order by employee_name) as participants
	,listagg(case when not is_participating then employee_name end, ', ') within group (order by employee_name) as non_participants
  from base
group by department_name
order by department_name
/