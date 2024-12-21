--Supports JSON sorting also

--Prints 3,2,1
SELECT JSON_TRANSFORM('{"a":[1,2,3,1]}', SORT '$.a' DESC UNIQUE);
--'{"a":[3,2,1]}'

--Prints REVERSE
SELECT JSON_TRANSFORM('{"a":[1,2,3,1]}', SORT '$.a' REVERSE);
--'{"a":[1,3,2,1]}'

--Anytype sort order
SELECT JSON_TRANSFORM('{"a":[3,2,"1",{"b":1},["x","y"]]}', SORT '$.a');
--Prints 
--'{"a":[2,3,"1",{"b":1},["x","y"]]}'