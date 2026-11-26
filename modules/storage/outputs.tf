@'
output "bucket_name" {
  value       = aws_s3_bucket.app_data.bucket
  description = "Name of the application storage S3 bucket"
}

output "bucket_arn" {
  value       = aws_s3_bucket.app_data.arn
  description = "ARN of the application storage S3 bucket"
}
'@ | Set-Content -Path "$storageDir\outputs.tf" -NoNewline