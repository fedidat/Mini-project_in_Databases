create or replace procedure insertLifePolicy(policy_id_ NUMBER, description_ CLOB,
  price_ NUMBER, renewal_duration_ NUMBER, occupation_code_ NUMBER, danger_indicator_ FLOAT) is
begin
  insert into policy (policy_id, description, price, renewal_duration) 
  values (policy_id_, description_, price_, renewal_duration_); 
  insert into life (policy_id, occupation_code, danger_indicator) 
  values (policy_id_, occupation_code_, danger_indicator_);
end insertLifePolicy;
/
