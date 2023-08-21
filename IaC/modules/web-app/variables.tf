variable "env_name" {
  type = string
}

variable "is_dr_env" {
  type = bool
  default = false
  description = "If true, the route53 record won't be created"
}