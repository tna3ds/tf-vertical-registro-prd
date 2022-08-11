output "alb_priv_name" {
  value       = aws_lb.alb_prv.name
  description = "The name of alb priv"
}

output "lister_alb_priv_arn" {
  value       = aws_lb_listener.lst_http.arn
  description = "The arn of lister alb priv"
}