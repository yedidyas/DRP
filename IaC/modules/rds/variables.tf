variable "env_name" {
  type = string
}

variable "rds_instance_class" {
  type = string
}

variable "original_instance_arn" {
  type = string
  default = "NULL"
}

variable "is_dr_env" {
  type = bool
  default = false
  description = "If true, a new RDS won't be created. The module will create a replica of original_instance_arn RDS"
}