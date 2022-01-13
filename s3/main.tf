provider "aws" {
  region = var.aws_region
}

#Lake Formation
data "aws_s3_bucket" "example" {
  bucket = "an-example-bucket"
}

resource "aws_lakeformation_resource" "example" {
  arn = data.aws_s3_bucket.example.arn
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
