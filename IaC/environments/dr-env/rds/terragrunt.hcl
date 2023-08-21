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
  rds_instance_class = "db.t4g.micro"
  original_instance_arn = "arn:aws:rds:us-east-1:***...."
  is_dr_env = true
}