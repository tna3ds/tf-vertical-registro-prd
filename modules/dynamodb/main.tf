# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE ASSET REGISTRO 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "asset_registro" {
  name           = "asset-registro"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "idKey"
  attribute {
    name = "idKey"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# read

resource "aws_appautoscaling_target" "asset_registro_target_read" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table.asset_registro.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "asset_registro_target_read_policy" {
  name               = "dynamodb-read-capacity-utilization-${aws_appautoscaling_target.asset_registro_target_read.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.asset_registro_target_read.resource_id
  scalable_dimension = aws_appautoscaling_target.asset_registro_target_read.scalable_dimension
  service_namespace  = aws_appautoscaling_target.asset_registro_target_read.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }
    target_value = 70
  }
}

# write

resource "aws_appautoscaling_target" "asset_registro_target_write" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table.asset_registro.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "asset_registro_target_write_policy" {
  name               = "dynamodb-write-capacity-utilization-${aws_appautoscaling_target.asset_registro_target_write.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.asset_registro_target_write.resource_id
  scalable_dimension = aws_appautoscaling_target.asset_registro_target_write.scalable_dimension
  service_namespace  = aws_appautoscaling_target.asset_registro_target_write.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }
    target_value = 70
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE CATALGO REGISTRO 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "catalogo-registro" {
  name           = "catalogo-registro"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "idKey"
  attribute {
    name = "idKey"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# read

resource "aws_appautoscaling_target" "catalogo-registro_target_read" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table.catalogo-registro.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "catalogo-registro_target_read_policy" {
  name               = "dynamodb-read-capacity-utilization-${aws_appautoscaling_target.catalogo-registro_target_read.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.catalogo-registro_target_read.resource_id
  scalable_dimension = aws_appautoscaling_target.catalogo-registro_target_read.scalable_dimension
  service_namespace  = aws_appautoscaling_target.catalogo-registro_target_read.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }
    target_value = 70
  }
}

# write

resource "aws_appautoscaling_target" "catalogo-registro_target_write" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table.catalogo-registro.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "catalogo-registro_target_write_policy" {
  name               = "dynamodb-write-capacity-utilization-${aws_appautoscaling_target.catalogo-registro_target_write.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.catalogo-registro_target_write.resource_id
  scalable_dimension = aws_appautoscaling_target.catalogo-registro_target_write.scalable_dimension
  service_namespace  = aws_appautoscaling_target.catalogo-registro_target_write.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }
    target_value = 70
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE OTPBL 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "otpbl" {
  name           = "otpbl"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "idKey"
  attribute {
    name = "idKey"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# read

resource "aws_appautoscaling_target" "otpbl_target_read" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table.otpbl.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "otpbl_target_read_policy" {
  name               = "dynamodb-read-capacity-utilization-${aws_appautoscaling_target.otpbl_target_read.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.otpbl_target_read.resource_id
  scalable_dimension = aws_appautoscaling_target.otpbl_target_read.scalable_dimension
  service_namespace  = aws_appautoscaling_target.otpbl_target_read.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }
    target_value = 70
  }
}

# write

resource "aws_appautoscaling_target" "otpbl_target_write" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table.otpbl.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "otpbl_target_write_policy" {
  name               = "dynamodb-write-capacity-utilization-${aws_appautoscaling_target.otpbl_target_write.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.otpbl_target_write.resource_id
  scalable_dimension = aws_appautoscaling_target.otpbl_target_write.scalable_dimension
  service_namespace  = aws_appautoscaling_target.otpbl_target_write.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }
    target_value = 70
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE PARAMS REGISTRO
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "parms-registro" {
  name           = "parms-registro"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "idKey"
  attribute {
    name = "idKey"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# read

resource "aws_appautoscaling_target" "parms-registro_target_read" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table.parms-registro.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "parms-registro_target_read_policy" {
  name               = "dynamodb-read-capacity-utilization-${aws_appautoscaling_target.parms-registro_target_read.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.parms-registro_target_read.resource_id
  scalable_dimension = aws_appautoscaling_target.parms-registro_target_read.scalable_dimension
  service_namespace  = aws_appautoscaling_target.parms-registro_target_read.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }
    target_value = 70
  }
}

