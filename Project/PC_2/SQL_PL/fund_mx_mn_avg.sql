DECLARE
    CURSOR fund_cursor IS
        SELECT alumni_id, fund_amount
        FROM fund_fragment2;
    
    v_alumni_id     NUMBER;
    v_fund_amount   NUMBER;
    v_max_fund      NUMBER := NULL;
    v_min_fund      NUMBER := NULL;
    v_total_fund    NUMBER := 0;
    v_fund_count    NUMBER := 0;
    v_avg_fund      NUMBER := NULL; -- Declare the v_avg_fund variable
BEGIN
    DBMS_OUTPUT.PUT_LINE('Alumni Fund Statistics:');
    DBMS_OUTPUT.PUT_LINE('---------------------------');
    
    OPEN fund_cursor;
    
    LOOP
        FETCH fund_cursor INTO v_alumni_id, v_fund_amount;
        EXIT WHEN fund_cursor%NOTFOUND;
        
        -- Calculate maximum fund amount
        IF v_max_fund IS NULL OR v_fund_amount > v_max_fund THEN
            v_max_fund := v_fund_amount;
        END IF;
        
        -- Calculate minimum fund amount
        IF v_min_fund IS NULL OR v_fund_amount < v_min_fund THEN
            v_min_fund := v_fund_amount;
        END IF;
        
        -- Accumulate total fund amount and count
        v_total_fund := v_total_fund + v_fund_amount;
        v_fund_count := v_fund_count + 1;
    END LOOP;
    
    CLOSE fund_cursor;
    
    -- Calculate average fund amount
    IF v_fund_count > 0 THEN
        v_avg_fund := v_total_fund / v_fund_count;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Maximum Fund Amount: ' || v_max_fund);
    DBMS_OUTPUT.PUT_LINE('Minimum Fund Amount: ' || v_min_fund);
    
    IF v_avg_fund IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Average Fund Amount: ' || v_avg_fund);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No funds available for calculation.');
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
