output "db_endpoint" {
  value       = aws_db_instance.main.address
  description = "Hostname endpoint of the RDS instance"
}

output "db_port" {
  value       = aws_db_instance.main.port
  description = "Port of the RDS instance"
}
