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

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE AN ALARMS FOR AUTH SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ScalingUp CPU
resource "aws_cloudwatch_metric_alarm" "auth_service_cpu_high" {
  alarm_name          = "${var.repositories[0]}_cpu_utilization_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "60"

  dimensions = {
    ClusterName = upper("ecs-${var.project}-${var.environment}")
    ServiceName = var.ecs_auth_name
  }

  alarm_actions = [var.auth_up_arn]
}

# ScalingDown CPU
resource "aws_cloudwatch_metric_alarm" "auth_service_cpu_low" {
  alarm_name          = "${var.repositories[0]}_cpu_utilization_low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "10"

  dimensions = {
    ClusterName = upper("ecs-${var.project}-${var.environment}")
    ServiceName = var.ecs_auth_name
  }

  alarm_actions = [var.auth_down_arn]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE AN ALARMS FOR CATALOGO SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ScalingUp CPU
resource "aws_cloudwatch_metric_alarm" "catalogo_service_cpu_high" {
  alarm_name          = "${var.repositories[1]}_cpu_utilization_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "60"

  dimensions = {
    ClusterName = upper("ecs-${var.project}-${var.environment}")
    ServiceName = var.ecs_catalogo_name
  }

  alarm_actions = [var.catalogo_up_arn]
}

# ScalingDown CPU
resource "aws_cloudwatch_metric_alarm" "catalogo_service_cpu_low" {
  alarm_name          = "${var.repositories[1]}_cpu_utilization_low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "10"

  dimensions = {
    ClusterName = upper("ecs-${var.project}-${var.environment}")
    ServiceName = var.ecs_catalogo_name
  }

  alarm_actions = [var.catalogo_down_arn]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE AN ALARMS FOR PERSISTENCE SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ScalingUp CPU
resource "aws_cloudwatch_metric_alarm" "persistence_service_cpu_high" {
  alarm_name          = "${var.repositories[2]}_cpu_utilization_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "60"

  dimensions = {
    ClusterName = upper("ecs-${var.project}-${var.environment}")
    ServiceName = var.ecs_persistence_name
  }

  alarm_actions = [var.persistence_up_arn]
}

# ScalingDown CPU
resource "aws_cloudwatch_metric_alarm" "persistence_service_cpu_low" {
  alarm_name          = "${var.repositories[2]}_cpu_utilization_low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "10"

  dimensions = {
    ClusterName = upper("ecs-${var.project}-${var.environment}")
    ServiceName = var.ecs_persistence_name
  }

  alarm_actions = [var.persistence_down_arn]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE AN ALARMS FOR REGISTRO WORKFLOW SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ScalingUp CPU
resource "aws_cloudwatch_metric_alarm" "registro_workflow_service_cpu_high" {
  alarm_name          = "${var.repositories[3]}_cpu_utilization_high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "60"

  dimensions = {
    ClusterName = upper("ecs-${var.project}-${var.environment}")
    ServiceName = var.ecs_registro_workflow_name
  }

  alarm_actions = [var.registro_workflow_up_arn]
}

# ScalingDown CPU
resource "aws_cloudwatch_metric_alarm" "registro_workflow_service_cpu_low" {
  alarm_name          = "${var.repositories[3]}_cpu_utilization_low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "10"

  dimensions = {
    ClusterName = upper("ecs-${var.project}-${var.environment}")
    ServiceName = var.ecs_registro_workflow_name
  }

  alarm_actions = [var.registro_workflow_down_arn]
}
