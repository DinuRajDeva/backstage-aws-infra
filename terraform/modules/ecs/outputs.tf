output "cluster_id" {
  description = "ECS cluster ID."
  value       = aws_ecs_cluster.this.id
}

output "cluster_arn" {
  description = "ECS cluster ARN."
  value       = aws_ecs_cluster.this.arn
}

output "task_definition_arn" {
  description = "Task definition ARN (latest revision)."
  value       = aws_ecs_task_definition.app.arn
}

output "task_execution_role_arn" {
  description = "Task execution role ARN."
  value       = aws_iam_role.task_execution.arn
}

output "cloudwatch_log_group_name" {
  description = "Log group for container logs."
  value       = aws_cloudwatch_log_group.task.name
}
