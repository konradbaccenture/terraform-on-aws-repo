provider "aws" {
  region = var.aws_region
}

#Lake Formation

resource "aws_lakeformation_data_lake_settings" "myLakeSettings" {

  admins = ["arn:aws:iam::073510484680:role/s3_and_lake_formation"]

  create_database_default_permissions {
    permissions = ["ALL"]
    principal   = "IAM_ALLOWED_PRINCIPALS"
  }

  create_table_default_permissions {
    permissions = ["ALL"]
    principal   = "IAM_ALLOWED_PRINCIPALS"
  }

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
