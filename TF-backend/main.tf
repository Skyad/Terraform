
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.91.0"
    }
  }
  backend "s3" {
    bucket = "tf-poc-bucket-ebe90b0b93163f47"
    key = "backend.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "mypocinstance" {
 ami = "ami-08b5b3a93ed654d19"
 instance_type = "t2.micro"

 tags = {
    Name = "sampleserver"
 }
}