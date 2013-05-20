PL/SQL Developer Test script 3.0
16
-- Created on 19/05/2013 by FEDIDAT 
declare 
  -- Local variables here
  cursor c_cust is
    select * from customer;
  r_cust c_cust%ROWTYPE;
begin
  -- Test statements here
  open c_cust;
  loop
    fetch c_cust into r_cust;
    exit when c_cust%NOTFOUND;
    DBMS_OUTPUT.put_line(r_cust.first_name);
  end loop;
  close c_cust;
end;
0
0