# write

resource "aws_appautoscaling_target" "parms-registro_target_write" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table.parms-registro.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "parms-registro_target_write_policy" {
  name               = "dynamodb-write-capacity-utilization-${aws_appautoscaling_target.parms-registro_target_write.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.parms-registro_target_write.resource_id
  scalable_dimension = aws_appautoscaling_target.parms-registro_target_write.scalable_dimension
  service_namespace  = aws_appautoscaling_target.parms-registro_target_write.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }
    target_value = 70
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE REGISTROWSE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "registrowse" {
  name           = "registrowse"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "idKey"
  attribute {
    name = "idKey"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# read

resource "aws_appautoscaling_target" "registrowse_target_read" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table.registrowse.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "registrowse_target_read_policy" {
  name               = "dynamodb-read-capacity-utilization-${aws_appautoscaling_target.registrowse_target_read.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.registrowse_target_read.resource_id
  scalable_dimension = aws_appautoscaling_target.registrowse_target_read.scalable_dimension
  service_namespace  = aws_appautoscaling_target.registrowse_target_read.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }
    target_value = 70
  }
}

# write

resource "aws_appautoscaling_target" "registrowse_target_write" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table.registrowse.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "registrowse_target_write_policy" {
  name               = "dynamodb-write-capacity-utilization-${aws_appautoscaling_target.registrowse_target_write.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.registrowse_target_write.resource_id
  scalable_dimension = aws_appautoscaling_target.registrowse_target_write.scalable_dimension
  service_namespace  = aws_appautoscaling_target.registrowse_target_write.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }
    target_value = 70
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE RTNBL
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "rtnbl" {
  name           = "rtnbl"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "idKey"
  attribute {
    name = "idKey"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# read

resource "aws_appautoscaling_target" "rtnbl_target_read" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table.rtnbl.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "rtnbl_target_read_policy" {
  name               = "dynamodb-read-capacity-utilization-${aws_appautoscaling_target.rtnbl_target_read.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.rtnbl_target_read.resource_id
  scalable_dimension = aws_appautoscaling_target.rtnbl_target_read.scalable_dimension
  service_namespace  = aws_appautoscaling_target.rtnbl_target_read.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }
    target_value = 70
  }
}

# write

resource "aws_appautoscaling_target" "rtnbl_target_write" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table.rtnbl.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "rtnbl_target_write_policy" {
  name               = "dynamodb-write-capacity-utilization-${aws_appautoscaling_target.rtnbl_target_write.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.rtnbl_target_write.resource_id
  scalable_dimension = aws_appautoscaling_target.rtnbl_target_write.scalable_dimension
  service_namespace  = aws_appautoscaling_target.rtnbl_target_write.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }
    target_value = 70
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE _KINDS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "_kinds" {
  name           = "_kinds"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "kind"
  attribute {
    name = "kind"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# read

resource "aws_appautoscaling_target" "_kinds_target_read" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table._kinds.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "_kinds_target_read_policy" {
  name               = "dynamodb-read-capacity-utilization-${aws_appautoscaling_target._kinds_target_read.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target._kinds_target_read.resource_id
  scalable_dimension = aws_appautoscaling_target._kinds_target_read.scalable_dimension
  service_namespace  = aws_appautoscaling_target._kinds_target_read.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }
    target_value = 70
  }
}

# write

resource "aws_appautoscaling_target" "_kinds_target_write" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "table/${aws_dynamodb_table._kinds.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "_kinds_target_write_policy" {
  name               = "dynamodb-write-capacity-utilization-${aws_appautoscaling_target._kinds_target_write.resource_id}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target._kinds_target_write.resource_id
  scalable_dimension = aws_appautoscaling_target._kinds_target_write.scalable_dimension
  service_namespace  = aws_appautoscaling_target._kinds_target_write.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }
    target_value = 70
  }
}
