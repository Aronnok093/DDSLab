CREATE OR REPLACE PROCEDURE insert_fund_with_input AS
   p_fund_id NUMBER;
   p_alumni_id NUMBER;
   p_fund_amount NUMBER;
   p_fund_date DATE;
   p_fund_purpose VARCHAR2(200);
BEGIN
   -- Get user input for fund details
   DBMS_OUTPUT.PUT('Enter Fund ID: ');
   DBMS_INPUT.GET_NUMBER(p_fund_id);

   DBMS_OUTPUT.PUT('Enter Alumni ID: ');
   DBMS_INPUT.GET_NUMBER(p_alumni_id);

   DBMS_OUTPUT.PUT('Enter Fund Amount: ');
   DBMS_INPUT.GET_NUMBER(p_fund_amount);

   DBMS_OUTPUT.PUT('Enter Fund Date (YYYY-MM-DD): ');
   DBMS_INPUT.GET_DATE(p_fund_date);

   DBMS_OUTPUT.PUT('Enter Fund Purpose: ');
   DBMS_INPUT.GET_LINE(p_fund_purpose);

   -- Insert data into fund_fragment1 table
   INSERT INTO fund_fragment2(
		fund_id,
		alumni_id,
		fund_amount,
		fund_date,
		fund_purpose
   ) VALUES (
      p_fund_id,
      p_alumni_id,
      p_fund_amount,
      p_fund_date,
      p_fund_purpose
   );

   COMMIT;
   DBMS_OUTPUT.PUT_LINE('Fund data inserted successfully.');
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
      ROLLBACK;
END;
/
