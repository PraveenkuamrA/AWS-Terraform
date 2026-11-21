# Terraform Settings Block
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = ">= 4.65"
      version = ">= 5.31"
     }
    helm = {
      source = "hashicorp/helm"
      #version = "2.4.1"
      #version = "~> 2.4"
      version = "~> 2.9"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      #version = "2.1.0"
      #version = "~> 2.1"
      version = ">= 2.20"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "tfstate-dev-us-east-1-praveen-statefile1"
    key    = "external-dns/dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile  = true
  }     
}

# Terraform AWS Provider Block
provider "aws" {
  region = var.aws_region
}
