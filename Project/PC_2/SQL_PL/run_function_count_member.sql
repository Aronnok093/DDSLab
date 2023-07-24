SET SERVEROUTPUT ON;

DECLARE
   total_alumni_count NUMBER;
BEGIN
   total_alumni_count := get_total_alumni_count;
   DBMS_OUTPUT.PUT_LINE('Total number of alumni in both fragments: ' || total_alumni_count);
END;
/