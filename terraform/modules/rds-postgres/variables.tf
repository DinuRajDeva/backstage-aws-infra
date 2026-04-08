variable "project_name" {
  description = "Prefix for resource names."
  type        = string
}

variable "vpc_id" {
  description = "VPC for the RDS security group."
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs for the DB subnet group (at least two AZs)."
  type        = list(string)
}

variable "allowed_security_group_ids" {
  description = "Security groups allowed to connect on PostgreSQL port (e.g. ECS tasks SG)."
  type        = list(string)
  default     = []
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to connect on PostgreSQL port (use sparingly)."
  type        = list(string)
  default     = []
}

variable "db_name" {
  description = "Initial database name."
  type        = string
  default     = "app"
}

variable "master_username" {
  description = "Master username."
  type        = string
  default     = "postgres"
}

variable "master_password" {
  description = "Master password."
  type        = string
  sensitive   = true
}

variable "engine_version" {
  description = "PostgreSQL version string (e.g. 16). Omit with null to use AWS default."
  type        = string
  default     = "16"
}

variable "instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "db.t4g.micro"
}

variable "allocated_storage" {
  description = "Allocated storage in GB."
  type        = number
  default     = 20
}

variable "backup_retention_period" {
  description = "Backup retention days (0 disables automated backups)."
  type        = number
  default     = 1
}

variable "skip_final_snapshot" {
  description = "If true, no final snapshot on destroy (typical for dev)."
  type        = bool
  default     = true
}

variable "publicly_accessible" {
  description = "Whether the instance gets a public IP (not recommended)."
  type        = bool
  default     = false
}
