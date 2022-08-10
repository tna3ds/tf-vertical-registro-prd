# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE ASSET REGISTRO 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "asset_registro" {
  name         = "asset-registro"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "idKey"
  attribute {
    name = "idKey"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE CATALGO REGISTRO 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "catalogo-registro" {
  name         = "catalogo-registro"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "idKey"
  attribute {
    name = "idKey"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE OTPBL 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "otpbl" {
  name         = "otpbl"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "idKey"
  attribute {
    name = "idKey"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE PARAMS REGISTRO
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "parms-registro" {
  name         = "parms-registro"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "idKey"
  attribute {
    name = "idKey"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE REGISTROWSE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "registrowse" {
  name         = "registrowse"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "idKey"
  attribute {
    name = "idKey"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE RTNBL
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "rtnbl" {
  name         = "rtnbl"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "idKey"
  attribute {
    name = "idKey"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE DYNAMODB TABLE _KINDS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_dynamodb_table" "_kinds" {
  name         = "_kinds"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "kind"
  attribute {
    name = "kind"
    type = "S"
  }

  tags = {
    "Manager" = var.manager
  }
}
