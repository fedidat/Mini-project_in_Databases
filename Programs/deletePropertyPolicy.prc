create or replace procedure deletePropertyPolicy(policy_id_ NUMBER) is
begin
  delete from property
  where policy_id=policy_id_;
  delete from policy 
  where policy_id=policy_id_; 
end deletePropertyPolicy;
/
