# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A SECRETS MANAGER
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# jwt-enc

resource "aws_secretsmanager_secret" "secret_jwt_enc" {
  name        = "jwt-enc"
  description = "auth-service secret"
  recovery_window_in_days = 0
  tags = {
    "Manager" = var.manager
  }
}

# jwt-sig

resource "aws_secretsmanager_secret" "secret_jwt-sig" {
  name        = "jwt-sig"
  description = "jwt-sig secret"
  recovery_window_in_days = 0
  tags = {
    "Manager" = var.manager
  }
}

#reg-co

resource "aws_secretsmanager_secret" "secret_reg-co" {
  name        = "reg-co"
  description = "auth-service usaged"
  recovery_window_in_days = 0
  tags = {
    "Manager" = var.manager
  }
}
