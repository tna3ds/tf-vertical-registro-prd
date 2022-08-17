# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE ASG+ FOR AUTH SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_appautoscaling_target" "auth_target" {
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", upper("ecs-${var.project}-${var.environment}"), var.ecs_auth_name)
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = var.auth_min_task
  max_capacity       = var.auth_max_task
}

resource "aws_appautoscaling_policy" "auth_up" {
  name               = "${var.repositories[0]}_scale_up"
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", upper("ecs-${var.project}-${var.environment}"), var.ecs_auth_name)
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 1
    }
  }

  depends_on = [aws_appautoscaling_target.auth_target]
}

resource "aws_appautoscaling_policy" "auth_down" {
  name               = "${var.repositories[0]}_scale_down"
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", upper("ecs-${var.project}-${var.environment}"), var.ecs_auth_name)
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = -1
    }
  }

  depends_on = [aws_appautoscaling_target.auth_target]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE ASG+ FOR CATALOGO SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_appautoscaling_target" "catalogo_target" {
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", upper("ecs-${var.project}-${var.environment}"), var.ecs_catalogo_name)
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = var.catalogo_min_task
  max_capacity       = var.catalogo_max_task
}

resource "aws_appautoscaling_policy" "catalogo_up" {
  name               = "${var.repositories[1]}_scale_up"
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", upper("ecs-${var.project}-${var.environment}"), var.ecs_catalogo_name)
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 1
    }
  }

  depends_on = [aws_appautoscaling_target.catalogo_target]
}

resource "aws_appautoscaling_policy" "catalogo_down" {
  name               = "${var.repositories[1]}_scale_down"
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", upper("ecs-${var.project}-${var.environment}"), var.ecs_catalogo_name)
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = -1
    }
  }

  depends_on = [aws_appautoscaling_target.catalogo_target]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE ASG+ FOR PERSISTENCE SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_appautoscaling_target" "persistence_target" {
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", upper("ecs-${var.project}-${var.environment}"), var.ecs_persistence_name)
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = var.persistence_min_task
  max_capacity       = var.persistence_max_task
}

resource "aws_appautoscaling_policy" "persistence_up" {
  name               = "${var.repositories[2]}_scale_up"
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", upper("ecs-${var.project}-${var.environment}"), var.ecs_persistence_name)
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 1
    }
  }

  depends_on = [aws_appautoscaling_target.persistence_target]
}

resource "aws_appautoscaling_policy" "persistence_down" {
  name               = "${var.repositories[2]}_scale_down"
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", upper("ecs-${var.project}-${var.environment}"), var.ecs_persistence_name)
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = -1
    }
  }

  depends_on = [aws_appautoscaling_target.persistence_target]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE ASG+ FOR REGISTRO WORKFLOW SERVICES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_appautoscaling_target" "registro_workflow_target" {
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", upper("ecs-${var.project}-${var.environment}"), var.ecs_registro_workflow_name)
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = var.registro_workflow_min_task
  max_capacity       = var.registro_workflow_max_task
}

resource "aws_appautoscaling_policy" "registro_workflow_up" {
  name               = "${var.repositories[3]}_scale_up"
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", upper("ecs-${var.project}-${var.environment}"), var.ecs_registro_workflow_name)
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 1
    }
  }

  depends_on = [aws_appautoscaling_target.registro_workflow_target]
}

resource "aws_appautoscaling_policy" "registro_workflow_down" {
  name               = "${var.repositories[3]}_scale_down"
  service_namespace  = "ecs"
  resource_id        = format("service/%s/%s", upper("ecs-${var.project}-${var.environment}"), var.ecs_registro_workflow_name)
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = -1
    }
  }

  depends_on = [aws_appautoscaling_target.registro_workflow_target]
}
