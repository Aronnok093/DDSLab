-- Creating Procedure
SET SERVEROUTPUT ON; 
SET VERIFY OFF;
CREATE OR REPLACE PROCEDURE insert_alumni_fragment(
   p_alumni_id NUMBER,
   p_first_name VARCHAR2,
   p_last_name VARCHAR2,
   p_graduation_year NUMBER,
   p_email VARCHAR2,
   p_phone_number VARCHAR2,
   p_address VARCHAR2,
   p_department VARCHAR2,
   p_job_title VARCHAR2,
   p_company VARCHAR2,
   p_social_media_handles VARCHAR2
) AS
BEGIN
   IF p_graduation_year <= 2015 THEN
      INSERT INTO alumni_fragment1 (
         alumni_id,
         first_name,
         last_name,
         graduation_year,
         email,
         phone_number,
         address,
         department,
         job_title,
         company,
         social_media_handles
      ) VALUES (
         p_alumni_id,
         p_first_name,
         p_last_name,
         p_graduation_year,
         p_email,
         p_phone_number,
         p_address,
         p_department,
         p_job_title,
         p_company,
         p_social_media_handles
      );
      COMMIT;
      DBMS_OUTPUT.PUT_LINE('Alumni data inserted successfully. Site 1');
   ELSE
	  INSERT INTO alumni_fragment2 @site_link (
         alumni_id,
         first_name,
         last_name,
         graduation_year,
         email,
         phone_number,
         address,
         department,
         job_title,
         company,
         social_media_handles
      ) VALUES (p_alumni_id,
         p_first_name,
         p_last_name,
         p_graduation_year,
         p_email,
         p_phone_number,
         p_address,
         p_department,
         p_job_title,
         p_company,
         p_social_media_handles);
      COMMIT;
      DBMS_OUTPUT.PUT_LINE('Alumni data inserted successfully. Site 2');
   END IF;
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
      ROLLBACK;
END;
/
