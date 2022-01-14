provider "aws" {
  region = var.aws_region
}

#Lake Formation
resource "aws_lakeformation_resource" "example" {
  arn = aws_s3_bucket.my-s3-bucket.arn
}

#CMK Encrypted S3
resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl
  
   versioning {
    enabled = var.versioning
  }
  
  
    server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "arn:aws:kms:us-east-1:111807219796:key/a3334040-a211-4e3f-8b44-49e283caca6f"
        sse_algorithm     = "aws:kms"
      }
    }
  }
  
  tags = var.tags
}
