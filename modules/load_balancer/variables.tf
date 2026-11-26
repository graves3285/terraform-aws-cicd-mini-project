variable "project_name" {
  type        = string
  description = "Project prefix for naming resources"
}

variable "environment" {
  type        = string
  description = "Deployment environment (dev, test, prod)"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the target group lives"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "At least two public subnet IDs in distinct AZs for the ALB"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs attached to the ALB"
}

variable "target_instance_id" {
  type        = string
  description = "EC2 instance ID registered with the target group"
}

variable "target_port" {
  type        = number
  description = "Port on the target instance to receive traffic"
  default     = 80
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to resources"
  default     = {}
}
