
# Vertical Registro
Terraform template for deployment of infrastructure in the AWS Cloud Project Vertical Registro

## Installation
Use the binary [terraform](https://www.terraform.io/downloads) to init project.


## Usage
```bash
# init
terraform init -backend-config="config/prod-bancked.conf"

# plan
terraform plan -var-file="config/prod.tfvars"

# apply
terraform apply -auto-approve -var-file="config/prod.tfvars"
```

## License
[DAVIPLATA](https://daviplata.com/)