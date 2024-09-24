terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket         = var.s3_bucket_name
    key            = "${var.environment}/terraform.tfstate"
    region         = var.s3_region
    dynamodb_table = var.dynamodb_table
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}
