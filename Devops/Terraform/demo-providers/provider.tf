terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias = "us-east"
}

provider "aws" {
  region = "us-east-2"
  alias = "us-et"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "some-random-bucket-name-sdasdnsakndknkjs"
  provider = aws.us-et
}