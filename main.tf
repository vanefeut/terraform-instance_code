# PROJECT NAME
#____________________________________________________
# Module and file layout isolation implementation
#____________________________________________________
# This file contains the module code that will be called from prod and stage
# Author: Kennedy .N
# Created: 6/3/2023
#____________________________________________________

provider "aws" {
  region = var.region
}
# Create vpc from an existing module in terraform-aws-modules/vpc/aws
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["192.168.1.0/24", "192.168.2.0/24"]
  public_subnets  = ["192.168.101.0/24", "192.168.102.0/24"]

enable_nat_gateway = false
enable_vpn_gateway = false
enable_dns_hostnames = true

  tags = {
    Name: "${var.vpc_name}"
    env:  "${var.env}"
    team: "${var.team}"
    created-by: "${var.owner}"
}
}

# Generate a secure key using a rsa algorithm
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# creating the keypair in aws
resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_key.public_key_openssh 
}

# Save the .pem file locally for remote connection
resource "local_file" "ssh_key" {
  filename = "terraform.pem"
  content  = tls_private_key.ec2_key.private_key_pem
}

 #create the ec2 instance
resource "aws_instance" "server" {

  ami           = "ami-0393ee318b08f4511"
  instance_type = var.instance_type
  key_name      = aws_key_pair.ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  tags = {
    Name = var.ec2_instance_name
    Env  = var.team
  }
}

