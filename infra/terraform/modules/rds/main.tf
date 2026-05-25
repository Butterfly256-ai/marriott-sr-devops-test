resource  "aws_db_subnet_group" "main" {
  name       = "${var.environment}-db-subnet"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "main" {
  identifier             = var.identifier
  instance_class         = "db.t3.micro"
  engine                 = "postgres"
  engine_version         = "15"
  username               = "dbuser"
  password               = "password123"
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.main.name
  skip_final_snapshot    = true
  publicly_accessible    = false
}

output "db_endpoint" { value = aws_db_instance.main.address }
