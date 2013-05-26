create or replace trigger cust_upperLastName
  before insert or update on customer  
  for each row
begin
  --Replace last_name with same string but uppercase characters
  :new.last_name := upper(:new.last_name);
end cust_upperLastName;
/
