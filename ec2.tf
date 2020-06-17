data "aws_ami" "ami" {
  most_recent = true
  owners      = ["296274010522"]

  filter {
    name   = "tag:Name"
    values = ["tdd-infra"]
  }
}

resource "aws_instance" "instance" {
  instance_type               = "t2.micro"
  ami                         = "ami-0ea3405d2d2522162"
  vpc_security_group_ids      = [aws_security_group.ssm_sg.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = false
  tags = {
    Name  = "${var.prefix}-instance"
    Owner = var.owner
  }
}
