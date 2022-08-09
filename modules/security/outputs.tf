output "sg_alb_id" {
  value       = aws_security_group.sg_alb.id
  description = "The id of the SG alb"
}

output "sg_redis_id" {
  value       = aws_security_group.sg_redis.id
  description = "The id of the SG Redis"
}
