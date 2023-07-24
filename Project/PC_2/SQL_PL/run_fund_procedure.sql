SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
   P_fund_id NUMBER := &P_fund_id;
   P_alumni_id NUMBER := &P_alumni_id;
   P_fund_amount NUMBER := &P_fund_amount;
   P_fund_date DATE := TO_DATE('&P_fund_date', 'YYYY-MM-DD');
   P_fund_purpose VARCHAR2(200) := '&P_fund_purpose';
BEGIN
   -- Call the procedure to insert fund data
   insert_fund_fragment(
      P_fund_id,
      P_alumni_id,
      P_fund_amount,
      P_fund_date,
      P_fund_purpose
   );
END;
/
