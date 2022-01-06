provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl
  
   versioning {
    enabled = var.versioning
  }
  
  kms_key_arn = "arn:aws:kms:us-east-1:859661026757:key/fbb39b62-bf60-4f1b-81eb-248e64a9e7d5"
  
  tags = var.tags
}
