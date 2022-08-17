output "ecs_auth_name" {
  value       = aws_ecs_service.ecs_auth_services.name
  description = "The name of ecs auth services"
}

output "ecs_catalogo_name" {
  value       = aws_ecs_service.ecs_catalogo_services.name
  description = "The name of ecs catalogo services"
}

output "ecs_persistence_name" {
  value       = aws_ecs_service.ecs_persistence_services.name
  description = "The name of ecs persistence services"
}

output "ecs_registro_workflow_name" {
  value       = aws_ecs_service.ecs_registro_workflow_services.name
  description = "The name of ecs registro-workflow services"
}
