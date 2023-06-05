
# PROJECT BRANCH-------------------------------------------Module.sg
#____________________________________________________
#Module and file layout isolation implementation
#____________________________________________________
# This file contains security group infrastructure.
# Author: Kennedy .N
# Created: 6/3/2023
#____________________________________________________
#

locals {
  http_port    = 80
  any_port     = 0
  ssh_port     = 22
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
}


# create security group

resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = "allow traffic on 22 and 80"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "22 for ssh"
    from_port        = local.ssh_port
    to_port          = local.ssh_port
    protocol         = local.tcp_protocol
    cidr_blocks      = local.all_ips
   
  }
   ingress {
    description      = "80 for http"
    from_port        = local.http_port
    to_port          = local.http_port
    protocol         = local.tcp_protocol
    cidr_blocks      = local.all_ips
   
  }

  egress {
    from_port        = local.any_port
    to_port          = local.any_port
    protocol         = local.any_protocol
    cidr_blocks      = local.all_ips
    
  }

  tags = {
    Name = var.sg_name
    Team = var.team
    owner = var.owner
  }
}