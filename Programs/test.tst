PL/SQL Developer Test script 3.0
12
-- Created on 07/05/2013 by FEDIDAT 
declare 
  -- Local variables here
  v_custname_tx VARCHAR2(256);
begin
  -- Test statements here
  select first_Name
  into v_custname_tx
  from customer
  where rownum=1;
  dbms_output.put_line(v_custname_tx);
end;
0
0
