terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }

  backend "s3" {
    bucket  = "cloud5-terraform-state-625ed4fe"
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}