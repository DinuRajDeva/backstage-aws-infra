module "ecs" {
  source = "./modules/ecs"

  project_name       = var.project_name
  aws_region         = var.aws_region
  ecr_image_uri      = var.ecr_image_uri
  task_cpu           = var.task_cpu
  task_memory        = var.task_memory
  container_port     = var.container_port
  log_retention_days = var.log_retention_days
  container_name     = var.container_name
}

module "rds_postgres" {
  source = "./modules/rds-postgres"

  project_name = var.project_name
  vpc_id       = var.vpc_id
  subnet_ids   = var.rds_subnet_ids

  allowed_security_group_ids = var.rds_allowed_security_group_ids
  allowed_cidr_blocks        = var.rds_allowed_cidr_blocks

  db_name           = var.rds_db_name
  master_username   = var.rds_master_username
  master_password   = var.rds_master_password
  engine_version    = var.rds_engine_version
  instance_class    = var.rds_instance_class
  allocated_storage = var.rds_allocated_storage

  backup_retention_period = var.rds_backup_retention_period
  skip_final_snapshot     = var.rds_skip_final_snapshot
  publicly_accessible     = var.rds_publicly_accessible
}
