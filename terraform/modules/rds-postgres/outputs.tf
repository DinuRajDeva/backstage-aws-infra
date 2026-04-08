output "endpoint" {
  description = "PostgreSQL hostname (no port)."
  value       = aws_db_instance.this.address
}

output "port" {
  description = "PostgreSQL port."
  value       = aws_db_instance.this.port
}

output "database_name" {
  description = "Database name."
  value       = aws_db_instance.this.db_name
}

output "security_group_id" {
  description = "Security group attached to RDS."
  value       = aws_security_group.rds.id
}

output "instance_arn" {
  description = "RDS instance ARN."
  value       = aws_db_instance.this.arn
}
