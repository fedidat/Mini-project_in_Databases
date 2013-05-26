PL/SQL Developer Test script 3.0
12
declare
  v_custLastName_St VARCHAR2(20);
begin
  --Set first customers's last_name as 'Cohen'
  update customer
  set last_name = 'Cohen'
  where rownum = 1;
  --Get first customers's last_name and print it
  select last_name into v_custLastName_St from customer where rownum = 1;
  DBMS_OUTPUT.put_line('Last name of first customer is: ' || v_custLastName_St);
rollback;
end;
0
0
