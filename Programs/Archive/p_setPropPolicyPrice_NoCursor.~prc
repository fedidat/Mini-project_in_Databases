create or replace procedure p_setPropPolicyPrice(i_basePrice_nr NUMBER, i_policyID_nr NUMBER) is
  v_propCode_nr NUMBER;
  v_propFactor_nr NUMBER;
  v_ageOfProp_nr NUMBER;
  v_propValue_nr NUMBER;
  v_resultPrice_nr NUMBER;
begin
  --Set type factor according to property code
  select property_code into v_propCode_nr from property where policy_ID = i_policyID_nr;
  case v_propCode_nr
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
  select age_of_property into v_ageOfProp_nr from property where policy_ID = i_policyID_nr;
  --Set property value
  select property_value into v_propValue_nr from property where policy_ID = i_policyID_nr;
  --Set resPrice
  v_resultPrice_nr := i_basePrice_nr + v_propFactor_nr*v_ageOfProp_nr*5 + v_propValue_nr/10000;
  update policy
  set price = v_resultPrice_nr
  where policy_id = i_policyID_nr;
end p_setPropPolicyPrice;
/
