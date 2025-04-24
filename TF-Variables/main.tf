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

locals {
  owner = "mypoc"
  name = "mydemowork"
}

resource "aws_instance" "mypocinstance" {
 ami = "ami-0e449927258d45bc4"
 instance_type = var.instance_type
 subnet_id = "subnet-09d4d7a9dc0e61841"
 
#  root_block_device {
#    delete_on_termination = true
#    volume_size = var.root_volume_size
#    volume_type = var.root_volume_type
#  }

 root_block_device {
   delete_on_termination = true
   volume_size = var.ec2_config_values.v_size
   volume_type = var.ec2_config_values.v_type
 }

#  tags = {
#     Name = "sampleserver"
#  }

 tags = merge(var.additional_tags,{
    Name = "sampleserver"
    value = local.name
 })
}