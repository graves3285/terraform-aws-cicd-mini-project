output "bucket_name" {
  value = "${var.project_name}-${var.environment}-data-${random_id.bucket_suffix.hex}"
}
