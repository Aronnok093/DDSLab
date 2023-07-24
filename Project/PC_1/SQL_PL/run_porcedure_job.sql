SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
   P_job_id NUMBER := &P_job_id;
   P_job_title VARCHAR2(100) := '&P_job_title';
   P_job_description VARCHAR2(500) := '&P_job_description';
   P_job_location VARCHAR2(200) := '&P_job_location';
   P_company VARCHAR2(100) := '&P_company';
   P_job_posting_date DATE := TO_DATE('&P_job_posting_date', 'YYYY-MM-DD');
BEGIN
   -- Call the procedure to insert job opportunity data
   insert_job_opportunity(
      P_job_id,
      P_job_title,
      P_job_description,
      P_job_location,
      P_company,
      TO_DATE(P_job_posting_date, 'YYYY-MM-DD')
   );
END;
/
