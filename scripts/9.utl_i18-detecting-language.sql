PROMPT 
PROMPT Detecting Language 
PROMPT 

-- Declare variables and types
DECLARE
    -- Text to be analyzed for language detection
    v_text VARCHAR2(4000) := 'यह जीवन बहुत ही असामान्य और अद्भुत होता है। हर दिन एक नई कहानी, एक नई यात्रा और एक नया अनुभव लेकर आता है।';
    -- In English this translates to - "Life is very unusual and wonderful. Every day brings a new story, a new journey, and a new experience."
    
    -- Table to hold detected languages and their scores
    v_languages utl_i18n.language_result_table;
    
    -- Cursor to hold the results from the query
    cur_result SYS_REFCURSOR;
    
    -- Record type to store language and score
    TYPE language_score_record IS RECORD (
        language VARCHAR2(30),
        score NUMBER
    );
    
    -- Variable of the custom record type to fetch cursor results
    v_result language_score_record;
    
    -- Variable to hold translated text (not used in current implementation)
    v_english_text VARCHAR2(4000);
    
    -- Constant number to specify the number of language results
    v_number CONSTANT NUMBER := 5;

BEGIN
    -- Output the source text
    DBMS_OUTPUT.PUT_LINE('Source Language Text: ' || v_text);
    
    -- Detect language of the source text
    utl_i18n.detect_language(result => v_languages, src => v_text, num_results => v_number);    
    
    -- Open the cursor to fetch language detection results
    OPEN cur_result FOR SELECT language, score FROM TABLE(v_languages);
    
    -- Loop through the cursor to print each detected language and score
    LOOP
        FETCH cur_result INTO v_result;
        EXIT WHEN cur_result%NOTFOUND;  -- Exit the loop when no more records are found
        DBMS_OUTPUT.PUT_LINE(v_result.language || ' ' || v_result.score);  -- Output language and score
    END LOOP;
    
    -- Close the cursor
    CLOSE cur_result;
END;
/