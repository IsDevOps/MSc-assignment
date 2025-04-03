resource "aws_db_subnet_group" "web_db_subnet_group" {
  name       = "web-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "Web DB Subnet Group"
  }
}

resource "aws_db_instance" "web_db" {
  allocated_storage    = 20
  engine              = "postgres"
  instance_class      = "db.t3.micro"
  username            = var.db_username
  password            = var.db_password
  publicly_accessible = false
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.web_db_subnet_group.name
}
