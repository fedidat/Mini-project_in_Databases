PL/SQL Developer Test script 3.0
9
declare
  --Pick wanted customer ID
  v_firstCustID_Nr NUMBER := 109418126;
  v_result_Nr NUMBER;
begin
  --Call f_sumforcustomer_nr on that customer for wanted date
  v_result_Nr := f_sumforcustomer_nr(v_firstCustID_nr, TO_DATE('01-May-2006','dd-mon-yyyy'));
  DBMS_OUTPUT.put_line('Total for customer ' || v_firstCustID_nr || ' is: ' || v_result_Nr);
end;
1
result
0
-4
0
