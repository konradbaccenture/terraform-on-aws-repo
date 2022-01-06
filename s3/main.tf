provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl
  
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = "KMS_bucket"
  acl = var.acl
  
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = "CMK_bucket"
  acl = var.acl
  
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}
