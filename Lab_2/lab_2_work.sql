SET SERVEROUTPUT ON; 
SET VERIFY OFF;
--print hellow world 
BEGIN
	DBMS_OUTPUT.PUT_LINE('HELLOW WORLD');

END;
/
BEGIN
	DBMS_OUTPUT.PUT_LINE('MY NAME IS KHAN');

END;
/

BEGIN
	INSERT INTO money VALUES(4,'U',1234);
END;
/
COMMIT;
--Bonus Mark
DECLARE
	name_new money.name%TYPE;
	id_new money.id%TYPE;
	taka_new money.taka%TYPE;
BEGIN
	name_new:='fardin';
	UPDATE money
	SET name = name_new
	WHERE id=1;
	SELECT name,id,taka INTO name_new,id_new,taka_new FROM money where id = 1;
	DBMS_OUTPUT.PUT_LINE(name_new);
	DBMS_OUTPUT.PUT_LINE(id_new);
	DBMS_OUTPUT.PUT_LINE(taka_new);
	
END;
/
--Bonus Mark
DECLARE
	num NUMBER := 7;
	name_new money.name%TYPE;
	id_new money.id%TYPE;
	taka_new money.taka%TYPE;  
BEGIN
  SELECT name,id,taka INTO name_new,id_new,taka_new FROM money where id = 1;
  IF MOD(taka_new, 3) = 0 THEN
    DBMS_OUTPUT.PUT_LINE('zero');
  ELSIF MOD(NUM,3)= 1 THEN
    DBMS_OUTPUT.PUT_LINE('ONE');
  ELSE
	DBMS_OUTPUT.PUT_LINE('TWO');
  END IF;
END;
/
--loop
DECLARE
  counter NUMBER := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE('Counter: ' || counter);
    counter := counter + 1;
    EXIT WHEN counter > 5;
  END LOOP;
END;
/
--for loop
BEGIN
FOR i IN 1..5 LOOP
  DBMS_OUTPUT.PUT_LINE('Iteration: ' || i);
END LOOP;

END;
/
--USER INPUT SAMPLE
DECLARE

A number := &x;
B number := &y;
C number := 0;

BEGIN

C := A+B;
DBMS_OUTPUT.PUT_LINE(C);

END;
/
--TASK-1
DECLARE
  A money.taka%TYPE;
  B money.taka%TYPE;
  C money.taka%TYPE;
BEGIN
  
  A := &Enter_Value_for_A;
  B := &Enter_Value_for_B;
  

  C := A + B;
  

  IF C < 170 THEN
    INSERT INTO money (id, name, taka)
    VALUES (7, 'A', C + 10);
  ELSIF C BETWEEN 170 AND 210 THEN
    INSERT INTO money (id, name, taka)
    VALUES (7, 'B', C + 30);
  ELSE
    INSERT INTO money (id, name, taka)
    VALUES (7, 'C', C);
  END IF;
  
  
  COMMIT;
  

  DBMS_OUTPUT.PUT_LINE('New row inserted successfully.');
  
EXCEPTION
  WHEN OTHERS THEN
   
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    ROLLBACK;
END;
/
--TASK 2
/*
DECLARE
  A money.id%TYPE;
  B money.name%TYPE;
  C money.taka%TYPE;
BEGIN
 
  A := &Enter_Value_for_A;
  B := '&Enter_Value_for_B';
  C := &Enter_Value_for_C;
  

  FOR i IN 1..5 LOOP
    INSERT INTO money (id, name, taka)
    VALUES (A + i, B, C);
  END LOOP;
  
 
  COMMIT;
  

  DBMS_OUTPUT.PUT_LINE('Rows inserted successfully.');
  
EXCEPTION
  WHEN OTHERS THEN
   
    DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
    ROLLBACK;
END;
/
*/