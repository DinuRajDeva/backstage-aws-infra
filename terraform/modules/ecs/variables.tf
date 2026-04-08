variable "project_name" {
  description = "Prefix for resource names."
  type        = string
}

variable "aws_region" {
  description = "AWS region for CloudWatch log stream."
  type        = string
}

variable "ecr_image_uri" {
  description = "Full ECR image URI."
  type        = string
}

variable "task_cpu" {
  description = "Fargate task CPU units."
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Fargate task memory in MB."
  type        = number
  default     = 512
}

variable "container_port" {
  description = "Container listening port."
  type        = number
  default     = 8080
}

variable "log_retention_days" {
  description = "CloudWatch log retention."
  type        = number
  default     = 14
}

variable "container_name" {
  description = "Name of the primary container in the task definition."
  type        = string
  default     = "app"
}

variable "enable_container_insights" {
  description = "Enable Container Insights on the cluster."
  type        = bool
  default     = true
}
