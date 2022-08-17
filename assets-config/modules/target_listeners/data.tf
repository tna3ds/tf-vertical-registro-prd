data "aws_lb" "alb_prv_data" {
  name = upper("alb-prv-${var.project}-${var.environment}")
}
