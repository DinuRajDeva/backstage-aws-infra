# ECS module
output "ecs_cluster_id" {
  value = module.ecs.cluster_id
}

output "ecs_cluster_arn" {
  value = module.ecs.cluster_arn
}

output "ecs_task_definition_arn" {
  value = module.ecs.task_definition_arn
}

output "ecs_task_execution_role_arn" {
  value = module.ecs.task_execution_role_arn
}

output "ecs_cloudwatch_log_group_name" {
  value = module.ecs.cloudwatch_log_group_name
}

# RDS module
output "rds_endpoint" {
  value = module.rds_postgres.endpoint
}

output "rds_port" {
  value = module.rds_postgres.port
}

output "rds_database_name" {
  value = module.rds_postgres.database_name
}

output "rds_security_group_id" {
  value = module.rds_postgres.security_group_id
}

output "rds_instance_arn" {
  value = module.rds_postgres.instance_arn
}
