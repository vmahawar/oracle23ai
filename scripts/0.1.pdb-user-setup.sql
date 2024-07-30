show pdbs;

select sysdate;

--Create the demo user
create user demo_user identified by password1;

--Assign quota to demo user
alter user demo_user quota UNLIMITED on USERS;

--check for the previlidges
select * from user_sys_privs;

--Grant DB_DEVELOPER_ROLE to demo user
grant DB_DEVELOPER_ROLE TO demo_user;