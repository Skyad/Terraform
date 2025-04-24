variable "instance_type" {
  description = "what type of instance you want to cerate"
  type = string
#   default = "t2.micro"

  validation {
    condition = var.instance_type == "t2.micro" || var.instance_type == "t3.micro"
    error_message = "only t2 and t2 micro are allowed"
  }
}

# variable "root_volume_size" {
#   type = number
#   default = 8
# }

# variable "root_volume_type" {
#   type = string
#   default = "gp2"
# }

variable "ec2_config_values" {
  type = object({
    v_size = number
    v_type = string
  })
  default = {
    v_size = 8
    v_type = "gp2"
  }
}

variable "additional_tags" {
  type = map(string) # tags will be in key value format
  default = {
    "key1" = "value1"
    "key2" = "value2"
  }
}


###### setting up the environment variable #########
# export TF_VAR_instance_type=t2.micro

###### setting up the -var & -var-file variable #########
# terraform plan -var = '

## Priority of variables ##
# 1. -var & -var-file
# 2. *.auto.tfvars
# 3. terraform.tfvars
# 4. environment variablles


