-- Enabling DBMS_OUTPUT for display
SET SERVEROUTPUT ON; 
SET VERIFY OFF;

-- Menu System
DECLARE
   choice NUMBER;
BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE('Menu:');
      DBMS_OUTPUT.PUT_LINE('1. Insert Alumni');
      DBMS_OUTPUT.PUT_LINE('2. Insert Event');
      DBMS_OUTPUT.PUT_LINE('3. Insert Job Opportunity');
      DBMS_OUTPUT.PUT_LINE('4. Insert Fund');
      DBMS_OUTPUT.PUT_LINE('5. Exit');
      DBMS_OUTPUT.PUT('Enter your choice: ');
      DBMS_INPUT.GET_NUMBER(choice);

      CASE choice
         WHEN 1 THEN
            DECLARE
            
            BEGIN
               insert_alumni_fragment;
            END;
         WHEN 2 THEN
            DECLARE
               
            BEGIN
				insert_events_fragment;
            END;
         WHEN 3 THEN
            DECLARE
              
            BEGIN
               insert_job_opportunity_with_input;
            END;
         WHEN 4 THEN
            DECLARE
              
            BEGIN
              insert_fund_with_input;
            END;
         WHEN 5 THEN
            DBMS_OUTPUT.PUT_LINE('Exiting the menu.');
            EXIT;
         ELSE
            DBMS_OUTPUT.PUT_LINE('Invalid choice. Please try again.');
      END CASE;
   END LOOP;
END;
/
