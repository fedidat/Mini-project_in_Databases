create or replace procedure insertPropertyPolicy(policy_id_ NUMBER, description_ CLOB,
  price_ NUMBER, renewal_duration_ NUMBER, property_code_ NUMBER, age_of_property_ NUMBER, property_value_ NUMBER) is
begin
  insert into policy (policy_id, description, price, renewal_duration) 
  values (policy_id_, description_, price_, renewal_duration_); 
  insert into property (policy_id, property_code, age_of_property, property_value) 
  values (policy_id_, property_code_, age_of_property_, property_value_);
end insertPropertyPolicy;
/
