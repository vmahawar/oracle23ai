--Automatic Index Maintenance

DROP TABLE IF EXISTS ctx_tab;
CREATE TABLE IF NOT EXISTS ctx_tab(id number, doc varchar2(400));

--Creating a AUTO Index on table ctx_tab
create search index ctx_idx on ctx_tab(doc) PARAMETERS ('MAINTENANCE AUTO');

select  IDX_NAME
       ,IDX_SYNC_TYPE
       ,IDX_MAINTENANCE_TYPE
    from CTX_USER_INDEXES;

--Change it to MANUAL
ALTER INDEX CTX_IDX REBUILD
PARAMETERS('REPLACE METADATA MAINTENANCE MANUAL');

select  IDX_NAME
       ,IDX_SYNC_TYPE
       ,IDX_MAINTENANCE_TYPE
    from CTX_USER_INDEXES;

--Switch it back to AUTO INDEX
ALTER INDEX CTX_IDX REBUILD
PARAMETERS('REPLACE METADATA MAINTENANCE AUTO');    

select  IDX_NAME
       ,IDX_SYNC_TYPE
       ,IDX_MAINTENANCE_TYPE
    from CTX_USER_INDEXES;

--Use package DBMS_AUTO_INDEX package    
--CONFIGURE METHOD
--Lenght of time in days 180 days - when unused auto index kept
--DROP_AUTO_INDEXES - SCHEMA, RECREATION parameter set to TRUE - recreate it in SH schema