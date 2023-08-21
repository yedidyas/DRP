include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = "${get_terragrunt_dir()}/../../_env/web-app.hcl"
}

terraform {
  source = "../../../modules/web-app"
}