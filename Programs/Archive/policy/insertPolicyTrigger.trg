create or replace trigger prop_setPrice
  after insert on property  
  for each row
declare
  -- local variables here
begin
  p_setproppolicyprice(i_basePrice_nr => 1000, i_policyID_nr => :new.policy_id,
    i_propCode_nr => :new.property_code, i_ageOfProp_nr => :new.age_of_property, i_propValue_nr => :new.property_value);
end property_setPrice;
/
