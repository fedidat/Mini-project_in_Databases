create or replace procedure deleteLifePolicy(policy_id_ NUMBER) is
begin
  delete from life
  where policy_id=policy_id_;
  delete from policy 
  where policy_id=policy_id_; 
end deleteLifePolicy;
/
