output "task_definitions_auth_service_arn" {
  value       = aws_ecs_task_definition.task_definition_auth_services.arn
  description = "The arn of the task definitions auth services"
}

output "task_definitions_catalogo_service_arn" {
  value       = aws_ecs_task_definition.task_definition_catalogo_services.arn
  description = "The arn of the task definitions catalogo services"
}

output "task_definitions_persistence_service_arn" {
  value       = aws_ecs_task_definition.task_definition_persistence_services.arn
  description = "The arn of the task definitions persistence services"
}

output "task_definitions_registro_workflow_service_arn" {
  value       = aws_ecs_task_definition.task_definition_registro_workflow_services.arn
  description = "The arn of the task definitions registro-workflow services"
}
