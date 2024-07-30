--Below script needs to be executed using DBA

SET ECHO ON;
SET FEEDBACK ON;
SET TERM ON;
SET PAGESIZE 100;

COLUMN GRANTEE FORMAT a25;
COLUMN GRANTED_ROLE FORMAT a25;

select grantee,granted_role from dba_role_privs
where grantee = 'DEMO_USER';

GRANT DB_DEVELOPER_ROLE TO DEMO_USER;

select grantee,granted_role from dba_role_privs
where grantee = 'DEMO_USER';

REVOKE DB_DEVELOPER_ROLE FROM DEMO_USER;

select grantee,granted_role from dba_role_privs
where grantee = 'DEMO_USER';

select grantee,'ROLE' as TYPE,granted_role as NAME from dba_role_privs
where grantee IN ('DB_DEVELOPER_ROLE')
UNION ALL
select grantee,'PRIVILEGE' as TYPE, PRIVILEGE as NAME from dba_sys_privs
where grantee='DB_DEVELOPER_ROLE';