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

variable "ecr_image_uri" {
  description = "Full ECR image URI, e.g. 123456789012.dkr.ecr.ap-south-1.amazonaws.com/my-app:latest"
  type        = string
}

variable "task_cpu" {
  description = "Fargate task CPU units (256, 512, 1024, ...)."
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Fargate task memory in MB (must match CPU for Fargate)."
  type        = number
  default     = 512
}

variable "container_port" {
  description = "Container port to expose (set 0 if not using a listener)."
  type        = number
  default     = 8080
}

variable "log_retention_days" {
  description = "CloudWatch log group retention for the task."
  type        = number
  default     = 14
}
