include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = "${get_terragrunt_dir()}/../../_env/rds.hcl"
}

terraform {
  source = "../../../modules/rds"
}

inputs = {
  rds_instance_class = "db.m6g.large"
}