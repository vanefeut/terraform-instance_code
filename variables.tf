
# PROJECT BRANCH-------------------------------------------Module.variables
#____________________________________________________
#Module and file layout isolation implementation
#____________________________________________________
# This file contains variables definition for use by the  module in spinning VPC and EC2 instance.
# Author: Kennedy .N
#____________________________________________________

#

variable "region" {
    description = "this is the region"
    default = "us-east-1"
  }


#Vpc variable
variable "vpc_name" {
    description = "this is the virtual private cloud name"
    type = string
    default = "my-vpc"
  
}

variable "vpc_cidr" {
    default = "192.168.0.0/16"
    description = "this is the vpc cidr block"
    type = string
  
}

# CIDR block variable
variable "cblock" {
    description = "this is the CIDR Block"
    type = string
    default = "10.0.0.0/16"
}


# Security group variable
variable "sg_name" {
    description = "this is the name of security group"
    type = string
    default = "Web-sg-dev"
}  


variable "team" {
    description= "This is the team"
    type= string
    default= "Team Serge"    
}

variable "owner" {
    description= "This is the owner"
    type= string 
    default= "Kennedy N"   
}

variable "ec2_instance_name" {
    description = "this is the  ec2 instance name"
    type = string
    default = "utrains-ec2"
  
}

variable "key_name" {
    description = "this is the  aws ec2 key-pair name"
    type = string
    default = "utrains-ec2-key"
  
}


variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
  default="t3.micro"
}


variable "env" {
    description = "this is the  environment name"
    type = string
    default="t3.micro"
}

