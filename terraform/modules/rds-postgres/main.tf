resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-postgres"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "rds" {
  name        = "${var.project_name}-rds-postgres"
  description = "PostgreSQL access for ${var.project_name}"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "postgres_from_sgs" {
  count                    = length(var.allowed_security_group_ids)
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  source_security_group_id = var.allowed_security_group_ids[count.index]
  security_group_id        = aws_security_group.rds.id
}

resource "aws_security_group_rule" "postgres_from_cidr" {
  count             = length(var.allowed_cidr_blocks)
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = [var.allowed_cidr_blocks[count.index]]
  security_group_id = aws_security_group.rds.id
}

resource "aws_db_instance" "this" {
  identifier = "${var.project_name}-postgres"

  engine         = "postgres"
  engine_version = var.engine_version
  instance_class = var.instance_class

  db_name  = var.db_name
  username = var.master_username
  password = var.master_password

  allocated_storage = var.allocated_storage
  storage_type      = "gp3"
  storage_encrypted     = true

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  publicly_accessible    = var.publicly_accessible

  multi_az                = false
  backup_retention_period = var.backup_retention_period
  deletion_protection     = false
  skip_final_snapshot     = var.skip_final_snapshot

  # Minimal: avoid long apply during iteration
  apply_immediately = true
}
