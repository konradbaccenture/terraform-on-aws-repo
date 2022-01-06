provider "aws" {
  region = var.aws_region
}



resource "aws_s3_bucket" "KMS_bucket" {
  bucket_prefix = "KMS_bucket"
  acl = var.acl
  
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}
