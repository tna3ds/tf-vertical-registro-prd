#PROJECT DETAILS
aws_region                 = "us-east-2"
environment                = "prd"
project                    = "cn"
manager                    = "Terraform"
s3_cloudfront_name         = "registro"
dns                        = "prod.cn.api.daviplata.com"
cognito_callback_urls_name = "persistence/v1/"

#VPC-SUBNETS
vpc_id = "vpc-09ca485f0eb46cc98"
azs = [
  "us-east-2a",
  "us-east-2b",
  "us-east-2c"
]
azs_name = [
  "aza",
  "azb",
  "azc"
]
private_subnets = [
  "10.231.80.0/26",
  "10.231.80.64/26",
  "10.231.80.128/26"
]
public_subnets = [
  "10.231.80.192/28",
  "10.231.80.208/28",
  "10.231.80.224/28"
]
repositories = [
  "auth",
  "catalogo",
  "persistence",
  "registro-workflow"
]

#IAM-ROLES-POLICIES
ecs_task_execution_role_policies_name = [
  "SecretsManagerReadWrite",
  "AmazonElastiCacheFullAccess",
  "AmazonDynamoDBFullAccess",
  "AmazonSSMManagedInstanceCore",
  "AmazonECSTaskExecutionRolePolicy"
]

ecs_task_auth_policies_name = [
  "SecretsManagerReadWrite",
  "AmazonSSMManagedInstanceCore"
]

ecs_task_catalogo_policies_name = [
  "AmazonElastiCacheFullAccess",
  "AmazonDynamoDBFullAccess",
  "AmazonSSMManagedInstanceCore"
]

ecs_task_persistence_policies_name = [
  "AmazonElastiCacheFullAccess",
  "AmazonDynamoDBFullAccess",
  "AmazonSSMManagedInstanceCore"
]

ecs_task_registro-workflow_policies_name = [
  "AmazonSSMManagedInstanceCore"
]