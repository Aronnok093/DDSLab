CREATE OR REPLACE PROCEDURE insert_job_opportunity(
   p_job_id NUMBER,
   p_job_title VARCHAR2,
   p_job_description VARCHAR2,
   p_job_location VARCHAR2,
   p_company VARCHAR2,
   p_job_posting_date DATE
) AS
BEGIN
   -- Insert data into job_opportunities1 table
   INSERT INTO job_opportunities1 @site_link (
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
   DBMS_OUTPUT.PUT_LINE('Job opportunity inserted successfully:Site-1');
   INSERT INTO job_opportunities2  (
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
   DBMS_OUTPUT.PUT_LINE('Job opportunity inserted successfully:Site-2');
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
      ROLLBACK;
END;
/
