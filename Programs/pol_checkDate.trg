create or replace trigger pol_checkDate
  before insert or update on customers_policy  
  for each row
declare
  v_error_tx VARCHAR2(2000);
begin
  if :new.start_date > sysdate + 30 then
    v_error_tx := 'policy start date for policy ' || :new.customers_policy_id || ' cannot be later than a month from today!';
    raise_application_error(-20999, v_error_tx);
  end if;
end property_setPrice;
/
