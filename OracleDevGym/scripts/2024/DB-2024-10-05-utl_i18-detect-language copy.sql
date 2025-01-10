var qz_cur refcursor;

var qz_text varchar2(4000);

begin
	:qz_text := 'Der var dejlight ude ; det var sommer, kornet stod gult, havren, Rundt om ager og eng var der store stove, og midt i skovene dybe';
	DBMS_OUTPUT.PUT_LINE(:qz_text);
end;
/

PROMPT 
PROMPT	Choice 1 --INCORRECT
PROMPT 
declare
	qz_languages utl_i18n.language_result_table;
begin	
	DBMS_OUTPUT.PUT_LINE(:qz_text);
	utl_i18n.detect_language(result => qz_languages, src => :qz_text);
	open :qz_cur for select language, score from table(qz_languages);
end;	
/

print qz_cur;

PROMPT 
PROMPT	Choice 2
PROMPT 
declare
	qz_languages utl_i18n.language_result_table;
begin	
	utl_i18n.detect_language(result => qz_languages, src => :qz_text);

	if qz_languages.count > 5 then
		qz_languages.trim(qz_languages.count - 5);
	end if;

	open :qz_cur for select language, score from table(qz_languages);
end;
/

print qz_cur;

PROMPT 
PROMPT	Choice 3
PROMPT 
declare
	qz_languages utl_i18n.language_result_table;
begin	
	DBMS_OUTPUT.PUT_LINE(:qz_text);
	utl_i18n.detect_language(result => qz_languages, src => :qz_text);

	qz_languages.delete(6,qz_languages.count);

	open :qz_cur for select language, score from table(qz_languages);	
	
end;	
/

print qz_cur;

PROMPT 
PROMPT	Choice 4  --CORRECT
PROMPT 
declare
	qz_languages utl_i18n.language_result_table;
begin	
	DBMS_OUTPUT.PUT_LINE(:qz_text);
	utl_i18n.detect_language(result => qz_languages, src => :qz_text);

	open :qz_cur for select * from (select language, score from table(qz_languages)) where rownum <= 5;
	
end;	
/

print qz_cur;

PROMPT 
PROMPT	Choice 5
PROMPT 
declare
	qz_languages utl_i18n.language_result_table;
begin	
	DBMS_OUTPUT.PUT_LINE(:qz_text);
	utl_i18n.detect_language(result => qz_languages, src => :qz_text, num_results => 5);

	open :qz_cur for select language, score from table(qz_languages);
	
end;	
/

print qz_cur;