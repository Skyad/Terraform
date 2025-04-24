
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.91.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "mypocinstance" {
 ami = "ami-08b5b3a93ed654d19"
 instance_type = "t2.micro"

 tags = {
    Name = "sampleserver"
 }
}