data "aws_ecs_cluster" "ecs_cluster_data" {
  cluster_name = upper("ecs-${var.project}-${var.environment}")
}

data "aws_security_group" "sg_ecs_data" {
  name = upper("sg-ecs-${var.project}-${var.environment}")
}

data "aws_subnet" "private_subnets_data" {
  count = length(var.private_subnets_id)
  id    = var.private_subnets_id[count.index]
}
