DECLARE
    CURSOR job_cursor IS
        SELECT job_id, job_title, job_description, job_location, company, job_posting_date
        FROM job_opportunities2;
    
    v_job_id           NUMBER;
    v_job_title        VARCHAR2(100);
    v_job_description  VARCHAR2(500);
    v_job_location     VARCHAR2(200);
    v_company          VARCHAR2(100);
    v_job_posting_date DATE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Job Opportunities:');
    DBMS_OUTPUT.PUT_LINE('---------------------------');
    
    OPEN job_cursor;
    
    LOOP
        FETCH job_cursor INTO v_job_id, v_job_title, v_job_description, v_job_location, v_company, v_job_posting_date;
        EXIT WHEN job_cursor%NOTFOUND;
        
        -- Print the job details (adjust formatting as needed)
        DBMS_OUTPUT.PUT_LINE('Job ID: ' || v_job_id);
        DBMS_OUTPUT.PUT_LINE('Job Title: ' || v_job_title);
        DBMS_OUTPUT.PUT_LINE('Job Description: ' || v_job_description);
        DBMS_OUTPUT.PUT_LINE('Job Location: ' || v_job_location);
        DBMS_OUTPUT.PUT_LINE('Company: ' || v_company);
        DBMS_OUTPUT.PUT_LINE('Job Posting Date: ' || TO_CHAR(v_job_posting_date, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('---------------------------');
    END LOOP;
    
    CLOSE job_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
