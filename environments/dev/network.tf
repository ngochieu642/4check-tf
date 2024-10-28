module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.14.0"

  name                 = "dev-api-vpc"
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  single_nat_gateway   = true

  tags = {
    Environment = "dev"
    Project     = "4Check"
  }
}

resource "aws_security_group" "application_sg" {
  name_prefix            = "applicationSG-dev"
  vpc_id                 = module.vpc.vpc_id
  description            = "Application Security Group for Dev environment"
  revoke_rules_on_delete = true

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allows all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}
