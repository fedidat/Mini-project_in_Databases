PL/SQL Developer Test script 3.0
22
-- Created on 19/05/2013 by FEDIDAT 
declare 
  -- Local variables here
  v_price NUMBER;
  v_renewal_duration NUMBER;
  v_pol_price NUMBER;
begin
  -- Test statements here
  --select policy_id into v_out from policy where rownum = 1;
  --DBMS_OUTPUT.put_line(v_out);
  insert into policy (policy_id, price, renewal_duration)
  values (40, 100, 12);
  select price into v_price from policy where policy_id = 40;
  DBMS_OUTPUT.put_line(v_price);
  select renewal_duration into v_renewal_duration from policy where policy_id = 40;
  DBMS_OUTPUT.put_line(v_renewal_duration);
  insert into property (policy_id, property_code, age_of_property, property_value)
  values (40, 3, 20, 100000);
  select price into v_pol_price from policy where policy_id = 40;
  DBMS_OUTPUT.put_line(v_pol_price);
rollback;
end;
2
v_price
0
-3
v_renewal_duration
0
-3
0
