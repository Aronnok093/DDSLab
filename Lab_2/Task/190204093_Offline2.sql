SET SERVEROUTPUT ON; 
SET VERIFY OFF;
DECLARE
    v_course_name VARCHAR2(30);
    v_enrolled_count NUMBER;
BEGIN
    FOR course_rec IN (SELECT c.cnum, c.cname FROM course c)
    LOOP
        SELECT COUNT(*) INTO v_enrolled_count
        FROM enrolled e
        WHERE e.cnum = course_rec.cnum;

        IF v_enrolled_count >= 5 THEN
            DBMS_OUTPUT.PUT_LINE('Course ' || course_rec.cname || ' is full.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Seats available for course ' || course_rec.cname || '.');
        END IF;
    END LOOP;
END;
/
