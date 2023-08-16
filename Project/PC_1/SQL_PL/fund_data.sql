DECLARE
    CURSOR fund_cursor IS
        SELECT fund_id, alumni_id, fund_amount, fund_date, fund_purpose
        FROM fund_fragment1;
    
    v_fund_id       NUMBER;
    v_alumni_id     NUMBER;
    v_fund_amount   NUMBER;
    v_fund_date     DATE;
    v_fund_purpose  VARCHAR2(200);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Fund Details:');
    DBMS_OUTPUT.PUT_LINE('---------------------------');
    
    OPEN fund_cursor;
    
    LOOP
        FETCH fund_cursor INTO v_fund_id, v_alumni_id, v_fund_amount, v_fund_date, v_fund_purpose;
        EXIT WHEN fund_cursor%NOTFOUND;
        
        -- Print the fund details (adjust formatting as needed)
        DBMS_OUTPUT.PUT_LINE('Fund ID: ' || v_fund_id);
        DBMS_OUTPUT.PUT_LINE('Alumni ID: ' || v_alumni_id);
        DBMS_OUTPUT.PUT_LINE('Fund Amount: ' || v_fund_amount);
        DBMS_OUTPUT.PUT_LINE('Fund Date: ' || TO_CHAR(v_fund_date, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Fund Purpose: ' || v_fund_purpose);
        DBMS_OUTPUT.PUT_LINE('---------------------------');
    END LOOP;
    
    CLOSE fund_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
