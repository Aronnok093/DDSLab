CREATE OR REPLACE PROCEDURE insert_events_fragment1 AS
   p_event_id NUMBER;
   p_event_name VARCHAR2(100);
   p_event_date DATE;
   p_event_location VARCHAR2(200);
   p_event_description VARCHAR2(500);
BEGIN
   -- Get user input for event details
   DBMS_OUTPUT.PUT('Enter Event ID: ');
   DBMS_INPUT.GET_NUMBER(p_event_id);
   
   DBMS_OUTPUT.PUT('Enter Event Name: ');
   DBMS_INPUT.GET_LINE(p_event_name);
   
   DBMS_OUTPUT.PUT('Enter Event Date (YYYY-MM-DD): ');
   DBMS_INPUT.GET_DATE(p_event_date);
   
   DBMS_OUTPUT.PUT('Enter Event Location: ');
   DBMS_INPUT.GET_LINE(p_event_location);
   
   DBMS_OUTPUT.PUT('Enter Event Description: ');
   DBMS_INPUT.GET_LINE(p_event_description);

   IF p_event_date <= TO_DATE('2022-01-01', 'YYYY-MM-DD') THEN
      INSERT INTO events_fragment1 (
         event_id,
         event_name,
         event_date,
         event_location,
         event_description
      ) VALUES (
         p_event_id,
         p_event_name,
         p_event_date,
         p_event_location,
         p_event_description
      );
      COMMIT;
      DBMS_OUTPUT.PUT_LINE('Event data inserted successfully.');
   ELSE
      DBMS_OUTPUT.PUT_LINE('->Site 2');
	     INSERT INTO events_fragment2 @site_link(
         event_id,
         event_name,
         event_date,
         event_location,
         event_description
      ) VALUES (
         p_event_id,
         p_event_name,
         p_event_date,
         p_event_location,
         p_event_description
      );
      COMMIT;
      DBMS_OUTPUT.PUT_LINE('Event data inserted successfully.');
   END IF;
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
      ROLLBACK;
END;
/
