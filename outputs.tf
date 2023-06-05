# PROJECT BRANCH-------------------------------------------Module.outputs
#____________________________________________________
#Module and file layout isolation implementation
#____________________________________________________
# This file contains module outputs
# Author: Kennedy .N
# Created: 6/3/2023
#____________________________________________________
#

output "vcpid" {
  value = module.vpc.vpc_id 
}

output "dns_name" {
  value = aws_instance.server.public_dns
}

output "instance_public_ip" {
  value = aws_instance.server.public_ip
}


output "instance_type" {
  value = aws_instance.server.instance_type
}

output "instance_name" {
  value = aws_instance.server.tags["Name"]
}

output "availability_zone" {
  value = aws_instance.server.availability_zone
}