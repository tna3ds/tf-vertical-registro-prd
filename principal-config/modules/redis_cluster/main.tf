# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE AN ELASTICACHE REDIS CLUSTER
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name        = lower("redis-subnet-groups-${var.project}-${var.environment}")
  subnet_ids  = var.private_subnets_id
  description = lower("Redis subnet group for ${var.project} ${var.environment}")

  tags = {
    "Manager" = var.manager
  }

  depends_on = [
    var.private_subnets_id
  ]
}

resource "aws_elasticache_replication_group" "redis_replica_group" {
  replication_group_id = lower("redis-cluster-${var.project}-${var.environment}")
  description          = lower("Redis cluster for ${var.project} ${var.environment}")
  node_type            = "cache.t4g.medium"

  port                       = 6379
  engine_version             = "6.2"
  num_node_groups            = 1
  parameter_group_name       = "default.redis6.x"
  subnet_group_name          = aws_elasticache_subnet_group.redis_subnet_group.name
  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  apply_immediately          = true
  #multi_az_enabled           = true
  #automatic_failover_enabled = true

  security_group_ids = [var.sg_redis_id]

  log_delivery_configuration {
    destination      = var.redis_slow_logs_name
    destination_type = "cloudwatch-logs"
    log_format       = "json"
    log_type         = "slow-log"
  }
  log_delivery_configuration {
    destination      = var.redis_engine_logs_name
    destination_type = "cloudwatch-logs"
    log_format       = "json"
    log_type         = "engine-log"
  }

  tags = {
    "Manager" = var.manager
  }

  depends_on = [
    var.redis_slow_logs_name, var.redis_engine_logs_name
  ]
}
