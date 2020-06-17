package main

allow[msg] {
  count(input.resource.aws_security_group) == 1
  msg = sprintf("Security groups should be 1, found %v", [count(input.resource.aws_security_group)])
}

deny[msg] {
  not input.resource.aws_security_group.ssm_sg.ingress.from_port == 443
  msg = "SSM security group should allow ingress to instance on port 443"
}

deny[msg] {
  input.resource.aws_security_group[_].ingress[_].to_port == 22
  msg = "Lockdown SSH access"
}