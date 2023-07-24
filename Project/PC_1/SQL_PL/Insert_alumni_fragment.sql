CREATE OR REPLACE PROCEDURE insert_alumni_fragment1 AS
   p_alumni_id NUMBER;
   p_first_name VARCHAR2(50);
   p_last_name VARCHAR2(50);
   p_graduation_year NUMBER;
   p_email VARCHAR2(100);
   p_phone_number VARCHAR2(20);
   p_address VARCHAR2(200);
   p_department VARCHAR2(100);
   p_job_title VARCHAR2(100);
   p_company VARCHAR2(100);
   p_social_media_handles VARCHAR2(200);
BEGIN
   -- Get user input for alumni data
   DBMS_OUTPUT.PUT('Enter Alumni ID: ');
   DBMS_INPUT.GET_NUMBER(p_alumni_id);

   DBMS_OUTPUT.PUT('Enter First Name: ');
   DBMS_INPUT.GET_LINE(p_first_name);

   DBMS_OUTPUT.PUT('Enter Last Name: ');
   DBMS_INPUT.GET_LINE(p_last_name);

   DBMS_OUTPUT.PUT('Enter Graduation Year: ');
   DBMS_INPUT.GET_NUMBER(p_graduation_year);

   DBMS_OUTPUT.PUT('Enter Email: ');
   DBMS_INPUT.GET_LINE(p_email);

   DBMS_OUTPUT.PUT('Enter Phone Number: ');
   DBMS_INPUT.GET_LINE(p_phone_number);

   DBMS_OUTPUT.PUT('Enter Address: ');
   DBMS_INPUT.GET_LINE(p_address);

   DBMS_OUTPUT.PUT('Enter Department: ');
   DBMS_INPUT.GET_LINE(p_department);

   DBMS_OUTPUT.PUT('Enter Job Title: ');
   DBMS_INPUT.GET_LINE(p_job_title);

   DBMS_OUTPUT.PUT('Enter Company: ');
   DBMS_INPUT.GET_LINE(p_company);

   DBMS_OUTPUT.PUT('Enter Social Media Handles: ');
   DBMS_INPUT.GET_LINE(p_social_media_handles);

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
      DBMS_OUTPUT.PUT_LINE('Alumni data inserted successfully.');
   ELSE
      DBMS_OUTPUT.PUT_LINE('->Site 2:');
	     INSERT INTO alumni_fragment2 @site_link(
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
      DBMS_OUTPUT.PUT_LINE('Alumni data inserted successfully.');
   END IF;
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
      ROLLBACK;
END;
/
