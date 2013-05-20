create or replace trigger cust_upperLastName
  before insert or update on customer  
  for each row
begin
  :new.last_name := upper(:new.last_name);
  DBMS_OUTPUT.put_line('Last name of first customer is:');
end cust_upperLastName;
/
