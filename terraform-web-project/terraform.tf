terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.49.0"
    }
  }

  backend "s3" {
    bucket = "terrafrom-s3-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.REGION
}

