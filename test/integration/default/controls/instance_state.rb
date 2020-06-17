# instance_id = attribute('instance_id')
# control "instance_state" do
#   title "Checks the instance state from SSM"

#   describe command("aws ssm describe-instance-information --filters \"Key=InstanceIds,Values=#{instance_id['value']}\" --profile synthesis-internal-dev --region eu-west-1  | jq -r '.[][].PingStatus'") do
#     its('stdout') { should match "Online" }
#   end
# end

instance_id = attribute('instance_id')
control "instance_state" do
  title "Checks the instance state from SSM"

  describe command("aws ssm describe-instance-information --filters \"Key=InstanceIds,Values=i-0add42491529b49b0\" --profile synthesis-internal-dev --region eu-west-1  | jq -r '.[][].PingStatus'") do
    its('stdout') { should match "Online" }
  end
end