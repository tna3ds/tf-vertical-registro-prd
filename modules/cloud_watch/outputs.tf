output "redis_slow_logs_name" {
  value       = aws_cloudwatch_log_group.redis_slow_logs.name
  description = "The name of cloudwatch logs for redis slow"
}

output "redis_engine_logs_name" {
  value       = aws_cloudwatch_log_group.redis_engine_logs.name
  description = "The name of cloudwatch logs for redis engine"
}

output "api_gateway_logs_arn" {
  value       = aws_cloudwatch_log_group.api_gateway_logs.arn
  description = "The name of cloudwatch logs for api gateway"
}
