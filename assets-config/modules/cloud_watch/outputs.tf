output "ecs_log_groups_ids" {
  value       = aws_cloudwatch_log_group.ecs_log_groups.*.id
  description = "The id of the private subnets"
}
