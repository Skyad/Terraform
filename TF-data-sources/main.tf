terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.92.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

#----------------------------------------

# AMI- Amazon machine image
data "aws_ami" "name" {
  most_recent = true
  owners = ["amazon"]
}

output "aws-ami-id" {
  value = data.aws_ami.name.id
}

#-----------------------------------------

#Security group
data "aws_security_group" "name" {
  tags = {
    ec2server = "test"
  }
}

output "security_group" {
  value = data.aws_security_group.name.id
}

#------------------------------------------

#VPC Id
data "aws_vpc" "name" {
  tags = {
    Name = "my-vpc-tf-poc"
  }
}

output "vpc_id" {
  value = data.aws_vpc.name.id
}

#------------------------------------------

#Availability zones
data "aws_availability_zones" "names" {
    state = "available"
}

output "zones" {
    value = data.aws_availability_zones.names
}

#--------------------------------------------

#caller identity
data "aws_caller_identity" "name" {
}

output "caller_id" {
  value = data.aws_caller_identity.name  
}

#---------------------------------------------

#Region name
data "aws_region" "name" {
}

output "region_name" {
  value = data.aws_region.name
}

#----------------------------------------------

#Subnet Id
data "aws_subnet" "name" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.name.id]
  }
  tags = {
    Name = "private-subnet"
  }
}

output "name" {
  value = data.aws_subnet.name.id
}

#---------------------------------------------

resource "aws_instance" "mypocinstance" {
  ami = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.name.id
  security_groups = [ data.aws_security_group.name.id ]

  tags = {
    Name = "sampleserver"
}
}