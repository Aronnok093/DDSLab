SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- Menu System
DECLARE
   P_alumni_id NUMBER := &p_alumni_id;
   P_first_name VARCHAR2(50) := '&p_first_name';
   P_last_name VARCHAR2(50) := '&p_last_name';
   P_graduation_year NUMBER := &p_graduation_year;
   P_email VARCHAR2(100) := '&p_email';
   P_phone_number VARCHAR2(20) := '&p_phone_number';
   P_address VARCHAR2(200) := '&p_address';
   P_department VARCHAR2(100) := '&p_department';
   P_job_title VARCHAR2(100) := '&p_job_title';
   P_company VARCHAR2(100) := '&p_company';
   P_social_media_handles VARCHAR2(200) := '&p_social_media_handles';
BEGIN
   -- Get user input for alumni data
   insert_alumni_fragment1(
      P_alumni_id,
      P_first_name,
      P_last_name,
      P_graduation_year,
      P_email,
      P_phone_number,
      P_address,
      P_department,
      P_job_title,
      P_company,
      P_social_media_handles
   );
END;
/
