create or replace procedure updateLifePolicy(policy_id_ NUMBER, description_ CLOB, 
  price_ NUMBER, renewal_duration_ NUMBER, occupation_code_ NUMBER, danger_indicator_ NUMBER) is
begin
  update policy 
  set description=description_, price=price_, renewal_duration=renewal_duration_ 
  where policy_id=policy_id_; 
  update life 
  set occupation_code=occupation_code_, danger_indicator=danger_indicator_
  where policy_id=policy_id_;
end updateLifePolicy;
/
