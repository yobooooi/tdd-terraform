package main

deny[msg] {
  not input.resource.aws_instance.instance.instance_type == "t2.micro"
  msg = sprintf("Instance type found: %v only t2.micro allowed", [input.resource.aws_instance.instance.instance_type])
}

deny[msg] {
  not contains(input.resource.aws_instance.instance.ami, "data.aws_ami.ami.id")
  msg = "AMI shouldn't be a hardcoded"
}

deny[msg] {
  input.resource.aws_instance.instance.associate_public_ip_address == true
  msg = "Associating Public IP, should be set to false"
}

allow[msg] {
  re_match("[A-Za-z0-9_]", input.resource.aws_instance.instance.tags.Owner) == true
  msg = "Tag:Owner should be set"
}