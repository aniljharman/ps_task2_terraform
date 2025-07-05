terraform {
  required_version = ">= 1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = var.state_bucket
    key            = "poc/terraform.tfstate"
    region         = var.aws_region
  }
}

provider "aws" {
  region = var.aws_region
}
