DECLARE
   

   -- Cursor for fetching data from alumni_fragment2
   CURSOR c_alumni_fragment2 IS
      SELECT alumni_id, first_name, last_name, graduation_year
      FROM alumni_fragment2;

   -- Variables to hold fetched data
   v_alumni_id NUMBER;
   v_first_name VARCHAR2(50);
   v_last_name VARCHAR2(50);
   v_graduation_year NUMBER;
BEGIN

   -- Fetch and print data from alumni_fragment2
   OPEN c_alumni_fragment2;
   LOOP
      FETCH c_alumni_fragment2 INTO v_alumni_id, v_first_name, v_last_name, v_graduation_year;
      EXIT WHEN c_alumni_fragment2%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('Alumni ID: ' || v_alumni_id || ', Name: ' || v_first_name || ' ' || v_last_name || ', Graduation Year: ' || v_graduation_year);
   END LOOP;
   CLOSE c_alumni_fragment2;
END;
/
