-- Creating Package
CREATE OR REPLACE PACKAGE Alumni_Package AS
   PROCEDURE update_graduation_year(
      p_alumni_id NUMBER,
      p_new_graduation_year NUMBER
   );
END;
/

CREATE OR REPLACE PACKAGE BODY Alumni_Package AS
   
   PROCEDURE update_graduation_year(
      p_alumni_id NUMBER,
      p_new_graduation_year NUMBER
   ) AS
      alumni1_count NUMBER;
      alumni2_count NUMBER;
   BEGIN
      -- Check if the alumni exists in alumni_fragment1
      SELECT COUNT(*) INTO alumni1_count
      FROM alumni_fragment1
      WHERE alumni_id = p_alumni_id;

      -- Check if the alumni exists in alumni_fragment2
      SELECT COUNT(*) INTO alumni2_count
      FROM alumni_fragment2 @site_link
      WHERE alumni_id = p_alumni_id;
      
      IF alumni1_count > 0 THEN
         -- Update graduation year in alumni_fragment1
         UPDATE alumni_fragment1
         SET graduation_year = p_new_graduation_year
         WHERE alumni_id = p_alumni_id;
      END IF;
      
      IF alumni2_count > 0 THEN
         -- Update graduation year in alumni_fragment2
         UPDATE alumni_fragment2 @site_link
         SET graduation_year = p_new_graduation_year
         WHERE alumni_id = p_alumni_id;
      END IF;

      COMMIT;

      IF alumni1_count + alumni2_count > 0 THEN
         DBMS_OUTPUT.PUT_LINE('Graduation year updated successfully for Alumni ID: ' || p_alumni_id);
      ELSE
         DBMS_OUTPUT.PUT_LINE('Alumni ID ' || p_alumni_id || ' not found. No update performed.');
      END IF;
   END;
   
END;
/
