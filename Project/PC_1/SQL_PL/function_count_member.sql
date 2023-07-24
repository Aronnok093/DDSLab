CREATE OR REPLACE FUNCTION get_alumni_fragment1_count RETURN NUMBER AS
   alumni_count NUMBER;
BEGIN
   SELECT COUNT(*) INTO alumni_count FROM alumni_fragment1;
   RETURN alumni_count;
END;
/

CREATE OR REPLACE FUNCTION get_alumni_fragment2_count RETURN NUMBER AS
   alumni_count NUMBER;
BEGIN
   SELECT COUNT(*) INTO alumni_count FROM alumni_fragment2 @site_link;
   RETURN alumni_count;
END;
/

CREATE OR REPLACE FUNCTION get_total_alumni_count RETURN NUMBER AS
   total_count NUMBER;
BEGIN
   total_count := get_alumni_fragment1_count() + get_alumni_fragment2_count();
   RETURN total_count;
END;
/
