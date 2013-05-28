create or replace procedure updatePropertyPolicy(policy_id_ NUMBER, description_ CLOB, 
  price_ NUMBER, renewal_duration_ NUMBER, property_code_ NUMBER, age_of_property_ NUMBER, property_value_ NUMBER) is
begin
  update policy 
  set description=description_, price=price_, renewal_duration=renewal_duration_ 
  where policy_id=policy_id_; 
  update property 
  set property_code=property_code_, age_of_property=age_of_property_, property_value=property_value_ 
  where policy_id=policy_id_;
end updatePropertyPolicy;
/
