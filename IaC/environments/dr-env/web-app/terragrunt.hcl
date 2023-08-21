include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = "${get_terragrunt_dir()}/../../_env/route53.hcl"
}

terraform {
  source = "../../../modules/rds"
}

inputs = {
  is_dr_env = true
}