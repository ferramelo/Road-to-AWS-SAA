resource "aws_db_subnet_group" "rds_subnets" {
  name       = "${var.project_name}-rds-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name        = "${var.project_name}-rds-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "mysql" {
  identifier              = "${var.project_name}-mysql"
  engine                  = "mysql"
  instance_class          = "db.t2.micro"
  allocated_storage       = 20
  name                    = var.db_name
  username                = var.db_user
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.rds_subnets.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = false
  backup_retention_period = 1
  storage_type            = "gp2"

  tags = {
    Name        = "${var.project_name}-mysql"
    Environment = var.environment
  }
}
