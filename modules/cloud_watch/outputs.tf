output "redis_slow_logs_name" {
  value       = aws_cloudwatch_log_group.redis_slow_logs.name
  description = "The name of cloudwatch logs for redis slow"
}

output "redis_engine_logs_name" {
  value       = aws_cloudwatch_log_group.redis_engine_logs.name
  description = "The name of cloudwatch logs for redis engine"
}
