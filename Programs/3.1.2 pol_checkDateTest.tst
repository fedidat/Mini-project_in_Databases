PL/SQL Developer Test script 3.0
12
declare
begin
  --Update policy with start_date a while ago
  update customers_policy
  set start_date = TO_DATE('01-May-2006','dd-mon-yyyy')
  where rownum = 1;
  --Update policy with start_date more than a month from now
  update customers_policy
  set start_date = TO_DATE('01-May-2016','dd-mon-yyyy')
  where rownum = 1;
rollback;
end;
0
0
