-- Creating Functions
CREATE OR REPLACE FUNCTION calculate_age(birth_date DATE) RETURN NUMBER AS
   age NUMBER;
BEGIN
   age := FLOOR(MONTHS_BETWEEN(SYSDATE, birth_date) / 12);
   RETURN age;
END;
/

CREATE OR REPLACE FUNCTION celsius_to_fahrenheit(celsius NUMBER) RETURN NUMBER AS
   fahrenheit NUMBER;
BEGIN
   fahrenheit := celsius * 9/5 + 32;
   RETURN fahrenheit;
END;
/

-- Creating Procedures
CREATE OR REPLACE PROCEDURE insert_job_opportunity(
   p_job_id NUMBER,
   p_job_title VARCHAR2,
   p_job_description VARCHAR2,
   p_job_location VARCHAR2,
   p_company VARCHAR2,
   p_job_posting_date DATE
) AS
BEGIN
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
END;
/

CREATE OR REPLACE PROCEDURE update_graduation_year(
   p_alumni_id NUMBER,
   p_new_graduation_year NUMBER
) AS
BEGIN
   UPDATE alumni_fragment1
   SET graduation_year = p_new_graduation_year
   WHERE alumni_id = p_alumni_id;
   COMMIT;
END;
/

-- Creating Package
CREATE OR REPLACE PACKAGE Alumni_Package AS
   FUNCTION calculate_age(birth_date DATE) RETURN NUMBER;
   FUNCTION celsius_to_fahrenheit(celsius NUMBER) RETURN NUMBER;
   PROCEDURE insert_job_opportunity(
      p_job_id NUMBER,
      p_job_title VARCHAR2,
      p_job_description VARCHAR2,
      p_job_location VARCHAR2,
      p_company VARCHAR2,
      p_job_posting_date DATE
   );
   PROCEDURE update_graduation_year(
      p_alumni_id NUMBER,
      p_new_graduation_year NUMBER
   );
END;
/

-- Package Body
CREATE OR REPLACE PACKAGE BODY Alumni_Package AS
   FUNCTION calculate_age(birth_date DATE) RETURN NUMBER AS
      age NUMBER;
   BEGIN
      age := FLOOR(MONTHS_BETWEEN(SYSDATE, birth_date) / 12);
      RETURN age;
   END;
   
   FUNCTION celsius_to_fahrenheit(celsius NUMBER) RETURN NUMBER AS
      fahrenheit NUMBER;
   BEGIN
      fahrenheit := celsius * 9/5 + 32;
      RETURN fahrenheit;
   END;

   PROCEDURE insert_job_opportunity(
      p_job_id NUMBER,
      p_job_title VARCHAR2,
      p_job_description VARCHAR2,
      p_job_location VARCHAR2,
      p_company VARCHAR2,
      p_job_posting_date DATE
   ) AS
   BEGIN
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
   END;

   PROCEDURE update_graduation_year(
      p_alumni_id NUMBER,
      p_new_graduation_year NUMBER
   ) AS
   BEGIN
      UPDATE alumni_fragment1
      SET graduation_year = p_new_graduation_year
      WHERE alumni_id = p_alumni_id;
      COMMIT;
   END;
   
END;
/

-- Creating Trigger
CREATE OR REPLACE TRIGGER log_fund_fragment1_changes
AFTER INSERT OR UPDATE ON fund_fragment1
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      DBMS_OUTPUT.PUT_LINE('New donation added: ID=' || :NEW.donation_id || ', Amount=' || :NEW.donation_amount || ', Purpose=' || :NEW.donation_purpose);
   ELSIF UPDATING THEN
      DBMS_OUTPUT.PUT_LINE('Donation updated: ID=' || :NEW.donation_id || ', New Amount=' || :NEW.donation_amount || ', New Purpose=' || :NEW.donation_purpose);
   END IF;
END;
/

-- Enabling DBMS_OUTPUT for display
SET SERVEROUTPUT ON;

-- Usage Example
DECLARE
   age_in_years NUMBER;
   temp_in_fahrenheit NUMBER;
BEGIN
   -- Using functions from the package
   age_in_years := Alumni_Package.calculate_age(TO_DATE('1990-06-15', 'YYYY-MM-DD'));
   DBMS_OUTPUT.PUT_LINE('Age: ' || age_in_years);
   
   temp_in_f
