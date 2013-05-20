PL/SQL Developer Test script 3.0
7
declare
  v_firstCustID_Nr NUMBER := 109418126;
  v_result_Nr NUMBER;
begin
  v_result_Nr := f_sumforcustomer_nr(v_firstCustID_nr, TO_DATE('01-May-2006','dd-mon-yyyy'));
  DBMS_OUTPUT.put_line('Total for customer 109418126 is: ' || v_result_Nr);
end;
1
result
1
6002.7445
-4
0
