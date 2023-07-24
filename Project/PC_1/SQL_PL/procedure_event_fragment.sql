CREATE OR REPLACE PROCEDURE insert_events_fragment1(
   p_event_id NUMBER,
   p_event_name VARCHAR2,
   p_event_date DATE,
   p_event_location VARCHAR2,
   p_event_description VARCHAR2
) AS
BEGIN
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
      DBMS_OUTPUT.PUT_LINE('Event data inserted successfully:Site-1');
   ELSE
	  INSERT INTO events_fragment2 @site_link (
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
      DBMS_OUTPUT.PUT_LINE('Event data inserted successfully:Site-2');
   END IF;
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
      ROLLBACK;
END;
/
