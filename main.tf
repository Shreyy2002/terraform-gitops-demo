terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "random_id" "id" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo" {
  bucket = "gitops-demo-${random_id.id.hex}"
  tags = {
    Name        = "Terraform GitOps POC"
    Environment = var.environment
  }
}

output "bucket_name" {
  value = aws_s3_bucket.demo.bucket
}

# test comment.
