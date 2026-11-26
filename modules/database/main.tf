resource "random_password" "db_master" {
  length           = 20
  special          = false
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-${var.environment}-db-subnets"
  subnet_ids = var.private_subnet_ids

  tags = merge(var.tags, {
    Name        = "${var.project_name}-${var.environment}-db-subnets"
    Environment = var.environment
  })
}

resource "aws_db_instance" "main" {
  identifier             = "${var.project_name}-${var.environment}-db"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  username               = var.db_username
  password               = random_password.db_master.result
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = var.security_group_ids
  publicly_accessible    = false
  skip_final_snapshot    = true

  tags = merge(var.tags, {
    Name        = "${var.project_name}-${var.environment}-db"
    Environment = var.environment
  })
}
