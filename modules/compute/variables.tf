variable "project_name" {
  type        = string
  description = "Project prefix for naming resources"
}

variable "environment" {
  type        = string
  description = "Deployment environment (dev, test, prod)"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "ami_id" {
  type        = string
  description = "Optional explicit AMI ID; defaults to latest Amazon Linux 2023"
  default     = ""
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs available to compute"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs attached to the instance"
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to resources"
  default     = {}
}
