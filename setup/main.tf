terraform {
  required_version = "1.9.8"

  backend "remote" {
    organization = "4Check"

    workspaces {
      name = "setup"
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
  region = "us-east-1"
  access_key = var.root_access_key
  secret_key = var.root_secret_key
}

