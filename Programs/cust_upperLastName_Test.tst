PL/SQL Developer Test script 3.0
12
declare
  v_firstCustID_Nr NUMBER;
  v_custLastName_St VARCHAR2(20);
begin
  select customer_id into v_firstCustID_Nr from customer where rownum = 1;
  update customer
  set last_name = 'Cohen'
  where customer_id = v_firstCustID_Nr;
  select last_name into v_custLastName_St from customer where customer_id = v_firstCustID_Nr;
  DBMS_OUTPUT.put_line('Last name of first customer is: ' || v_custLastName_St);
rollback;
end;
0
0
