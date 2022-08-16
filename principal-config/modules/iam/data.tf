data "aws_iam_policy" "ecs_task_policy_data" {
  count = length(var.ecs_task_execution_role_policies_name)
  name  = var.ecs_task_execution_role_policies_name[count.index]
}

data "aws_iam_policy" "ecs_task_auth_data" {
  count = length(var.ecs_task_auth_policies_name)
  name  = var.ecs_task_auth_policies_name[count.index]
}

data "aws_iam_policy" "ecs_task_catalgo_data" {
  count = length(var.ecs_task_catalogo_policies_name)
  name  = var.ecs_task_catalogo_policies_name[count.index]
}

data "aws_iam_policy" "ecs_task_persistence_data" {
  count = length(var.ecs_task_persistence_policies_name)
  name  = var.ecs_task_persistence_policies_name[count.index]
}

data "aws_iam_policy" "ecs_task_registro-workflow_data" {
  count = length(var.ecs_task_registro-workflow_policies_name)
  name  = var.ecs_task_registro-workflow_policies_name[count.index]
}
