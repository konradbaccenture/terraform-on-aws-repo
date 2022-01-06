provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl
  
   versioning {
    enabled = var.versioning
  }
  
  
    server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "arn:aws:kms:us-east-1:859661026757:key/fbb39b62-bf60-4f1b-81eb-248e64a9e7d5"
        sse_algorithm     = "aws:kms"
      }
    }
  }
  
  tags = var.tags
}
