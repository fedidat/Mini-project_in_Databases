create or replace procedure p_updatePropertyPrices(i_basePrice_nr NUMBER) is
  cursor c_prop is
    select * from property;
  r_prop c_prop%ROWTYPE;
  v_propFactor_nr NUMBER;
  v_ageOfProp_nr NUMBER;
  v_propValue_nr NUMBER;
  v_resultPrice_nr NUMBER;
begin
  open c_prop;
  loop
    fetch c_prop into r_prop;
    exit when c_prop%NOTFOUND;
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
    where policy_id = r_prop.policy_id;
    --DBMS_OUTPUT.put_line(v_resultPrice_nr);
  end loop;
  close c_prop;
end p_updatePropertyPrices;
/
