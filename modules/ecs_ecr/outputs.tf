output "ecr_uris" {
  value       = aws_ecr_repository.ecr.*.repository_url
  description = "The uris of ecr repositories"
}
