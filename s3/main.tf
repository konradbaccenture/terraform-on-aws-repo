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

terraform {
  backend "s3" {
      bucket = "my-s3-bucket" 
      key    = "global/s3/terraform.tfstate"
      access_key = "AKIAQDCLLPPTNQDJA2MZ"
      secret_key = "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"

  }
}
