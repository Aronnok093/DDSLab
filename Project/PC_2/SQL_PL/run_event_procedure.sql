SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
   P_event_id NUMBER := &P_event_id;
   P_event_name VARCHAR2(100) := '&P_event_name';
   P_event_date DATE := TO_DATE('&P_event_date', 'YYYY-MM-DD');
   P_event_location VARCHAR2(200) := '&P_event_location';
   P_event_description VARCHAR2(500) := '&P_event_description';
BEGIN
   -- Get user input for event data and insert it
   insert_events_fragment(
      P_event_id,
      P_event_name,
      P_event_date,
      P_event_location,
      P_event_description
   );
END;
/
