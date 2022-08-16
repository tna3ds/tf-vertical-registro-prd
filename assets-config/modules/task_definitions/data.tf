data "aws_iam_role" "execution_role_arn_data" {
  name = var.execution_role_arn
}

data "aws_ecr_repository" "ecr_repositories_data" {
  count = length(var.repositories)
  name  = "bk-${var.repositories[count.index]}-service"
}

data "aws_iam_role" "task_role_arn_data" {
  count = length(var.repositories)
  name  = "taskRole_${var.repositories[count.index]}_service"
}
