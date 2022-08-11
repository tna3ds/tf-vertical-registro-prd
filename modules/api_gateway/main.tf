# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE AN API GATEWAY
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_apigatewayv2_api" "api_gateway_registro" {
  name          = "${var.project}-daviplata-${var.environment}"
  description   = upper("API ${var.project} ${var.environment}")
  protocol_type = "HTTP"

  tags = {
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A HTTP VPC LINK
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_apigatewayv2_vpc_link" "http_vpc_link" {
  name               = "VPCLink-${var.alb_priv_name}"
  security_group_ids = [var.sg_alb_id]
  subnet_ids         = var.private_subnets_id

  tags = {
    "Manager" = var.manager
  }

  depends_on = [
    var.private_subnets_id, var.sg_alb_id
  ]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A ROUTE METHODS FOR AUTH
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# KEYSTORE

#@GET
resource "aws_apigatewayv2_route" "auth_keystore_get" {
  api_id    = aws_apigatewayv2_api.api_gateway_registro.id
  route_key = "GET /auth/v1/keystore/.well-known/jwks.json"

  target = "integrations/${aws_apigatewayv2_integration.vpclink_load-balancer_integration_get.id}"

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link
  ]
}

#@OPTIONS
resource "aws_apigatewayv2_route" "auth_keystore_options" {
  api_id    = aws_apigatewayv2_api.api_gateway_registro.id
  route_key = "OPTIONS /auth/v1/keystore/.well-known/jwks.json"

  target = "integrations/${aws_apigatewayv2_integration.vpclink_load-balancer_integration_options.id}"

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link
  ]
}

# TOKEN

#@POST
resource "aws_apigatewayv2_route" "auth_token_get" {
  api_id    = aws_apigatewayv2_api.api_gateway_registro.id
  route_key = "POST /auth/v1/token"

  target = "integrations/${aws_apigatewayv2_integration.vpclink_load-balancer_integration_post.id}"

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link
  ]
}

#@OPTIONS
resource "aws_apigatewayv2_route" "auth_token_options" {
  api_id    = aws_apigatewayv2_api.api_gateway_registro.id
  route_key = "OPTIONS /auth/v1/token"

  target = "integrations/${aws_apigatewayv2_integration.vpclink_load-balancer_integration_options.id}"

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link
  ]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A ROUTE METHODS FOR CATALOGO
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# DATA

#@GET
resource "aws_apigatewayv2_route" "catalogo_data_get" {
  api_id    = aws_apigatewayv2_api.api_gateway_registro.id
  route_key = "GET /catalogo/v1/data/{proxy+}"

  target = "integrations/${aws_apigatewayv2_integration.vpclink_load-balancer_integration_get.id}"

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link
  ]
}

#@OPTIONS
resource "aws_apigatewayv2_route" "catalogo_data_options" {
  api_id    = aws_apigatewayv2_api.api_gateway_registro.id
  route_key = "OPTIONS /catalogo/v1/data/{proxy+}"

  target = "integrations/${aws_apigatewayv2_integration.vpclink_load-balancer_integration_options.id}"

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link
  ]
}

# ASSET

#GET
resource "aws_apigatewayv2_route" "catalogo_asset_get" {
  api_id    = aws_apigatewayv2_api.api_gateway_registro.id
  route_key = "GET /catalogo/v1/asset/{proxy+}"

  target = "integrations/${aws_apigatewayv2_integration.vpclink_load-balancer_integration_get.id}"

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link
  ]
}

#OPTIONS
resource "aws_apigatewayv2_route" "catalogo_asset_options" {
  api_id    = aws_apigatewayv2_api.api_gateway_registro.id
  route_key = "OPTIONS /catalogo/v1/asset/{proxy+}"

  target = "integrations/${aws_apigatewayv2_integration.vpclink_load-balancer_integration_options.id}"

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link
  ]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A ROUTE METHODS FOR REGISTROW
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# WORKFLOW

