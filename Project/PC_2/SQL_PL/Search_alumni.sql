-- Accept user input for graduation_year
ACCEPT user_graduation_year PROMPT 'Enter the graduation_year: '

-- Search for alumni by graduation_year in alumni_fragment2 table
DECLARE
    v_user_graduation_year NUMBER;
BEGIN
    v_user_graduation_year := &user_graduation_year;
    
    -- Search for alumni by graduation_year in the local alumni_fragment2 table
    FOR alumni_row IN (SELECT * FROM alumni_fragment1@site_link WHERE graduation_year = v_user_graduation_year) LOOP
        DBMS_OUTPUT.PUT_LINE('Alumni Info (Remote Table): ' || alumni_row.alumni_id || ', ' || alumni_row.first_name || ', ' || alumni_row.last_name);
    END LOOP;

    -- Search for alumni by graduation_year in the remote alumni_fragment2 table
    FOR alumni_row IN (SELECT * FROM alumni_fragment2 WHERE graduation_year = v_user_graduation_year) LOOP
        DBMS_OUTPUT.PUT_LINE('Alumni Info (Local Table): ' || alumni_row.alumni_id || ', ' || alumni_row.first_name || ', ' || alumni_row.last_name);
    END LOOP;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Alumni not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
