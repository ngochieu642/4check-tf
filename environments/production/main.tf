terraform {
  required_version = "1.9.8"

  backend "remote" {
    organization = "4Check"

    workspaces {
      name = "production"
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
  # Closet to VN for minimum delay
  region = "ap-southeast-1"
}
