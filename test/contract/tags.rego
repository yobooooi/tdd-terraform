package main

region := "eu-west-1"
owner := "adan"

contains_variables(variables) {
  variables.region.value = region
  variables.owner
}

deny[msg] {
  not contains_variables(input.variables)
  msg = "Variables are not populated with expected values"
}

deny[msg] {
  untagged := [r | r := input.planned_values.root_module.resources[_]; r.values.tags.Owner != owner ]
  count(untagged) != 0
  msg = sprintf("Resources missing owner tag: `%v`", untagged)
}