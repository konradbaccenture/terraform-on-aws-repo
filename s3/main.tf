provider "aws" {
  region = var.aws_region
}

#Lake Formation
data "aws_caller_identity" "current" {}

data "aws_iam_session_context" "current" {
  arn = data.aws_caller_identity.current.arn
}

resource "aws_lakeformation_data_lake_settings" "test" {
  admins = [data.aws_iam_session_context.current.issuer_arn]
}

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
        kms_master_key_id = "arn:aws:kms:us-east-1:073510484680:key/bf2c50ad-5ccb-44ef-be1d-9907bef76182"
        sse_algorithm     = "aws:kms"
      }
    }
  }
  
  tags = var.tags
}
