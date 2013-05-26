PL/SQL Developer Test script 3.0
16
declare
  cursor c_prop is
    select policy_id from property;
  r_prop c_prop%ROWTYPE;
begin
  --Load cursor
  open c_prop;
  loop
    --Load record
    fetch c_prop into r_prop;
    exit when c_prop%NOTFOUND;
    --Call p_updatepropertyprice with base price 1000 and policy ID or each record
    p_updatepropertyprice(i_baseprice_nr => 2000, i_policyid_nr => r_prop.policy_id);
  end loop;
  close c_prop;
end;
2
i_baseprice_nr
1
1000
-4
i_policyid_nr
1
r_prop.policy_id
-4
0
