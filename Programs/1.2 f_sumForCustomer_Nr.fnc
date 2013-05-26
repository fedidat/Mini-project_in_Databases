create or replace function f_sumForCustomer_Nr(i_customerID_nr NUMBER, v_date_dt DATE) 
return NUMBER 
is
  cursor c_custPolicy is
    select * from policy natural join customers_policy
    where customer_ID = i_customerID_nr;
  r_custPolicy c_custPolicy%ROWTYPE;
  v_sumPrices_nr NUMBER := 0;
begin
  --Load cursor
  open c_custPolicy;
  loop
    --Load record
    fetch c_custPolicy into r_custPolicy;
    exit when c_custPolicy%NOTFOUND;
    --If policy date checks out
    if r_custPolicy.start_date < v_date_dt and r_custPolicy.end_date > v_date_dt then
      --Compute price of actual policy using price and bonus and add to sum
      v_sumPrices_nr := v_sumPrices_nr + r_custPolicy.price * (1 - 0.05 * r_custPolicy.bonus);
    end if;
  end loop;
  close c_custPolicy;
  return(v_sumPrices_nr);
end f_sumForCustomer_Nr;
/
