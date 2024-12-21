--TIMESTAMP WITH TIMEZONE during upgrade
--OFFLINE
--ONLINE

--
--Enhanced Timezone and Data Change
--


select sysdate;

select systimestamp;

--System time now can be set the local time zone of an individual database;
--Database time vs OS System Time;
--Application Time and Database Time needs to be same to get desirable results in applications.

--Before 23ai
ALTER DATABASE SET TIME_ZONE = '-05:00';

--In 23ai
ALTER SYSTEM SET CURRENT_TIME_AT_DBTIMEZONE = TRUE;



