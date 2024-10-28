terraform {
  required_version = "1.9.8"

  backend "remote" {
    organization = "4Check"

    workspaces {
      name = "dev"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
  }
}

provider "aws" {
  # Cheapest region
  region     = "us-east-1"
  access_key = var.devops_account_access_key
  secret_key = var.devops_account_secret_key
}
