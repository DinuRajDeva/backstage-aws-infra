variable "aws_region" {
  description = "AWS region (Mumbai)."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Prefix for resource names."
  type        = string
  default     = "backstage"
}

variable "default_tags" {
  description = "Tags applied to all supported resources."
  type        = map(string)
  default     = {}
}

# --- ECS (module) ---

variable "ecr_image_uri" {
  description = "Full ECR image URI in ap-south-1."
  type        = string
}

variable "task_cpu" {
  type    = number
  default = 256
}

variable "task_memory" {
  type    = number
  default = 512
}

variable "container_port" {
  type    = number
  default = 8080
}

variable "container_name" {
  type    = string
  default = "app"
}

variable "log_retention_days" {
  type    = number
  default = 14
}

# --- RDS (module) ---

variable "vpc_id" {
  description = "VPC where RDS and its security group are created."
  type        = string
}

variable "rds_subnet_ids" {
  description = "Private subnets for RDS (need subnets in at least two availability zones)."
  type        = list(string)
}

variable "rds_allowed_security_group_ids" {
  description = "Security groups that may connect to PostgreSQL on 5432 (e.g. ECS task SG when you add it)."
  type        = list(string)
  default     = []
}

variable "rds_allowed_cidr_blocks" {
  description = "CIDRs allowed to reach PostgreSQL (e.g. bastion or VPN); prefer security groups when possible."
  type        = list(string)
  default     = []
}

variable "rds_db_name" {
  type    = string
  default = "app"
}

variable "rds_master_username" {
  type    = string
  default = "postgres"
}

variable "rds_master_password" {
  description = "Master password for RDS (use a strong secret; store outside VCS)."
  type        = string
  sensitive   = true
}

variable "rds_engine_version" {
  type    = string
  default = "16"
}

variable "rds_instance_class" {
  type    = string
  default = "db.t4g.micro"
}

variable "rds_allocated_storage" {
  type    = number
  default = 20
}

variable "rds_backup_retention_period" {
  type    = number
  default = 1
}

variable "rds_skip_final_snapshot" {
  type    = bool
  default = true
}

variable "rds_publicly_accessible" {
  type    = bool
  default = false
}
