# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A SECURITY GROUP FOR PRIVATE ALB
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_security_group" "sg_alb" {
  name        = upper("sg-alb-${var.project}-${var.environment}")
  description = "sg private alb"
  vpc_id      = var.vpc_id

  ingress {
    description = "ALLOW HTTP ACCESS FROM ANY"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "ALLOW EGRESS ALL TO ALL"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"    = upper("sg-alb-${var.project}-${var.environment}")
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A SECURITY GROUP FOR ECS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_security_group" "sg_ecs" {
  name        = upper("sg-ecs-${var.project}-${var.environment}")
  description = "sg ecs"
  vpc_id      = var.vpc_id

  ingress {
    description     = "ALLOW HTTP ACCESS FROM PRIVATE ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.sg_alb.id}"]
  }

  egress {
    description = "ALLOW EGRESS ALL TO ALL"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"    = upper("sg-ecs-${var.project}-${var.environment}")
    "Manager" = var.manager
  }

  depends_on = [
    aws_security_group.sg_alb
  ]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A SECURITY GROUP FOR REDIS CLUSTER
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_security_group" "sg_redis" {
  name        = upper("sg-redis-${var.project}-${var.environment}")
  description = "sg redis cluster"
  vpc_id      = var.vpc_id

  ingress {
    description     = "ALLOW ACCESS FROM PRIVATE ALB"
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = ["${aws_security_group.sg_ecs.id}"]
  }

  egress {
    description = "ALLOW EGRESS ALL TO ALL"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"    = upper("sg-redis-${var.project}-${var.environment}")
    "Manager" = var.manager
  }

  depends_on = [
    aws_security_group.sg_ecs
  ]
}
