create or replace procedure p_updatePropertyPrice(i_basePrice_nr NUMBER, i_policyID_nr NUMBER) is
  r_prop property%ROWTYPE;
  v_propFactor_nr NUMBER;
  v_ageOfProp_nr NUMBER;
  v_propValue_nr NUMBER;
  v_resultPrice_nr NUMBER;
begin
  select * into r_prop from property where policy_ID = i_policyID_nr;
  --Set type factor according to property code
  case r_prop.property_code
    when 1 then
      v_propFactor_nr := 1.5;
    when 2 then 
      v_propFactor_nr := 2;
    when 3 then 
      v_propFactor_nr := 2.5;
    when 4 then 
      v_propFactor_nr := 3.5;
    when 5 then 
      v_propFactor_nr := 5;
    else
      v_propFactor_nr := 1;
  end case;
  --Set age of property
  v_ageOfProp_nr := r_prop.age_of_property;
  --Set property value
  v_propValue_nr := r_prop.property_value;
  --Set resPrice
  v_resultPrice_nr := i_basePrice_nr + v_propFactor_nr*v_ageOfProp_nr*5 + v_propValue_nr/10000;
  update policy
  set price = v_resultPrice_nr
  where policy_id = i_policyID_nr;
end p_updatePropertyPrice;
/
