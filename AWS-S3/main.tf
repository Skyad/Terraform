terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.91.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.1"
    }
  }
}

resource "random_id" "ran_id" {
  byte_length = 8
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "poc-bucket" {
  bucket = "tf-poc-bucket-${random_id.ran_id.hex}"
}

resource "aws_s3_object" "bucket_data" {
  bucket = aws_s3_bucket.poc-bucket.bucket
  source = "./myfile.txt"
  key = "mydata.txt"
}

output "name" {
  value = random_id.ran_id.hex
}