output "ecs_cluster_id" {
  description = "ECS cluster ID."
  value       = aws_ecs_cluster.this.id
}

output "ecs_cluster_arn" {
  description = "ECS cluster ARN."
  value       = aws_ecs_cluster.this.arn
}

output "task_definition_arn" {
  description = "Task definition ARN (latest revision)."
  value       = aws_ecs_task_definition.app.arn
}

output "task_execution_role_arn" {
  description = "IAM role ARN used by ECS to pull images and write logs."
  value       = aws_iam_role.task_execution.arn
}

output "cloudwatch_log_group_name" {
  description = "Log group for container stdout/stderr."
  value       = aws_cloudwatch_log_group.task.name
}
