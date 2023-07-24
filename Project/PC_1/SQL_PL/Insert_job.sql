CREATE OR REPLACE PROCEDURE insert_job_opportunity_with_input AS
   p_job_id NUMBER;
   p_job_title VARCHAR2(100);
   p_job_description VARCHAR2(500);
   p_job_location VARCHAR2(200);
   p_company VARCHAR2(100);
   p_job_posting_date DATE;
BEGIN
   -- Get user input for job details
   DBMS_OUTPUT.PUT('Enter Job ID: ');
   DBMS_INPUT.GET_NUMBER(p_job_id);

   DBMS_OUTPUT.PUT('Enter Job Title: ');
   DBMS_INPUT.GET_LINE(p_job_title);

   DBMS_OUTPUT.PUT('Enter Job Description: ');
   DBMS_INPUT.GET_LINE(p_job_description);

   DBMS_OUTPUT.PUT('Enter Job Location: ');
   DBMS_INPUT.GET_LINE(p_job_location);

   DBMS_OUTPUT.PUT('Enter Company: ');
   DBMS_INPUT.GET_LINE(p_company);

   DBMS_OUTPUT.PUT('Enter Job Posting Date (YYYY-MM-DD): ');
   DBMS_INPUT.GET_DATE(p_job_posting_date);

   -- Insert data into job_opportunities1 table
   INSERT INTO job_opportunities1 (
      job_id,
      job_title,
      job_description,
      job_location,
      company,
      job_posting_date
   ) VALUES (
      p_job_id,
      p_job_title,
      p_job_description,
      p_job_location,
      p_company,
      p_job_posting_date
   );

   COMMIT;
   DBMS_OUTPUT.PUT_LINE('Job opportunity inserted successfully.');
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
      ROLLBACK;
END;
/
