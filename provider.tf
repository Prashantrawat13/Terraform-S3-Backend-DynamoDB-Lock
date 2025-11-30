terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.23.0"
    }
  }
}

provider "aws" {
  # secret_key = "Your secret key here"
  # access_key = "Your access key here"
  region = var.region
}