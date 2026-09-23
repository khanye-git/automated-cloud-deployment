variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "capstone"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_name" {
  description = "PostgreSQL database name"
  type        = string
  default     = "capstone_db"
}

variable "db_username" {
  description = "PostgreSQL database username"
  type        = string
  default     = "appuser"
}

variable "db_password" {
  description = "PostgreSQL database password"
  type        = string
  sensitive   = true
}