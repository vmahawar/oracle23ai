--select rawtohex() as unique_id;

--option 1: --ERROR
select rawtohex(dbms_crypto.randomUUID()) as unique_id;

--option 2: --Correct
select rawtohex(sys_guid()) as unique_id; --'209D3F61A8B2D95EE0636B5C000A586C'

--option 3: --Error
select rawtohex(sys_guid('UUID')) as unique_id;

--option 4: --Error
select rawtohex(json_id()) as unique_id;

--option 5: --Correct
select rawtohex(json_id('OID')) as unique_id; --'66CCEA8761046CD95E61A8B1'

--option 6: --Correct
select rawtohex(json_id('UUID')) as unique_id; --'29A064022F5F4F26BF9CBC12AE3664B3'

--option 7: --Error
select rawtohex(json_id('GUID')) as unique_id; 