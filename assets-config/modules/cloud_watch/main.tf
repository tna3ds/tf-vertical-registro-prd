# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A CLOUDWATCH LOGS ECS SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_cloudwatch_log_group" "ecs_log_groups" {
  count             = length(var.repositories)
  name              = lower("/ecs/bk-${var.repositories[count.index]}-service")
  retention_in_days = 14

  tags = {
    "Manager" = var.manager
  }
}
