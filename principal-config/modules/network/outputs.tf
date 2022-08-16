output "private_subnets_id" {
  value       = aws_subnet.private_subnets.*.id
  description = "The id of the private subnets"
}
