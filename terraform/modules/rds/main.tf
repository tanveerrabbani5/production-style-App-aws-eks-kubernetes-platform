###----RDS SUBNET GROUP

resource "aws_db_subnet_group" "this" {
  name = "${var.identifier}-subnet-group"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.identifier}-subnet-group"
  }
}


###----RDS INSTANCE

resource "aws_db_instance" "this" {
  identifier = var.identifier

  engine         = var.engine
  engine_version = var.engine_version

  instance_class = var.instance_class

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = var.database_name
  username = var.username
  password = var.password

  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = var.security_group_ids

  publicly_accessible = false

  multi_az = false

  skip_final_snapshot = true

  backup_retention_period = 1

  deletion_protection = false

  tags = {
    Name = var.identifier
  }
}