#@POST
resource "aws_apigatewayv2_route" "registrow_workflow_post" {
  api_id             = aws_apigatewayv2_api.api_gateway_registro.id
  route_key          = "POST /registrow/v1/workflow"
  authorization_type = "JWT"
  authorizer_id      = aws_apigatewayv2_authorizer.api_authorizer_registro.id

  target = "integrations/${aws_apigatewayv2_integration.vpclink_load-balancer_integration_post.id}"

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link
  ]
}

#@OPTIONS
resource "aws_apigatewayv2_route" "registrow_workflow_options" {
  api_id    = aws_apigatewayv2_api.api_gateway_registro.id
  route_key = "OPTIONS /registrow/v1/workflow"

  target = "integrations/${aws_apigatewayv2_integration.vpclink_load-balancer_integration_options.id}"

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link
  ]
}

# PRESENTACION CLIENTE

#POST
resource "aws_apigatewayv2_route" "registrow_presentacion_cliente_post" {
  api_id             = aws_apigatewayv2_api.api_gateway_registro.id
  route_key          = "POST /registrow/v1/presentacion-cliente"
  authorization_type = "JWT"
  authorizer_id      = aws_apigatewayv2_authorizer.api_authorizer_registro.id

  target = "integrations/${aws_apigatewayv2_integration.vpclink_load-balancer_integration_post.id}"

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link
  ]
}

#OPTIONS
resource "aws_apigatewayv2_route" "registrow_presentacion_cliente_options" {
  api_id    = aws_apigatewayv2_api.api_gateway_registro.id
  route_key = "OPTIONS /registrow/v1/presentacion-cliente"

  target = "integrations/${aws_apigatewayv2_integration.vpclink_load-balancer_integration_options.id}"

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link
  ]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A ROUTE AUTHORIZATION WITH COGNITO USER POOL
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_apigatewayv2_authorizer" "api_authorizer_registro" {
  api_id           = aws_apigatewayv2_api.api_gateway_registro.id
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]
  name             = "${var.project}-daviplata-${var.environment}-cognito-authorizer"

  jwt_configuration {
    audience = ["${var.cognito_user_pool_autorizer_id}"]
    issuer   = "https://${var.cognito_user_pool_endpoint}"
  }

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    var.cognito_user_pool_endpoint
  ]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE AN INTEGRATION WITH LOAD BALANCER AND VPCLINK
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#@GET
resource "aws_apigatewayv2_integration" "vpclink_load-balancer_integration_get" {
  api_id           = aws_apigatewayv2_api.api_gateway_registro.id
  integration_type = "HTTP_PROXY"

  integration_uri    = var.lister_alb_priv_arn
  integration_method = "GET"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.http_vpc_link.id

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link,
    var.lister_alb_priv_arn
  ]
}

#@POST
resource "aws_apigatewayv2_integration" "vpclink_load-balancer_integration_post" {
  api_id           = aws_apigatewayv2_api.api_gateway_registro.id
  integration_type = "HTTP_PROXY"

  integration_uri    = var.lister_alb_priv_arn
  integration_method = "POST"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.http_vpc_link.id

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link,
    var.lister_alb_priv_arn
  ]
}

#@OPTIONS
resource "aws_apigatewayv2_integration" "vpclink_load-balancer_integration_options" {
  api_id           = aws_apigatewayv2_api.api_gateway_registro.id
  integration_type = "HTTP_PROXY"

  integration_uri    = var.lister_alb_priv_arn
  integration_method = "OPTIONS"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.http_vpc_link.id

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro,
    aws_apigatewayv2_vpc_link.http_vpc_link,
    var.lister_alb_priv_arn
  ]
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE AN STAGE FOR DEPLOY API
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_apigatewayv2_stage" "registro_stage" {
  api_id      = aws_apigatewayv2_api.api_gateway_registro.id
  name        = var.environment
  auto_deploy = true

  tags = {
    "Manager" = var.manager
  }

  depends_on = [
    aws_apigatewayv2_api.api_gateway_registro
  ]
}
