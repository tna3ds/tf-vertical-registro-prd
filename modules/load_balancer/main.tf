# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A PRIVATE APLICATION LOAD BALANCER
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_lb" "alb_prv" {
  load_balancer_type = "application"
  name               = upper("alb-prv-${var.project}-${var.environment}")
  internal           = true
  subnets            = var.private_subnets_id
  security_groups    = ["${var.sg_alb_id}"]

  tags = {
    "Name"    = upper("alb-prv-${var.project}-${var.environment}")
    "Manager" = var.manager
  }

  depends_on = [
    var.private_subnets_id, var.sg_alb_id
  ]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DEFAULT REDIRECT LISTENER 80 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_lb_listener" "lst_http" {
  load_balancer_arn = aws_lb.alb_prv.arn
  protocol          = "HTTP"
  port              = 80

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "application/json"
      message_body = "{message:Successfully, status: 200}"
      status_code  = "200"
    }
  }

  depends_on = [
    aws_lb.alb_prv
  ]
}
