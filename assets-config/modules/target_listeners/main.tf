# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A TARGET GROUP & LISTENER FOR AUTH SEVICE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#@targetGroup
resource "aws_alb_target_group" "target_auth_service" {
  name        = upper("tg-${var.project}-${var.environment}-auth")
  port        = var.auth_service_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    timeout             = "5"
    unhealthy_threshold = "2"
    healthy_threshold   = "2"
    interval            = "10"
    protocol            = "HTTP"
    matcher             = "200"
    path                = var.auth_health_check_path
  }

  tags = {
    "Manager" = var.manager
  }
}

#@litener
resource "aws_alb_listener" "listener_auth_service" {
  load_balancer_arn = data.aws_lb.alb_prv_data.id
  port              = var.auth_listener_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.target_auth_service.id
    type             = "forward"
  }

  tags = {
    "Manager" = var.manager
  }

  depends_on = [
    aws_alb_target_group.target_auth_service
  ]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A TARGET GROUP & LISTENER FOR CATALOGO SEVICE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#@targetGroup
resource "aws_alb_target_group" "target_catalogo_service" {
  name        = upper("tg-${var.project}-${var.environment}-catalogo")
  port        = var.catalogo_service_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    timeout             = "5"
    unhealthy_threshold = "2"
    healthy_threshold   = "2"
    interval            = "10"
    protocol            = "HTTP"
    matcher             = "200"
    path                = var.catalogo_health_check_path
  }

  tags = {
    "Manager" = var.manager
  }
}

#@litener
resource "aws_alb_listener" "listener_catalogo_service" {
  load_balancer_arn = data.aws_lb.alb_prv_data.id
  port              = var.catalogo_listener_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.target_catalogo_service.id
    type             = "forward"
  }

  tags = {
    "Manager" = var.manager
  }

  depends_on = [
    aws_alb_target_group.target_catalogo_service
  ]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A TARGET GROUP & LISTENER FOR PERSISTENCE SEVICE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#@targetGroup
resource "aws_alb_target_group" "target_persistence_service" {
  name        = upper("tg-${var.project}-${var.environment}-persistence")
  port        = var.persistence_service_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    timeout             = "5"
    unhealthy_threshold = "2"
    healthy_threshold   = "2"
    interval            = "10"
    protocol            = "HTTP"
    matcher             = "200"
    path                = var.persistence_health_check_path
  }

  tags = {
    "Manager" = var.manager
  }
}

#@litener
resource "aws_alb_listener" "listener_persistence_service" {
  load_balancer_arn = data.aws_lb.alb_prv_data.id
  port              = var.persistence_listener_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.target_persistence_service.id
    type             = "forward"
  }

  tags = {
    "Manager" = var.manager
  }

  depends_on = [
    aws_alb_target_group.target_persistence_service
  ]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A TARGET GROUP & LISTENER FOR REGISTRO WORKFLOW SEVICE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#@targetGroup
resource "aws_alb_target_group" "target_registro_workflow_service" {
  name        = upper("tg-${var.project}-${var.environment}-registro-workflow")
  port        = var.registro_workflow_service_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    timeout             = "5"
    unhealthy_threshold = "2"
    healthy_threshold   = "2"
    interval            = "10"
    protocol            = "HTTP"
    matcher             = "200"
    path                = var.registro_workflow_health_check_path
  }

  tags = {
    "Manager" = var.manager
  }
}

#@litener
resource "aws_alb_listener" "listener_registro_workflow_service" {
  load_balancer_arn = data.aws_lb.alb_prv_data.id
  port              = var.registro_workflow_listener_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.target_registro_workflow_service.id
    type             = "forward"
  }

  tags = {
    "Manager" = var.manager
  }

  depends_on = [
    aws_alb_target_group.target_registro_workflow_service
  ]
}
