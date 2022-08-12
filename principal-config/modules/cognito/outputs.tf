output "cognito_user_pool_endpoint" {
  value       = aws_cognito_user_pool.cognito_pool.endpoint
  description = "The endpoint of the congito user pool"
}

output "cognito_user_pool_autorizer_id" {
  value = aws_cognito_user_pool_client.registro_app_client.id
  description = "The id of the congito pool cliente"  
}
