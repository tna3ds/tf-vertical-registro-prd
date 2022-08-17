output "target_auth_service_arn" {
  value       = aws_alb_target_group.target_auth_service.arn
  description = "The arn of the target group auth services"
}

output "target_catalogo_service_arn" {
  value       = aws_alb_target_group.target_catalogo_service.arn
  description = "The arn of the target group catalogo services"
}

output "target_persistence_service_arn" {
  value       = aws_alb_target_group.target_persistence_service.arn
  description = "The arn of the target group persistence services"
}

output "target_registro_workflow_service_arn" {
  value       = aws_alb_target_group.target_registro_workflow_service.arn
  description = "The arn of the target group registro-workflow services"
}
