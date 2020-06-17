package main


do_not_delete = [
  "aws_instance.instance"
]

deny[msg] {
  check_delete_protected(input.resource_changes, do_not_delete)
  msg = "Terraform plan will delete a protected resource"
}

check_delete_protected(resources, disallowed) {
  startswith(resources[i].address, disallowed[_])
  resources[i].change[0].actions[_] == "delete"
}