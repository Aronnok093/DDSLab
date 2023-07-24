-- Calling the procedure using a PL/SQL block
DECLARE
   P_alumni_id NUMBER :=&P_alumni_id; -- Replace 123 with the actual alumni ID you want to update
   P_new_graduation_year NUMBER :=&P_new_graduation_year; -- Replace 2023 with the new graduation year

BEGIN
   Alumni_Package.update_graduation_year(P_alumni_id, P_new_graduation_year);
   DBMS_OUTPUT.PUT_LINE('Procedure called successfully.');
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
      ROLLBACK;
END;
/
