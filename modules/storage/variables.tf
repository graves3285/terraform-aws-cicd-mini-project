@'
variable "project_name" {
  type        = string
  description = "Project prefix for naming resources"
}

variable "environment" {
  type        = string
  description = "Deployment environment (dev, test, prod)"
}

variable "force_destroy" {
  type        = bool
  description = "Allow destroying non-empty S3 bucket during lab cleanup"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to resources"
  default     = {}
}
'@ | Set-Content -Path "$storageDir\variables.tf" -NoNewline