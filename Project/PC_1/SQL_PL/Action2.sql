-- Enabling DBMS_OUTPUT for display
SET SERVEROUTPUT ON;

-- Menu System
DECLARE
   choice NUMBER;
BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE('Menu:');
      DBMS_OUTPUT.PUT_LINE('1. Calculate Age');
      DBMS_OUTPUT.PUT_LINE('2. Convert Celsius to Fahrenheit');
      DBMS_OUTPUT.PUT_LINE('3. Insert Job Opportunity');
      DBMS_OUTPUT.PUT_LINE('4. Update Graduation Year');
      DBMS_OUTPUT.PUT_LINE('5. Log Fund Fragment1 Changes');
      DBMS_OUTPUT.PUT_LINE('6. Exit');
      DBMS_OUTPUT.PUT('Enter your choice: ');
      DBMS_INPUT.GET_NUMBER(choice);

      CASE choice
         WHEN 1 THEN
            DECLARE
               birth_date DATE;
               age_in_years NUMBER;
            BEGIN
               DBMS_OUTPUT.PUT('Enter birth date (YYYY-MM-DD): ');
               DBMS_INPUT.GET_DATE(birth_date);
               age_in_years := Alumni_Package.calculate_age(birth_date);
               DBMS_OUTPUT.PUT_LINE('Age: ' || age_in_years);
            END;
         WHEN 2 THEN
            DECLARE
               celsius_temp NUMBER;
               fahrenheit_temp NUMBER;
            BEGIN
               DBMS_OUTPUT.PUT('Enter temperature in Celsius: ');
               DBMS_INPUT.GET_NUMBER(celsius_temp);
               fahrenheit_temp := Alumni_Package.celsius_to_fahrenheit(celsius_temp);
               DBMS_OUTPUT.PUT_LINE('Temperature in Fahrenheit: ' || fahrenheit_temp);
            END;
         WHEN 3 THEN
            DECLARE
               job_id NUMBER;
               job_title VARCHAR2(100);
               job_description VARCHAR2(500);
               job_location VARCHAR2(200);
               company VARCHAR2(100);
               job_posting_date DATE;
            BEGIN
               DBMS_OUTPUT.PUT('Enter Job ID: ');
               DBMS_INPUT.GET_NUMBER(job_id);
               DBMS_OUTPUT.PUT('Enter Job Title: ');
               DBMS_INPUT.GET_LINE(job_title);
               DBMS_OUTPUT.PUT('Enter Job Description: ');
               DBMS_INPUT.GET_LINE(job_description);
               DBMS_OUTPUT.PUT('Enter Job Location: ');
               DBMS_INPUT.GET_LINE(job_location);
               DBMS_OUTPUT.PUT('Enter Company: ');
               DBMS_INPUT.GET_LINE(company);
               DBMS_OUTPUT.PUT('Enter Job Posting Date (YYYY-MM-DD): ');
               DBMS_INPUT.GET_DATE(job_posting_date);
               Alumni_Package.insert_job_opportunity(job_id, job_title, job_description, job_location, company, job_posting_date);
               DBMS_OUTPUT.PUT_LINE('Job opportunity inserted successfully.');
            END;
         WHEN 4 THEN
            DECLARE
               alumni_id NUMBER;
               new_graduation_year NUMBER;
            BEGIN
               DBMS_OUTPUT.PUT('Enter Alumni ID: ');
               DBMS_INPUT.GET_NUMBER(alumni_id);
               DBMS_OUTPUT.PUT('Enter New Graduation Year: ');
               DBMS_INPUT.GET_NUMBER(new_graduation_year);
               Alumni_Package.update_graduation_year(alumni_id, new_graduation_year);
               DBMS_OUTPUT.PUT_LINE('Graduation year updated successfully.');
            END;
         WHEN 5 THEN
            DBMS_OUTPUT.PUT_LINE('Trigger will log Fund Fragment1 changes automatically.');
         WHEN 6 THEN
            DBMS_OUTPUT.PUT_LINE('Exiting the menu.');
            EXIT;
         ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid choice. Please try again.');
      END CASE;
   END LOOP;
END;
/
