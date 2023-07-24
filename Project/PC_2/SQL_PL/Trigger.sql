SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- Trigger for alumni_fragment1 table
CREATE OR REPLACE TRIGGER alumni_fragment1_trig
AFTER INSERT ON alumni_fragment2
FOR EACH ROW
BEGIN
   DBMS_OUTPUT.PUT_LINE('New Alumni Added To Local Server');
END;
/


