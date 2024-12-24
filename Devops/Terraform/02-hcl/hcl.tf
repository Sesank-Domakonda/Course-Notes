terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

resource "aws_s3_bucket" "my_external_bucket" { //my-bucket is the internal name given to the resouce (aws_s3_bucket)
  bucket = var.bucket_name                      // this is the actual name of S3 bucket that will be created in aws.
}

data "aws_s3_bucket" "my_bucket" { // we declared this block to be able to access properties of existing S3 bucket named "not-managed-by-us"
  bucket = "not_managed-by-us"
}

variable "bucket_name" { // similar to function parameters
  type        = string
  description = "My variable used to set bucket name"
  default     = "my_default_bucket_name"

}

output "bucket_id" {
  value = aws_s3_bucket.my_external_bucket.id
}


locals {
  local_example = "This is a local variable"
}

module "my_module" {
  source = "../01-benifits-iac"
}

