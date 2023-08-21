resource "aws_db_instance" "main" {
  count = var.is_dr_env ? 0 : 1
  availability_zone                     = data.aws_subnet.public_2.availability_zone
  vpc_security_group_ids                = [data.aws_security_group.rds.id]
  db_subnet_group_name                  = aws_db_subnet_group.main.name
  db_name                               = replace("ownid${var.env_name}", "-", "")
  identifier                            = "ownid-${var.env_name}-db"
  instance_class                        = var.rds_instance_class
  allocated_storage                     = "20"
  auto_minor_version_upgrade            = "true"
  backup_retention_period               = "1"
  ca_cert_identifier                    = "rds-ca-2019"
  copy_tags_to_snapshot                 = "false"
  customer_owned_ip_enabled             = "false"
  deletion_protection                   = "false"
  engine                                = "postgres"
  engine_version                        = "12.11"
  iam_database_authentication_enabled   = "true"
  iops                                  = "0"
  license_model                         = "postgresql-license"
  max_allocated_storage                 = "0"
  monitoring_interval                   = "0"
  multi_az                              = "true"
  option_group_name                     = "default:postgres-12"
  parameter_group_name                  = "default.postgres12"
  performance_insights_enabled          = "false"
  performance_insights_retention_period = "0"
  port                                  = "5432"
  publicly_accessible                   = "false"
  storage_encrypted                     = "true"
  storage_type                          = "gp2"
  skip_final_snapshot                   = "true"
  apply_immediately                     = "true"

  tags = {
    Name = "ownid-${var.env_name}-db"
  }
}
