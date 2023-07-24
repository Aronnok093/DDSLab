CREATE OR REPLACE PROCEDURE insert_fund_fragment(
   p_fund_id NUMBER,
   p_alumni_id NUMBER,
   p_fund_amount NUMBER,
   p_fund_date DATE,
   p_fund_purpose VARCHAR2
) AS
BEGIN
   -- Insert data into fund_fragment1 table
   INSERT INTO fund_fragment1 (
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
   DBMS_OUTPUT.PUT_LINE('Fund data inserted successfully:Site:-1');
   
    INSERT INTO fund_fragment2 @site_link (
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
   DBMS_OUTPUT.PUT_LINE('Fund data inserted successfully:Site-2');
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
      ROLLBACK;
END;
/
