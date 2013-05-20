PL/SQL Developer Test script 3.0
10
declare
  v_firstCustID_Nr NUMBER;
begin
  select customer_id into v_firstCustID_Nr from customer where rownum = 1;
  insert into customers_policy (customers_policy_id, customer_id, policy_id, start_date, end_date, bonus)
    values (12500, v_firstCustID_Nr, 12, TO_DATE('01-May-2006','dd-mon-yyyy'), TO_DATE('01-May-2006','dd-mon-yyyy'), 1.05);
  insert into customers_policy (customers_policy_id, customer_id, policy_id, start_date, end_date, bonus)
    values (12501, v_firstCustID_Nr, 12, TO_DATE('01-May-2016','dd-mon-yyyy'), TO_DATE('01-May-2016','dd-mon-yyyy'), 1.05);
rollback;
end;
0
0
