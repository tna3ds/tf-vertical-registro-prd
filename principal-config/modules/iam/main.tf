# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A IAM ROLE FOR ECS TASK EXECUTION 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_iam_role" "ecs_task_role" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
  tags = {
    "Manager" = var.manager
  }
}
resource "aws_iam_role_policy_attachment" "ecs_task_role_policy_attach" {
  role       = aws_iam_role.ecs_task_role.name
  count      = length(var.ecs_task_execution_role_policies_name)
  policy_arn = element(data.aws_iam_policy.ecs_task_policy_data.*.id, count.index)
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A IAM ROLE FOR ECS TASK AUTH SERVICE 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_iam_role" "ecs_task_auth" {
  name               = "taskRole_auth_service"
  assume_role_policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
  tags = {
    "Manager" = var.manager
  }
}
resource "aws_iam_role_policy_attachment" "ecs_task_auth_policy_attach" {
  role       = aws_iam_role.ecs_task_auth.name
  count      = length(var.ecs_task_auth_policies_name)
  policy_arn = element(data.aws_iam_policy.ecs_task_auth_data.*.id, count.index)
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A IAM ROLE FOR ECS TASK CATALOGO SERVICE 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_iam_role" "ecs_task_catalgo" {
  name               = "taskRole_catalogo_service"
  assume_role_policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
  tags = {
    "Manager" = var.manager
  }
}
resource "aws_iam_role_policy_attachment" "ecs_task_catalgo_policy_attach" {
  role       = aws_iam_role.ecs_task_catalgo.name
  count      = length(var.ecs_task_catalogo_policies_name)
  policy_arn = element(data.aws_iam_policy.ecs_task_catalgo_data.*.id, count.index)
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A IAM ROLE FOR ECS TASK PERSISTENCE SERVICE 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_iam_role" "ecs_task_persistence" {
  name               = "taskRole_persistence_service"
  assume_role_policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
  tags = {
    "Manager" = var.manager
  }
}
resource "aws_iam_role_policy_attachment" "ecs_task_persistence_policy_attach" {
  role       = aws_iam_role.ecs_task_persistence.name
  count      = length(var.ecs_task_persistence_policies_name)
  policy_arn = element(data.aws_iam_policy.ecs_task_persistence_data.*.id, count.index)
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A IAM ROLE FOR ECS TASK REGISTRO WORKFLOW SERVICE 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_iam_role" "ecs_task_registro-workflow" {
  name               = "taskRole_registro-workflow_service"
  assume_role_policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "ecs-tasks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
  tags = {
    "Manager" = var.manager
  }
}
resource "aws_iam_role_policy_attachment" "ecs_task_registro-workflow_policy_attach" {
  role       = aws_iam_role.ecs_task_registro-workflow.name
  count      = length(var.ecs_task_registro-workflow_policies_name)
  policy_arn = element(data.aws_iam_policy.ecs_task_registro-workflow_data.*.id, count.index)
}
