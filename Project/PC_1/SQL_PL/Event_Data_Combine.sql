DECLARE
    CURSOR event1_cursor IS
        SELECT event_id, event_name, event_date, event_location, event_description
        FROM events_fragment1;

    CURSOR event2_cursor IS
        SELECT event_id, event_name, event_date, event_location, event_description
        FROM events_fragment2@site_link;

    v_event_id          NUMBER;
    v_event_name        VARCHAR2(100);
    v_event_date        DATE;
    v_event_location    VARCHAR2(200);
    v_event_description VARCHAR2(500);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Events from Local Server:');
    DBMS_OUTPUT.PUT_LINE('---------------------------');
    
    OPEN event1_cursor;
    LOOP
        FETCH event1_cursor INTO v_event_id, v_event_name, v_event_date, v_event_location, v_event_description;
        EXIT WHEN event1_cursor%NOTFOUND;
        
        -- Print the event details (adjust formatting as needed)
        DBMS_OUTPUT.PUT_LINE('Event ID: ' || v_event_id);
        DBMS_OUTPUT.PUT_LINE('Event Name: ' || v_event_name);
        DBMS_OUTPUT.PUT_LINE('Event Date: ' || TO_CHAR(v_event_date, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Event Location: ' || v_event_location);
        DBMS_OUTPUT.PUT_LINE('Event Description: ' || v_event_description);
        DBMS_OUTPUT.PUT_LINE('---------------------------');
    END LOOP;
    CLOSE event1_cursor;

    DBMS_OUTPUT.PUT_LINE('Events from Remote Server:');
    DBMS_OUTPUT.PUT_LINE('---------------------------');
    
    OPEN event2_cursor;
    LOOP
        FETCH event2_cursor INTO v_event_id, v_event_name, v_event_date, v_event_location, v_event_description;
        EXIT WHEN event2_cursor%NOTFOUND;
        
        -- Print the event details (adjust formatting as needed)
        DBMS_OUTPUT.PUT_LINE('Event ID: ' || v_event_id);
        DBMS_OUTPUT.PUT_LINE('Event Name: ' || v_event_name);
        DBMS_OUTPUT.PUT_LINE('Event Date: ' || TO_CHAR(v_event_date, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Event Location: ' || v_event_location);
        DBMS_OUTPUT.PUT_LINE('Event Description: ' || v_event_description);
        DBMS_OUTPUT.PUT_LINE('---------------------------');
    END LOOP;
    CLOSE event2_cursor;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
