variable "project_name" {
  type        = string
  description = "Project prefix for naming resources"
}

variable "environment" {
  type        = string
  description = "Deployment environment (dev, test, prod)"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for the RDS subnet group"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs attached to the RDS instance"
}

variable "instance_class" {
  type        = string
  description = "RDS instance class"
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  type        = number
  description = "Allocated storage in GB"
  default     = 20
}

variable "db_name" {
  type        = string
  description = "Initial database name"
  default     = "appdb"
}

variable "db_username" {
  type        = string
  description = "Master database username"
  default     = "admin"
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to resources"
  default     = {}
}
