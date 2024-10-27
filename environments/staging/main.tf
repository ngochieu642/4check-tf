terraform {
  required_version = "1.9.8"

  backend "remote" {
    organization = "4Check"

    workspaces {
      name = "staging"
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
  # region same as prod
  region = "ap-southeast-1"
}
