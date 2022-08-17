output "auth_up_arn" {
  value       = aws_appautoscaling_policy.auth_up.arn
  description = "The arn of asg up auth services"
}

output "auth_down_arn" {
  value       = aws_appautoscaling_policy.auth_down.arn
  description = "The arn of asg down auth services"
}

output "catalogo_up_arn" {
  value       = aws_appautoscaling_policy.catalogo_up.arn
  description = "The arn of asg up catalogo services"
}

output "catalogo_down_arn" {
  value       = aws_appautoscaling_policy.catalogo_down.arn
  description = "The arn of asg down catalogo services"
}

output "persistence_up_arn" {
  value       = aws_appautoscaling_policy.persistence_up.arn
  description = "The arn of asg up persistence services"
}

output "persistence_down_arn" {
  value       = aws_appautoscaling_policy.persistence_down.arn
  description = "The arn of asg down persistence services"
}

output "registro_workflow_up_arn" {
  value       = aws_appautoscaling_policy.registro_workflow_up.arn
  description = "The arn of asg up registro_workflow services"
}

output "registro_workflow_down_arn" {
  value       = aws_appautoscaling_policy.registro_workflow_down.arn
  description = "The arn of asg down registro_workflow services"
}
