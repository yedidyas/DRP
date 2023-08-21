resource "aws_db_instance" "replication" {
  count = var.is_dr_env ? 1 : 0
  replicate_source_db                   = var.original_instance_arn
  availability_zone                     = data.aws_subnet.public_2.availability_zone
  db_subnet_group_name                  = aws_db_subnet_group.main.name
  identifier                            = "ownid-${local.rds_env_name}-db-replica"
  instance_class                        = var.rds_instance_class
  kms_key_id                            = data.aws_kms_key.rds[0].arn
  vpc_security_group_ids                = [data.aws_security_group.rds.id]
  iam_database_authentication_enabled   = "true"
  port                                  = "5432"
  publicly_accessible                   = "false"
  storage_encrypted                     = "true"
  storage_type                          = "gp2"
  skip_final_snapshot                   = "true"
  
  tags = {
    Name = "ownid-${local.rds_env_name}-db-replica"
  }
}
